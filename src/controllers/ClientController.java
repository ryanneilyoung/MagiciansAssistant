package controllers;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import exceptions.IllegalPhoneNumberException;
import persistence.accounts.ClientBroker;
import persistence.utilities.BookingBroker;
import problemDomain.accounts.ClientAccount;


/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description:A controller class
 *  to handle all Client related Use Cases
 * 
 */
public class ClientController
{
	/**
	 * Method to return the entries in the calendar for the Client Screen.
	 * @param magicianId the magician that the client wants to see the calendar for.
	 * @return String containing the script necessary to populate the calendar
	 * Precondition: A client is logged into the system and selects a magician to view the calendar for.
	 * Postcondition: A String is returned containing all bookings in the system.
	 */
	public static String getCalendar(int magicianId)
	{
		//Do i need dates?
		String calendar = "";
		BookingBroker broker = new BookingBroker();
		
		ArrayList<Object[]> list = broker.getCalendar(magicianId);
		
		for(Object[] show : list)
		{
			Date start = (Date) show[0];
			int length = (int) show[1];
			boolean approved = (boolean) show[2];
			Calendar cal = Calendar.getInstance();
			cal.setTime(start);
			cal.add(Calendar.MINUTE, length);
			Date end = cal.getTime();
			if(approved)
			{
				calendar += "{title: 'Booked', start: '" + start + "', end: '" + end + "'},";
			}
			else
			{
				calendar += "{title: 'Pending', start: '" + start + "', end: '" + end + "', color: 'grey'},";
			}
		}
		
		return calendar;
	}

	/**
	 * @param id
	 * @param name
	 * @return
	 */
	public ClientAccount getClientAccountInfo(int id, String name)
	{
		ClientBroker broker = new ClientBroker();
		return broker.getClientAccountInfo(id, name);
	}

	/**
	 * 
	 * @param id
	 * @param oldPass
	 * @param newPass
	 * @return
	 */
	public boolean changeClientPassword(int id, String oldPass, String newPass)
	{
		ClientBroker broker = new ClientBroker();
		return broker.changeClientPassword(id, oldPass, newPass);
	}

	/**
	 * @param id
	 * @param name
	 * @param email
	 * @param phoneNumber
	 * @throws IllegalPhoneNumberException 
	 * @throws IllegalNameException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalEmailException 
	 * @throws SQLException 
	 */
	public void clientSaveInfo(int id, String name, String email, String phoneNumber) throws IllegalArgumentException, IllegalNameException, IllegalPhoneNumberException, IllegalEmailException, SQLException
	{
		ClientBroker broker = new ClientBroker();
		ClientAccount client = new ClientAccount(id, name, email, null, phoneNumber);
		broker.clientSaveInfo(client);
		
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public static String getPrevOrders(int id)
	{
		ClientBroker broker = new ClientBroker();
		ArrayList<Object[]> orderList = broker.getPrevOrders(id);
		SimpleDateFormat format = new SimpleDateFormat("MMM d, yyyy");
		if(orderList != null)
		{
			String formatted = "";
			for(Object[] order : orderList)
			{
				String shipped;
				//Date Shipped
				if((boolean) order[3])
				{
					shipped = "<b>Shipping Date: </b>" + format.format(order[4]);
				}
				else
				{
					shipped = "<b>Order not Shipped </b>";
				}
				
				formatted += "<div class='row'><div class='col-sm-5'><h3>Ordered From: " + order[0]
					+ "</h3><p><b>Order Date: </b>" + format.format(order[1])
					+ "<p>" + shipped + "</p>"
					+ "</br><p><b>Order Items: </b></p>";
				for(Object[] contents: (ArrayList<Object[]>) order[6])
				{
					formatted += "<p style='text-indent: 50px;'>" + contents[0] + " - Quantity: " + contents[1] + "</p>";
				}
				
				formatted+= "</p><br><b>Order Total: $" + order[5];
					
				
				
				
				formatted += "</b></div></div><hr>";
			}
			return formatted;
		}
		else
		{
			return "No Previous Orders";
		}
	}

	/**
	 * @param id
	 * @param password 
	 * @return 
	 */
	public boolean deleteClientAccount(int id, String password)
	{
		ClientBroker broker = new ClientBroker();
		return broker.deleteClientAccount(id, password);
	}
}
