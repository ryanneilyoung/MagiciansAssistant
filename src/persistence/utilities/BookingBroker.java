package persistence.utilities;

import persistence.RelationBroker;
import problemDomain.utilities.Illusion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: An implementation of the abstract Broker interface that controls
 * how the Bookings interact with the database.
 * 
 */
public class BookingBroker
{

	//Constants
	//Attributes

	/**
	 * a method that will create a request for a PersonalShow for a Client.
	 * @param clientId the id of the Client requesting the Show.
	 * @param magicianId the id of the Magician to perform the requested Show.
	 * @param date the date and time of the requested Show.
	 * @param price the price of the requested Show.
	 * @param numKids the number of kids that will attend the Show.
	 * @param advMethod how the Client discovered the Magician.
	 * @param showLength the length of show requested.
	 * @param birthdayAge the age of the birthday child.
	 * @param nameOfChild the name of the birthday child.
	 * @return whether the request was successfully sent.
	 * Precondition: The client enters all necessary information into the system, and requests a Show.
	 * Postcondition: a request is sent to the Magician.
	 */
	public boolean bookPersonalShow(int clientId, int magicianId, Date date, String address, double price, int numKids, int advMethod,
			int showLength, int birthdayAge, String nameOfChild)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call bookPersonalShow(?,?,?,?,?,?,?,?,?,?)"))
			{
				cs.setInt(1, clientId);
				cs.setInt(2, magicianId);
				cs.setTimestamp(3, new java.sql.Timestamp(date.getTime()));
				cs.setString(4, address);
				cs.setDouble(5, price);
				cs.setInt(6, numKids);
				cs.setInt(7, advMethod);
				cs.setInt(8, showLength);
				cs.setInt(9, birthdayAge);
				cs.setString(10, nameOfChild);
				
				boolean submitted = cs.execute();
				
				cs.close();
				return submitted;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * a method that will create a request for a CorporateShow for a Client.
	 * @param clientId the id of the Client requesting the Show.
	 * @param magicianId the id of the Magician to perform the requested Show.
	 * @param date the date and time of the requested Show.
	 * @param price the price of the requested Show.
	 * @param numKids the number of kids that will attend the Show.
	 * @param advMethod how the Client discovered the Magician.
	 * @param showLength the length of show requested.
	 * @param companyName the name of the company the requested Show will be performed for.
	 * @param numOfAdults the number of adults that will attend the requested Show.
	 * @param kidShow indicated whether the show is orientated for children, or a more general crowd.
	 * @param stageShow indicated whether the Client wants the Magician to wander, or do a Show in one area.
	 * @return whether the request was successfully sent.
	 * Precondition: The client enters all necessary information into the system, and requests a Show.
	 * Postcondition: a request is sent to the Magician.
	 */
	public boolean bookCorporateShow(int clientId, int magicianId, Date date, String address, double price, int numKids, int advMethod,
			int showLength, String companyName, int numOfAdults, boolean kidShow, boolean stageShow)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call bookCorporateShow(?,?,?,?,?,?,?,?,?,?,?,?)"))
			{
				cs.setInt(1, clientId);
				cs.setInt(2, magicianId);
				cs.setTimestamp(3, new java.sql.Timestamp(date.getTime()));
				cs.setString(4, address);
				cs.setDouble(5, price);
				cs.setInt(6, numKids);
				cs.setInt(7, advMethod);
				cs.setInt(8, showLength);
				cs.setString(9, companyName);
				cs.setInt(10, numOfAdults);
				cs.setBoolean(11, kidShow);
				cs.setBoolean(12, stageShow);
				
				boolean submitted = cs.execute();
				
				cs.close();
				return submitted;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * a method that will create a request for a PersonalShow for a Client.
	 * @param clientId the id of the Client requesting the Show.
	 * @param magicianId the id of the Magician to perform the requested Show.
	 * @param date the date and time of the requested Show.
	 * @param price the price of the requested Show.
	 * @param numKids the number of kids that will attend the Show.
	 * @param advMethod how the Client discovered the Magician.
	 * @param showLength the length of show requested.
	 * @param schoolName the name of the School that the requested Show would be performed at. 
	 * @param schoolShowType the type of SchoolShow that the magician will perform. 
	 * @return whether the request was successfully sent.
	 * Precondition: The client enters all necessary information into the system, and requests a Show.
	 * Postcondition: a request is sent to the Magician.
	 */
	public boolean bookSchoolShow(int clientId, int magicianId, Date date, String address, double price, int numKids, int advMethod,
			int showLength, String schoolName, int schoolShowType)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call bookSchoolShow(?,?,?,?,?,?,?,?,?,?)"))
			{
				cs.setInt(1, clientId);
				cs.setInt(2, magicianId);
				cs.setTimestamp(3, new java.sql.Timestamp(date.getTime()));
				cs.setString(4, address);
				cs.setDouble(5, price);
				cs.setInt(6, numKids);
				cs.setInt(7, advMethod);
				cs.setInt(8, showLength);
				cs.setString(9, schoolName);
				cs.setInt(10, schoolShowType);
				
				boolean submitted = cs.execute();
				
				cs.close();
				return submitted;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	public ArrayList<Object[]> getCalendar(int id)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getClientCalendar(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					while(rs.next())
					{
						Date date = rs.getTimestamp(1);
						int showLength = rs.getInt(2);
						boolean approved = rs.getBoolean(3);
						
						Object[] array = {date, showLength, approved};
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
	 * Method to return the calendar related to the Magician.
	 * @param magicianId the id of the Magician requesting a calendar.
	 * @return an arrayList containing all information displayed to the magician front end: date of show, length of show, approval status, the showtype and the name of the client.
	 * Precondition: a Magician navigates to the manageShows jsp.
	 * Postcondition: an arrayList containing all information needed to populate the magicians calendar.
	 */
	public ArrayList<Object[]> getMagicianCalendar(int magicianId)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getMagicianCalendar(?)"))
			{
				cs.setInt(1, magicianId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					while(rs.next())
					{
						int id = rs.getInt(1);
						Date date = rs.getTimestamp(2);
						int showLength = rs.getInt(3);
						boolean approved = rs.getBoolean(4);
						int showtype = rs.getInt(5);
						String name = rs.getString(6);
						boolean performed = rs.getBoolean(7);
						
						if(showtype == 4)
						{
							String title = "Booked Off";
							Object[] array = {id, title, date, showLength, approved, showtype, performed};
							list.add(array);
						}
						else
						{
							String title = "Show for " + name;
							Object[] array = {id, title, date, showLength, approved, showtype, performed};
							list.add(array);
						}
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
	 * @return
	 * @throws SQLException 
	 */
	public void deleteBooking(int id) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call deleteBooking(?)"))
			{
				cs.setInt(1, id);
			
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param bookingId
	 * @return
	 */
	public ArrayList<Illusion> getFullIllusionList(int bookingId)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getFullShowIllusionList(?)"))
			{
				cs.setInt(1, bookingId);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					ArrayList<Illusion> illusionList = new ArrayList<>();
					
					while(rs.next())
					{
						int illusionId = rs.getInt(1);
						String name = rs.getString(2);
						int length = rs.getInt(3);
						int recomendedAge = rs.getInt(4);
						boolean seen = rs.getBoolean(5);
						Illusion illusion = new Illusion(illusionId, name, length, recomendedAge, seen);
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
	 * @param bookingId
	 * @return
	 */
	public ArrayList<Illusion> getShowIllusionList(int bookingId)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getShowIllusionList(?)"))
			{
				cs.setInt(1, bookingId);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					ArrayList<Illusion> illusionList = new ArrayList<>();
					
					while(rs.next())
					{
						int illusionId = rs.getInt(1);
						String name = rs.getString(2);
						int length = rs.getInt(3);
						int recomendedAge = rs.getInt(4);
						boolean seen = rs.getBoolean(5);
						Illusion illusion = new Illusion(illusionId, name, length, recomendedAge, seen);
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
	 * @param booking
	 * @param illusion
	 * @throws SQLException 
	 */
	public void removeIllusion(int booking, int illusion) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call removeIllusion(?,?)"))
			{
				cs.setInt(1, booking);
				cs.setInt(2, illusion);
				
				cs.execute();
				
				cs.close();
			}
		}		
	}

	/**
	 * @param booking
	 * @param illusion
	 * @throws SQLException 
	 */
	public void addIllusion(int booking, int illusion) throws SQLException
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call addIllusion(?,?)"))
			{
				cs.setInt(1, booking);
				cs.setInt(2, illusion);
				
				cs.execute();
				
				cs.close();
			}
		}
	}

	/**
	 * @param id
	 * @return
	 */
	public boolean markPerformed(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call markPerformed(?)"))
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
	 * @param magicianId
	 * @return
	 */
	public ArrayList<Object[]> getUnapprovedBookings(int magicianId)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getUnapprovedBookings(?)"))
			{
				cs.setInt(1, magicianId);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					while(rs.next())
					{
						int bookingId = rs.getInt(1);
						Date date = rs.getTimestamp(2);
						int clientId = rs.getInt(3);
						int showType = rs.getInt(4);
						double price = rs.getDouble(5);
						String address = rs.getString(6);
						int showLength = rs.getInt(7);
						String name = rs.getString(8);
						String email = rs.getString(9);
						
						Object[] array = {bookingId, date, clientId, showType, price, address, showLength, name, email};
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
	 * @return
	 */
	public boolean approveShow(int id)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call approveShow(?)"))
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
	 * @param booking
	 * @return
	 */
	public Object[] getShowInfo(int booking)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call getShowInfo(?)"))
			{
				cs.setInt(1, booking);
			
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					if(rs.next())
					{
						int showType = rs.getInt(1);
						
						String name;
						String address;
						Date date;
						String email;
						String phone;
						int numKids;
						int advMethod;
						boolean approved;
						Object[] list;
						switch (showType)
						{
							case 1:
								name = rs.getString(2);
								address = rs.getString(3);
								date = rs.getTimestamp(4);
								email = rs.getString(5);
								phone = rs.getString(6);
								numKids = rs.getInt(7);
								advMethod = rs.getInt(8);
								approved = rs.getBoolean(9);
								int age = rs.getInt(10);
								String childName = rs.getString(11);
								rs.close();
								cs.close();
								list = new Object[] {showType, date, name, address, email, phone, numKids, advMethod, approved, age, childName};
								
								break;
							case 2:
								name = rs.getString(2);
								address = rs.getString(3);
								date = rs.getTimestamp(4);
								email = rs.getString(5);
								phone = rs.getString(6);
								numKids = rs.getInt(7);
								advMethod = rs.getInt(8);
								approved = rs.getBoolean(9);
								String companyName = rs.getString(10);
								int numAdults = rs.getInt(11);
								boolean kidShow = rs.getBoolean(12);
								boolean stageShow = rs.getBoolean(13);
								rs.close();
								cs.close();
								list = new Object[] {showType, date, name, address, email, phone, numKids, advMethod, approved, companyName, numAdults, kidShow, stageShow};
								
								break;
							case 3:
								name = rs.getString(2);
								address = rs.getString(3);
								date = rs.getTimestamp(4);
								email = rs.getString(5);
								phone = rs.getString(6);
								numKids = rs.getInt(7);
								advMethod = rs.getInt(8);
								approved = rs.getBoolean(9);
								String schoolName = rs.getString(10);
								int schoolShowType = rs.getInt(11);
								rs.close();
								cs.close();
								list = new Object[] {showType, date, name, address, email, phone, numKids, advMethod, approved, schoolName, schoolShowType};
								break;
							default:
								date = rs.getTimestamp(2);
								
								rs.close();
								cs.close();
								
								list = new Object[] {showType, date};
								break;					
						}
						return list;
						
					}
					else
					{
						return new Object[] {0, "Error"};
					}
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return new Object[] {0, "Error"};
		}
	}

	/**
	 * @param id
	 * @param start
	 * @param end
	 * @return
	 */
	public boolean bookOffTime(int id, Date start, long length)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call bookOffTime(?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setTimestamp(2, new java.sql.Timestamp(start.getTime()));
				cs.setLong(3, length);
				int test = cs.executeUpdate();
				//boolean submitted = cs.execute();
				cs.close();
				return test > 0;
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
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public ArrayList<Object[]> generateBookingReport(int id, Date startDate, Date endDate)
	{
		ArrayList<Object[]> list = new ArrayList<>();
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call generateBookingReport(?,?,?)"))
			{
				cs.setInt(1, id);
				cs.setTimestamp(2, new java.sql.Timestamp(startDate.getTime()));
				cs.setTimestamp(3, new java.sql.Timestamp(endDate.getTime()));
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{				
					while(rs.next())
					{
						
						int bookingId = rs.getInt(1);
						Date date = rs.getDate(2);
						double price = rs.getDouble(3);
						int showType = rs.getInt(4);
						int numKids = rs.getInt(5);
						int advMethod = rs.getInt(6);
						int showLength = rs.getInt(7);
						int birthdayAge = rs.getInt(8);
						int numAdults = rs.getInt(9);
						boolean kidShow = rs.getBoolean(10);
						boolean stageShow = rs.getBoolean(11);
						int schoolShowType = rs.getInt(12);
						String trickName = rs.getString(13);
						
						Object[] array = {bookingId, date, price, showType,
								numKids, advMethod, showLength, birthdayAge,
								numAdults, kidShow, stageShow, schoolShowType,
								trickName};
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
