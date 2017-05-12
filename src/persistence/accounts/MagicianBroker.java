package persistence.accounts;

import persistence.RelationBroker;
import problemDomain.accounts.ClientAccount;
import problemDomain.utilities.Illusion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;
import exceptions.IllegalPhoneNumberException;
/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: An implementation of the abstract Broker interface that controls
 * how the Magicians of the system interact with the database.
 * 
 */
public class MagicianBroker
{
	//Constants
	//Attributes

	/**
	 * a method that returns all Illusions in a Magicians repertoire.
	 * @param id the id of the Magician to retrieve the illusions for.
	 * @return an ArrayList containing all illusions performed by that Magician.
	 * Precondition: a request is made to retrieve all illusions performed by a Magician.
	 * Postcondition: an ArrayList containing all illusions associated with that Magician.
	 */
	public ArrayList<Illusion> getIllusionList(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getIllusionList(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				ArrayList<Illusion> illusionList = new ArrayList<>();
				try(ResultSet rs = cs.getResultSet())
				{				
					while(rs.next())
					{
						int illusionId = rs.getInt(1);
						String name = rs.getString(2);
						int length = rs.getInt(3);
						int recomendedAge = rs.getInt(4);
						Illusion illusion = new Illusion(illusionId, name, length, recomendedAge);
						illusionList.add(illusion);
					}
					
					return illusionList;
				}
			}
		}
		catch (SQLException|IllegalNumberSizeException|IllegalNameException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * a method to return a list of all ClientAccounts associated with a Magician.
	 * @param id the id of the Magician to retrieve the list for.
	 * @return an ArrayList containing all Clients associated with the Magician.
	 * Precondition: a request is made to retrieve all Clients in a Magicians Clientlist.
	 * Postcondition: an ArrayList of all ClientAccounts related to the Magician.
	 */
	public ArrayList<ClientAccount> getClientList(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getClientList(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				ArrayList<ClientAccount> clientList = new ArrayList<>();
				
				try(ResultSet rs = cs.getResultSet())
				{
					
					while(rs.next())
					{
						int clientId = rs.getInt(1);
						String name = rs.getString(2);
						String email = rs.getString(3);
						Date lastShowBooked = rs.getDate(4);
						String phoneNumber = rs.getString(5);
						
						ClientAccount client = new ClientAccount(clientId, name, email, lastShowBooked, phoneNumber);
						
						clientList.add(client);
					}
					
					return clientList;
				}
			}
		}
		catch (SQLException|IllegalNameException|IllegalEmailException|IllegalPhoneNumberException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * a method that returns the name and id of all Magicians in the system.
	 * Used to populate the drop down menu's displayed on the client side.
	 * @return an ArrayList containing reference to the name and id of all Magicians in the system.
	 * Precondition: a request is made to retrieve a list of all Magicians in the system.
	 * Postcondition: an ArrayList is returned containing the name and id of all Magicians in the system.
	 */
	public ArrayList<Object[]> getMagicianList()
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getMagicianList()"))
			{
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{			
					while(rs.next())
					{
						int magicianId = rs.getInt(1);
						String name = rs.getString(2);
						Object[] array = {magicianId, name};
						list.add(array);
					}
					
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
	 * A method to return descriptions to the general controller, to be displayed on the index page.
	 * @param id the id of the magician to retrieve the descriptions for.
	 * @return an array of Strings containing the descriptions for the index page.
	 * Precondition: a user navigates to the index page on the application.
	 * Postcondition: an array of Strings containing the descriptions of the magician in question.
	 */
	public String[] getDescriptions(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getDescriptions(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						NumberFormat formatter = NumberFormat.getCurrencyInstance();
						String description = rs.getString(1);
						double personalPrice = rs.getDouble(2);
						String personal = rs.getString(3);
						personal = formatter.format(personalPrice) + "<span id='perhour'>/hr</span></p><p id='personal-description'>"
											+ personal;
						double corporatePrice = rs.getDouble(4);
						String corporate = rs.getString(5);
						corporate = formatter.format(corporatePrice) + "<span id='perhour'>/hr</span></p><p id='corporate-description'>"
								+ corporate;
						double schoolPrice = rs.getDouble(6);
						String school = rs.getString(7);
						school = formatter.format(schoolPrice) + "<span id='perhour'>/hr</span></p><p id='school-description'>"
								+ school;
						String image = "<img id='profile' class='img-responsive center-block' src='/Capstone/images/" + rs.getString(8) + "' alt='' style='border:6px solid #2C3E50;'>";
		
						return new String[]{description, personal, corporate, school, image};
						
					}
					else
					{
						return null;
					}
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
	 * Method to return the show prices of a Magician.
	 * @param magicianId the id of the Magician to retrieve prices for.
	 * @return a list containing all show prices for a Magician.
	 * Precondition: A Client selects a Magician to view the prices of.
	 * Postcondition: The Client is shown a list of all show prices.
	 */
	public int[] getPrices(int magicianId)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getPrices(?)"))
			{
				cs.setInt(1, magicianId);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						int price30 = rs.getInt(1);
						int price45 = rs.getInt(2);
						int price60 = rs.getInt(3);
						int corporate = rs.getInt(4);
						int school = rs.getInt(5);
						
						return new int[]{price30, price45, price60, corporate, school};	
					}
					else
					{
						return null;
					}
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
	 * @return
	 */
	public ArrayList<Object[]> getUpcomingShows(int id)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getUpcomingShows(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{	
					while(rs.next())
					{
						int bookingId = rs.getInt(1);
						Date date = rs.getTimestamp(2);
						String address = rs.getString(3);
						int showLength = rs.getInt(4);
						boolean approved = rs.getBoolean(5);
						int showtype = rs.getInt(6);
						String name = rs.getString(7);
						String phone = rs.getString(8);
						boolean invoiced = rs.getBoolean(9);
						String email = rs.getString(10);
						Object[] array = {bookingId, date, address, showLength, approved, showtype, name, phone, invoiced, email};
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
	 * @param name
	 * @param length
	 * @param age
	 * @throws SQLException 
	 */
	public void addIllusion(Illusion illusion) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call addNewIllusion(?,?,?,?)"))
			{
				cs.setInt(1, illusion.getId());
				cs.setString(2, illusion.getName());
				cs.setInt(3, illusion.getLength());
				cs.setInt(4, illusion.getRecomendedAge());
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param name
	 * @param length
	 * @param age
	 * @throws SQLException 
	 */
	public void editIllusion(Illusion illusion) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call editIllusion(?,?,?,?)"))
			{
				cs.setInt(1, illusion.getId());
				cs.setString(2, illusion.getName());
				cs.setInt(3, illusion.getLength());
				cs.setInt(4, illusion.getRecomendedAge());
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @throws SQLException 
	 */
	public void deleteIllusion(int id) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call deleteIllusion(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @return
	 */
	public Object[] getMagicianAccountInfo(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getMagicianAccountInfo(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						String name = rs.getString(1);
						double price30Min = rs.getDouble(2);
						double price45Min = rs.getDouble(3);
						double price60Min = rs.getDouble(4);
						double priceCorporate = rs.getDouble(5);
						double priceSchool = rs.getDouble(6);
						String description = rs.getString(7);
						String personalDescription = rs.getString(8);
						String corporateDescription = rs.getString(9);
						String schoolDescription = rs.getString(10);
						
						
						rs.close();
						cs.close();
						return new Object[] {name, price30Min, price45Min, price60Min, priceCorporate, priceSchool, description, personalDescription, corporateDescription, schoolDescription};
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
		catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @param id
	 * @throws SQLException 
	 */
	public void markInvoiceSent(int id) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call markInvoiceSent(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param name
	 * @throws SQLException 
	 */
	public void saveMagicianName(int id, String name) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call saveMagicianName(?,?)"))
			{
				cs.setInt(1, id);
				cs.setString(2, name);
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param currentPassword
	 * @param password 
	 * @throws SQLException 
	 */
	public void saveMagicianPassword(int id, String currentPassword, String password) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call saveMagicianPassword(?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setString(2, currentPassword);
				cs.setString(3, password);
			
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param price30
	 * @param price45
	 * @param price60
	 * @param priceCorporate
	 * @param priceSchool
	 * @throws SQLException 
	 */
	public void saveMagicianPrices(int id, double price30, double price45, double price60, double priceCorporate,
			double priceSchool) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call saveMagicianPrices(?,?,?,?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setDouble(2, price30);
				cs.setDouble(3, price45);
				cs.setDouble(4, price60);
				cs.setDouble(5, priceCorporate);
				cs.setDouble(6, priceSchool);
			
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param description
	 * @param personalDescription
	 * @param corporateDescription
	 * @param schoolDescription
	 * @throws SQLException 
	 */
	public void saveMagicianDescriptions(int id, String description, String personalDescription,
			String corporateDescription, String schoolDescription) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call saveMagicianDescriptions(?,?,?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setString(2, description);
				cs.setString(3, personalDescription);
				cs.setString(4, corporateDescription);
				cs.setString(5, schoolDescription);
			
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param filename
	 * @throws SQLException 
	 */
	public void saveMagicianImage(int id, String filename) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call saveMagicianImage(?,?)"))
			{
				cs.setInt(1, id);
				cs.setString(2, filename);
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @return
	 */
	public String getPreviousImage(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getPreviousImage(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						return rs.getString(1);
					}
					else
					{
						return null;
					}
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
