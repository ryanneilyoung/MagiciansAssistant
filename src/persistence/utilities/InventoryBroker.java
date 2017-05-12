package persistence.utilities;

import persistence.RelationBroker;
import problemDomain.utilities.SaleTrick;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import exceptions.IllegalDescriptionException;
import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: An implementation of the abstract Broker interface that controls the inventory in the database.
 * 
 */
public class InventoryBroker
{
	
	//Constants
	//Attributes

	/**
	 * @param magicianId
	 * @return
	 */
	public static ArrayList<SaleTrick> getInventory(int magicianId)
	{
		ArrayList<SaleTrick> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getInventory(?)"))
			{
				cs.setInt(1, magicianId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					while(rs.next())
					{
						int id = rs.getInt(1);
						String name = rs.getString(2);
						double price = rs.getDouble(3);
						int quantity = rs.getInt(4);
						String description = rs.getString(5);
						String imageLocation = rs.getString(6);
						
						SaleTrick trick = new SaleTrick(id, name, price, quantity, description, imageLocation);
						list.add(trick);
					}
					rs.close();
					cs.close();
					return list;
				}
			}
			
		} catch (SQLException | IllegalNameException | IllegalNumberSizeException | IllegalDescriptionException e) {
			
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @param magicianId 
	 * @param name
	 * @param price
	 * @param quantity
	 * @param description
	 * @param type 
	 * @return
	 */
	public String addItemToInventory(int magicianId, SaleTrick trick, String fileType)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call addItemToInventory(?,?,?,?,?,?)"))
			{
				cs.setInt(1, magicianId);
				cs.setString(2, trick.getName());
				cs.setDouble(3, trick.getPrice());
				cs.setInt(4, trick.getQuantity());
				cs.setString(5, trick.getDescription());
				cs.setString(6, fileType);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					String filepath;
					if(rs.next())
					{
						filepath = rs.getString(1);
					}
					else
					{
						throw new SQLException();
					}
					rs.close();
					cs.close();
					return filepath;
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
	 * @param name
	 * @param price
	 * @param quantity
	 * @param description
	 * @throws SQLException 
	 */
	public void editInventoryItem(SaleTrick trick) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call editInventoryItem(?,?,?,?,?)"))
			{
				cs.setInt(1, trick.getId());
				cs.setString(2, trick.getName());
				cs.setDouble(3, trick.getPrice());
				cs.setInt(4, trick.getQuantity());
				cs.setString(5, trick.getDescription());
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @return 
	 */
	public String deleteInventoryItem(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call deleteInventoryItem(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					String filepath;
					
					if(rs.next())
					{
						filepath = rs.getString(1);
					}
					else
					{
						throw new SQLException();
					}
					
					rs.close();
					cs.close();
					return filepath;
					
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
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public ArrayList<Object[]> generateTrickSalesReport(int id, Date startDate, Date endDate)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call generateTrickSalesReport(?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setTimestamp(2, new java.sql.Timestamp(startDate.getTime()));
				cs.setTimestamp(3, new java.sql.Timestamp(endDate.getTime()));
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					while(rs.next())
					{
						
						int orderId = rs.getInt(1);
						String trickName = rs.getString(2);
						int quantity = rs.getInt(3);
						double price = rs.getDouble(4);
						Date date = rs.getDate(5);
						double orderTotal = rs.getDouble(6);
						
						Object[] array = {orderId, trickName, quantity,
								price, date, orderTotal};
						list.add(array);
					}
					rs.close();
					cs.close();
					return list;
				}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
	}

}
