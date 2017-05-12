package persistence.utilities;

import persistence.RelationBroker;
import problemDomain.accounts.Account;
import problemDomain.utilities.SaleTrick;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import exceptions.IllegalEmailException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: An implementation of the abstract Broker interface that controls
 * how the Orders interact with the database.
 * 
 */
public class OrderBroker
{
	
	//Constants
	//Attributes

	public ArrayList<Object[]> getOrders(int magicianId)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getOrders(?)"))
			{
				cs.setInt(1, magicianId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					while(rs.next()){
						
						int orderId = rs.getInt(1);
						boolean shipped = rs.getBoolean(2);
						Date datePlace = rs.getTimestamp(3);
						String address = rs.getString(4);
						
						Object[] array = {orderId, shipped, datePlace, address};
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

	/**
	 * @param orderId
	 * @return
	 */
	public ArrayList<Object[]> getTricks(int orderId)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getOrderTricks(?)"))
			{
				cs.setInt(1, orderId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					while(rs.next()){
						
						String name = rs.getString(1);
						int quantity = rs.getInt(2);
						
						Object[] array = {name, quantity};
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

	/**
	 * 
	 * @param clientId
	 * @param magicianId
	 * @param address
	 * @param address1
	 * @param postal
	 * @param city
	 * @param province
	 * @param trickList
	 * @return
	 */
	public int placeOrder(int clientId, int magicianId, String address, String address1, String postal, String city, String province, ArrayList<SaleTrick> trickList)
	{
		RelationBroker broker = RelationBroker.getBroker();
		int orderId = 0;
		try(Connection conn = broker.getConnection())
		{
			conn.setAutoCommit(false);
			try(CallableStatement cs = conn.prepareCall("call placeOrder(?,?,?,?,?,?,?)"))
			{
				cs.setInt(1, clientId);
				cs.setInt(2, magicianId);
				cs.setString(3, address);
				cs.setString(4, address1);
				cs.setString(5, postal);
				cs.setString(6, city);
				cs.setString(7, province);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					if(rs.next()){
						
						orderId = rs.getInt(1);
						try(PreparedStatement ps = conn.prepareStatement("call addOrderContents(?,?,?)"))
						{
							
							for(SaleTrick trick : trickList)
							{
									ps.setInt(1, orderId);
									ps.setInt(2, trick.getId());
									ps.setInt(3, trick.getQuantity());
									ps.addBatch();
							}
							//Can use this to validate whether it was a success
							//int[] count = ps.executeBatch();
							ps.executeBatch();
							ps.close();
						}
						conn.commit();
					}
					rs.close();
					cs.close();
					return orderId;
				}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return orderId;
		}
	}

	/**
	 * @param orderId
	 * @return
	 */
	public Object[] getOrderShippingInfo(int orderId)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getOrderShippingInfo(?)"))
			{
				cs.setInt(1, orderId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						String name = rs.getString(1);
						String phone = rs.getString(2);
						String email = rs.getString(3);
						String address = rs.getString(4);
						boolean shipped = rs.getBoolean(5);
						Date date = rs.getTimestamp(6);
						double price = rs.getDouble(7);
						Date dateShipped = rs.getTimestamp(8);
						
						rs.close();
						cs.close();
						return new Object[] {name, phone, email, address, shipped, date, price, dateShipped};
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
	public void markShipped(int id) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call markShipped(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @throws SQLException 
	 */
	public void cancelOrder(int id) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call cancelOrder(?)"))
			{
				cs.setInt(1, id);
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public ArrayList<Object[]> generateOrderReport(int id, Date startDate, Date endDate)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call generateOrderReport(?,?,?)"))
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
						boolean shipped = rs.getBoolean(2);
						int clientId = rs.getInt(3);
						Date datePlaced = rs.getDate(4);
						double orderTotal = rs.getDouble(5);
						Date dateShipped = rs.getDate(6);
						String name = rs.getString(7);
						String email = rs.getString(8);
						int quantity = rs.getInt(9);
						double trickPrice = rs.getDouble(10);
						
						
						Object[] array = {orderId, shipped, clientId, datePlaced,
								orderTotal, dateShipped, name, email, quantity, trickPrice};
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

	/**
	 * @param orderId
	 * @return
	 */
	public String getOrderEmail(int orderId)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getOrderEmail(?)"))
			{
				cs.setInt(1, orderId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					if(rs.next())
					{
						String email = rs.getString(1);
						Account.validateEmail(email);
						return email;
					}
					else
					{
						return null;
					}
				}
			}
		}
		catch (SQLException|IllegalEmailException e) {
			
			e.printStackTrace();
			return null;
		}
	}
	
}
