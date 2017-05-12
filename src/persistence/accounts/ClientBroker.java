package persistence.accounts;

import persistence.RelationBroker;
import persistence.utilities.OrderBroker;
import problemDomain.accounts.ClientAccount;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import exceptions.IllegalPhoneNumberException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: An implementation of the abstract Broker interface that controls
 * how the Clients of the system interact with the database.
 * 
 */
public class ClientBroker
{
	//Constants
	//Attributes

	/**
	 * Method to persist a new ClientAccount into the database.
	 * @param name the name of the new ClientAccount.
	 * @param email the email of the new ClientAccount.
	 * @param password the password of the new ClientAccount.
	 * @param phone the phone number of the new ClientAccount.
	 * @return a reference to the new ClientAccount.
	 * Precondition: a Client has entered all neccessary information, and requested an Account. the Controller has passed this along to the broker.
	 * Postcondition: A Client is added to the database, and a reference to the new account is returned.
	 */
	public ClientAccount registerUser(ClientAccount client, String password)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			int id;
			try(CallableStatement cs = conn.prepareCall("call addClient(?,?,?,?)"))
			{
				cs.setString(1, client.getName());
				cs.setString(2, client.getEmail());
				cs.setString(3, password);
				cs.setString(4, client.getPhoneNumber());
			
				cs.executeUpdate();
			
				try(ResultSet rs = cs.getResultSet())
				{			
					if(rs.next())
					{
						id = rs.getInt(1);
					}
					else
					{
						return null;
					}
	
					return new ClientAccount(id, client.getName(), client.getEmail(), null, client.getPhoneNumber());
				}
			}
		}
		catch (SQLException|IllegalEmailException|IllegalPhoneNumberException|IllegalNameException e)
		{
			return null;
		}		
	}

	/**
	 * A method that allows a Magician to create a new User in the System.
	 * @param magicianId the id of the Magician creating the account.
	 * @param client a Client account object holding name, email, and phone number.
	 * @param password the password of the client.
	 * @return whether the client was successfully added to the system.
	 * Precondition: The Magician enters all necessary information into the system.
	 * Postcondition: The Client is added to the system, and the Magician is returned to their client list.
	 */
	public boolean registerNewUser(int magicianId, ClientAccount client, String password)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call magicianAddClient(?,?,?,?,?)"))
			{
				cs.setInt(1, magicianId);
				cs.setString(2, client.getName());
				cs.setString(3, client.getEmail());
				cs.setString(4, password);
				cs.setString(5, client.getPhoneNumber());
				
				boolean submitted = cs.execute();
				System.out.println(submitted);
				cs.close();
				return submitted;
			}
		}
		catch (SQLException e)
		{
			return false;
		}	
	}

	/**
	 * Method that returns information regarding a Client account.
	 * @param clientId the client account needed to retrieve information for.
	 * @return a reference to the ClientAccount object.
	 * Precondition: a Client logs into the system.
	 * Postcondition: all information associated with the client is returned to the system.
	 */
	public ClientAccount getClient(int clientId)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getClient(?)"))
			{
				cs.setInt(1, clientId);
				
				cs.executeQuery();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						String name = rs.getString(1);
						String email = rs.getString(2);
						Date lastShowBooked = rs.getDate(3);
						String phoneNumber = rs.getString(4);
						return new ClientAccount(clientId, name, email, lastShowBooked, phoneNumber);
					}
					else
					{
						return null;
					}
				}
			}
		}
		catch (SQLException|IllegalEmailException|IllegalPhoneNumberException|IllegalNameException e)
		{
			return null;
		}
	}

	/**
	 * A method used to delete a Client from a Magicians ClientList
	 * @param magicianId the Magician deleting the client.
	 * @param id the id of the Client to be removed from the Magicians ClientList
	 * @return whether the Client was removed
	 * Precondition: A Magician presses a link to signify that he wishes to remove a Client from his list.
	 * Postcondition: the Client is removed from the Magicians ClientList.
	 */
	public boolean deleteClient(int magicianId, int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call deleteClient(?,?)"))
			{
				cs.setInt(1, magicianId);
				cs.setInt(2, id);

				cs.execute();
				
				cs.close();
				return true;	
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * A magician wishes to reset a Clients password.
	 * @param id the id of the Client to reset the password for.
	 * @return whether the password was reset successfully.
	 * Precondition: the magician clicks a link signifying that he wishes to reset a clients password.
	 * Postcondition: the password is reset.
	 */
	public boolean resetClientPassword(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call resetClientPassword(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				cs.close();
				return true;	
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * A method to retrieve a clients information for edititing.
	 * @param id the id of the client to retrieve the information for.
	 * @return the email and phone number of the client. The ID and Name are already stored in the session.
	 * Precondition: A client navigates to the Client Settings page.
	 * Postcondition: The client email and phone number are retrieved by the system. 
	 */
	public ClientAccount getClientAccountInfo(int id, String name)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getClientAccountInfo(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						String email = rs.getString(1);
						String phone = rs.getString(2);
						
						rs.close();
						cs.close();
						return new ClientAccount(id, name, email, null, phone);
					}
					else
					{
						rs.close();
						cs.close();
						return null;
					}
				}
			}	
		}
		catch (SQLException|IllegalEmailException|IllegalPhoneNumberException|IllegalNameException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @param id
	 * @param oldPass
	 * @param newPass
	 * @return
	 */
	public boolean changeClientPassword(int id, String oldPass, String newPass)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call changeClientPassword(?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setString(2, oldPass);
				cs.setString(3, newPass);
				
				return cs.execute();	
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * @param id
	 * @param name
	 * @param email
	 * @param phoneNumber
	 * @throws SQLException 
	 */
	public void clientSaveInfo(ClientAccount client) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call clientSaveInfo(?,?,?,?)"))
			{
				cs.setInt(1, client.getId());
				cs.setString(2, client.getName());
				cs.setString(3, client.getEmail());
				cs.setString(4, client.getPhoneNumber());
				
				cs.execute();
				
				cs.close();	
			}
		}
	}

	/**
	 * @param id
	 * @return
	 */
	public ArrayList<Object[]> getPrevOrders(int id)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getPrevOrders(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				OrderBroker orderBroker = new OrderBroker();
				
				try(ResultSet rs = cs.getResultSet())
				{	
					while(rs.next())
					{
						int orderId = rs.getInt(1);
						String name = rs.getString(2);
						Date placed = rs.getTimestamp(3);
						String address = rs.getString(4);
						boolean shipped = rs.getBoolean(5);
						Date dateShipped = rs.getTimestamp(6);
						double price = rs.getDouble(7);
						ArrayList<Object[]> contents = orderBroker.getTricks(orderId);
						
						Object[] array = {name, placed, address, shipped, dateShipped, price, contents};
						list.add(array);
					}
					
					cs.close();
					return list;
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @param id
	 * @param password 
	 * @return 
	 */
	public boolean deleteClientAccount(int id, String password)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call deleteClientAccount(?,?)"))
			{
				cs.setInt(1, id);
				cs.setString(2, password);

				return cs.execute();	
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
}
