package controllers;

import persistence.RelationBroker;
import persistence.accounts.ClientBroker;
import persistence.accounts.MagicianBroker;
import persistence.utilities.BookingBroker;
import persistence.utilities.InventoryBroker;
import problemDomain.accounts.Account;
import problemDomain.accounts.ClientAccount;
import problemDomain.utilities.Illusion;
import problemDomain.utilities.SaleTrick;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import javax.mail.*;
import javax.mail.internet.*;

import exceptions.IllegalDescriptionException;
import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Magician related Use Cases
 * 
 */
public class MagicianController
{
	//Constants
	//Attributes
	//Constructors
	//Getter and Setter Methods
	//Operational Methods
	
	/**
	 * Method to return all Illusions a Magician has.
	 * @param id the id of the Magician.
	 * @return ArrayList of Illusions
	 * Precondition: Magician accesses page that Illusions.
	 * Postcondition: A list of Show Tricks is returned to the page.
	 */
	public static String getIllusions(int id)
	{
		MagicianBroker broker = new MagicianBroker();
		ArrayList <Illusion> list = broker.getIllusionList(id);
		
		String table = "";
		
		for(Illusion illusion : list)
		{
			int illusionId = illusion.getId();
			String name = illusion.getName();
			int length = illusion.getLength();
			int age = illusion.getRecomendedAge();
			table += "<tr data-toggle='tooltip' title='Click to edit trick' style='cursor:pointer' onclick='setIllusion(" + illusionId + ", \"" + name + "\", " + length + ", " + age + ")'>"
					+ " <td>"+ name + "</td><td>" + length + "</td><td>" + age + "</td></tr>";
		}
		
		return table;
	}
	
	/**
	 * Method that returns all shows occuring in the next two days.
	 * @param id the id of the Magician requesting the upcomming shows.
	 * @return ArrayList of Shows occuring in the next two days.
	 * Precondition: Magician accesses page that displays upcoming shows.
	 * Postcondition: A list of upcoming shows is returned to the servlet.
	 */
	public static String getUpcomingShows(int id)
	{
		MagicianBroker broker = new MagicianBroker();
		ArrayList<Object[]> list = broker.getUpcomingShows(id);
				
		String table = "";
		
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy hh:mm aaa");
		
		String[] showType = {"", "Personal", "Corporate", "School"};
        
		
		for(Object[] booking : list)
		{
			
			if(!(boolean) booking[8])
			{
				//String filename = generateInvoice((int) booking[0])
				/*
				String email = booking[9].toString();
				try
				{
					sendInvoice(email, "Your upcomming booking", filename);
				} catch (MessagingException e)
				{
					e.printStackTrace();
				}
				*/
				try
				{
					broker.markInvoiceSent((int) booking[0]);
				} catch (SQLException e)
				{
					e.printStackTrace();
					return null;
				}
			}
			
			String colour;
			if(booking[4].equals(true))
			{
				colour = "style='color: black; cursor:pointer;'";
			}
			else
			{
				colour = "data-toggle='tooltip' title='Show has not yet been approved' style='color: red; cursor:pointer;'";
			}
			table += "<tr " + colour + " onclick=\"window.location = 'manageIndividualShow.jsp?id=" + booking[0] + "&length=" + booking[3] + "'\" >";
			table += "<td>" + format.format(booking[1]) + "</td>";
			table += "<td>" + booking[6] + "</td>";
			table += "<td>" + booking[2] + "</td>";
			table += "<td>" + showType[(int) booking[5]] + "</td>";
			table += "<td>" + booking[7] + "</td>";
			table += "</tr>";
		}
		return table;
	}
	/*
	/**
	 * @param email
	 * @param string
	 * @param filename
	private static void sendInvoice(String to, String subject, String filename) throws MessagingException
	{
		// Step1
		Properties mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
		
		// Step2
		Session getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		MimeMessage generateMailMessage = new MimeMessage(getMailSession);
                
		generateMailMessage.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
		generateMailMessage.setSubject(subject);
		//generateMailMessage.setContent("Attached is your invoice for your upcoming show.", "text/html");
		BodyPart messageText = new MimeBodyPart();
		messageText.setText("Attached is your invoice for your upcoming show.");
		
		BodyPart messageBody = new MimeBodyPart();
		javax.activation.DataSource source = new FileDataSource(filename);
		messageBody.setDataHandler(new DataHandler(source));
		messageBody.setFileName(filename);
		
		Multipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageText);
		multipart.addBodyPart(messageBody);
		
		generateMailMessage.setContent(multipart);
		
		// Step3
		javax.mail.Transport transport = getMailSession.getTransport("smtp");
 
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", "ifoolu.test@gmail.com", "capstone");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}
	
	/**
	 * Method to return the Client list for a particular magician in an HTML format.
	 * @param id the id of the magician.
	 * @return a formatted table containing information regarding all the clients the Magician has.
	 * Precondition: The magician has navigated to the Manage Clients webpage, and a table is needed.
	 * Postcondition: a String is returned that contains the information needed to create the table.
	 */
	public static String getClientListTable(int id)
	{
		MagicianBroker broker = new MagicianBroker();
		ArrayList<ClientAccount> clientList = broker.getClientList(id);
		
		SimpleDateFormat format = new SimpleDateFormat("MMM d, yyyy");
		
		String table = "<table class='table table-striped'><thead><th>Name</th><th>Email</th><th>Last Booking</th><th>Reset Password</th><th>Delete</th></thead>";
		for(ClientAccount client : clientList)
		{
			String date;
			if(client.getLastShowBooked() == null)
			{
				date = "No Previous Bookings";
			}
			else
			{
				date = format.format(client.getLastShowBooked());
			}
			table += "<tr><td>" + client.getName() + "</td><td>"
					+ client.getEmail() + "</td><td>" + date + "</td><td><a href='ManageClientListExchange?reset=" + client.getId()
					+ "' onclick='return confirm(\"Are you sure you want to reset " + client.getName() + "&#39;s password?\")'> Reset </a></td><td> <a href='ManageClientListExchange?delete=" + client.getId()
					+ "' onclick='return confirm(\"Are you sure you want to delete " + client.getName() + "&#39;s account?\")'> Delete </a></td></tr>";
					
		}
		table += "</table>"; 
		return table;
	}
	
	/**
	 *  Method to delete a client from a Magicians Client list.
	 * @param magicianId the id of the Magician performing the deletion.
	 * @param id the id of the Client to be removed from the Client list.
	 * @return whether the operation succeeded.
	 * Precondition: A Magician presses the delete link on the Manage Clients webpage.
	 * Postcondition: A client is removed from the Magicians Client list.
	 */
	public static boolean deleteClient(int magicianId, int id)
	{
		ClientBroker broker = new ClientBroker();
		return broker.deleteClient(magicianId, id);
	}
	
	/**
	 * Method to reset a Clients password.
	 * @param id the Client that needs their password reset.
	 * @return whether the reset succeeded or not.
	 * Precondition: Someone has requested a reset of a password.
	 * Postcondition: A password is reset.
	 */
	public static boolean resetClientPassword(int id)
	{
		try
		{
			//TODO generate password and email it to Client
			ClientBroker broker = new ClientBroker();
			return broker.resetClientPassword(id);
		} catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * A method for approving a show that is currently pending.
	 * @param id the Booking id of the booking.
	 * @return whether the approval succeeded or not.
	 * Precondition: the Magician approves a show from the list of pending shows.
	 * Postcondition: the show is approved.
	 */
	public boolean approveShow(int id)
	{
		BookingBroker broker = new BookingBroker();
		try
		{
			//String to = broker.getEmails(id);
			//String subject = "Your booking request has been approved";
			//String message = "The Magician has approved your request for a booking." + "<br><br>";
			//sendEmail(to, subject, message);
			return broker.approveShow(id);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * Method to retrieve the calendar for a Client. Will return a specific Magicians calendar.
	 * @param magicianId the id of the Magician to retrieve the calendar for.
	 * @return a String containing all bookings in the database related to the magician in the format needed for the client side.
	 * Precondition: a Client selects a Magician to view their calendar.
	 * Postcondition: a String formatted to display the bookings to the Client.
	 */
	public static String getCalendar(int magicianId)
	{
		String calendar = "";
		BookingBroker broker = new BookingBroker();
		
		ArrayList<Object[]> list = broker.getMagicianCalendar(magicianId);
		Date today = new Date();
		for(Object[] show : list)
		{
			int id = (int) show[0];
			String title = show[1].toString();
			Date start = (Date) show[2];
			int length = (int) show[3];
			boolean approved = (boolean) show[4];
			int showtype = (int) show[5];
			boolean performed = (boolean) show[6];
	
			Calendar cal = Calendar.getInstance();
			cal.setTime(start);
			cal.add(Calendar.MINUTE, length);
			Date end = cal.getTime();
			
			String colour;
			if(performed)
			{
				colour = ", color: 'grey'";
			}
			else if(end.before(today))
			{
				if(broker.markPerformed(id))
				{
					colour =", color: 'grey'";
				}
				else
				{
					colour =", color: 'red'";
				}
				
			}
			else if(showtype == 1 && approved)
			{
				colour = ", color: 'blue'";
			}
			else if(showtype == 1)
			{
				//Someone else can figure out a color scheme, just know there are options avaliabile.
				colour = ", color: 'SkyBlue', borderColor: 'black', textColor: 'black'";
			}
			else if(showtype == 2 && approved)
			{
				colour = ", color: 'green'";
			}
			else if(showtype == 2)
			{
				colour = ", color: 'lightgreen', borderColor: 'black', textColor: 'black'";
			}
			else if(showtype == 3 && approved)
			{
				colour = ", color: 'purple'";
			}
			else if(showtype == 3)
			{
				colour = ", color: 'plum', borderColor: 'black', textColor: 'black'";
			}
			else if(showtype == 4)
			{
				colour = ", color: 'black', textColor: 'white'";
			}
			else
			{
				colour = ", color: 'grey'";
			}
			calendar += "{title: '" + title + "', start: '" + start + "', end: '" + end + "', description: 'Click event to view details'" + colour +  ", url: 'manageIndividualShow.jsp?id=" + id + "&length=" + length + "'},";
		}
		
		return calendar;
	}

	/**
	 * Method to deny a Show. Will delete booking from the database, and send an email to the Client informing them their show has been denied.
	 * @param id the id of the booking in the database.
	 * @return whether the deletion/email was successful or not.
	 * Precondition: A magician denies a booking request.
	 * Postcondition: The booking is deleted from the database, and an email is sent to the Client informing them their show has been denied.
	 */
	public boolean denyShow(int id)
	{
		
		BookingBroker broker = new BookingBroker();
		//String email = broker.getEmails(id);
		//String subject = "Your booking request has been denied";
		//String message = "The Magician has denied your request for a booking." + "<br><br>";
		/*
		try
		{			
			sendEmail(email, subject, message);
			broker.deleteBooking(id);
			return true;
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
			return false;
		}
		*/
		try
		{
			broker.deleteBooking(id);
		} catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * @param magicianId
	 * @return
	 */
	public static int[] getPrices(int magicianId)
	{
		MagicianBroker broker = new MagicianBroker();
		return broker.getPrices(magicianId);
	}
	
	public static void sendEmail(String to, String subject, String message) throws MessagingException
	{
		// Step1
				Properties mailServerProperties = System.getProperties();
				mailServerProperties.put("mail.smtp.port", "587");
				mailServerProperties.put("mail.smtp.auth", "true");
				mailServerProperties.put("mail.smtp.starttls.enable", "true");
				
				// Step2
				Session getMailSession = Session.getDefaultInstance(mailServerProperties, null);
				MimeMessage generateMailMessage = new MimeMessage(getMailSession);
		                
				generateMailMessage.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
				generateMailMessage.setSubject(subject);
				generateMailMessage.setContent(message, "text/html");
				
				// Step3
				javax.mail.Transport transport = getMailSession.getTransport("smtp");
		 
				// Enter your correct gmail UserID and Password
				// if you have 2FA enabled then provide App Specific Password
				transport.connect("smtp.gmail.com", "ifoolu.test@gmail.com", "capstone");
				transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
				transport.close();
		
	}

	/**
	 * @param name
	 * @param length
	 * @param age
	 * @throws IllegalNumberSizeException 
	 * @throws IllegalNameException 
	 * @throws SQLException 
	 */
	public void addIllusion(int id, String name, int length, int age) throws IllegalNameException, IllegalNumberSizeException, SQLException
	{
		MagicianBroker broker = new MagicianBroker();
		Illusion illusion = new Illusion(id, name, length, age);
		broker.addIllusion(illusion);
	}

	/**
	 * @param id
	 * @param name
	 * @param length
	 * @param age
	 * @throws IllegalNumberSizeException 
	 * @throws IllegalNameException 
	 * @throws SQLException 
	 */
	public void editIllusion(int id, String name, int length, int age) throws IllegalNameException, IllegalNumberSizeException, SQLException
	{
		MagicianBroker broker = new MagicianBroker();
		Illusion illusion = new Illusion(id, name, length, age);
		broker.editIllusion(illusion);
	}

	/**
	 * @param id
	 * @throws SQLException 
	 */
	public void deleteIllusion(int id) throws SQLException
	{
		MagicianBroker broker = new MagicianBroker();
		broker.deleteIllusion(id);
	}

	/**
	 * @param id
	 * @param start
	 * @param end
	 * @return
	 */
	public boolean bookOffTime(int id, Date start, Date end)
	{
		long duration = end.getTime() - start.getTime();
		long length = TimeUnit.MILLISECONDS.toMinutes(duration);
		BookingBroker broker = new BookingBroker();
		return broker.bookOffTime(id, start, length);
	}
	
	public static String getInventory(int id)
	{
		ArrayList <SaleTrick> list = InventoryBroker.getInventory(id);
		
		String table = "";
		
		assert list != null;
		
		NumberFormat formatter = NumberFormat.getCurrencyInstance();
		
		for(SaleTrick trick : list)
		{
			String name = trick.getName();
			double price = trick.getPrice();
			int quantity = trick.getQuantity();
			
			table += "<tr data-toggle='tooltip' title='Click to edit trick' style='cursor:pointer' onclick='setTrick(" + trick.getId() + ", \"" + name + "\", " + price + ", " + quantity + ", \"" + trick.getDescription() + "\")'>"
					+ " <td>"+ name + "</td><td>" + formatter.format(price) + "</td><td>" + quantity + "</td></tr>";
		}
		
		return table;
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
	public String addItemToInventory(int magicianId, String name, double price, int quantity, String description, String type)
	{
		InventoryBroker broker = new InventoryBroker();
		try
		{
			SaleTrick trick = new SaleTrick(0, name, price, quantity, description, null);
			return broker.addItemToInventory(magicianId, trick, type);
		}
		catch (IllegalNumberSizeException | IllegalNameException | IllegalDescriptionException e)
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
	 * @throws IllegalNameException 
	 * @throws IllegalNumberSizeException 
	 * @throws SQLException 
	 * @throws IllegalDescriptionException 
	 */
	public void editInventoryItem(int id, String name, double price, int quantity, String description) throws IllegalNumberSizeException, IllegalNameException, SQLException, IllegalDescriptionException
	{
		InventoryBroker broker = new InventoryBroker();
		SaleTrick trick = new SaleTrick(id, name, price, quantity, description, null);
		broker.editInventoryItem(trick);
	}

	/**
	 * @param id
	 * @return 
	 */
	public String deleteInventoryItem(int id)
	{
		InventoryBroker broker = new InventoryBroker();
		return broker.deleteInventoryItem(id);
	}

	/**
	 * @param id
	 * @return
	 */
	public Object[] getMagicianAccountInfo(int id)
	{
		MagicianBroker broker = new MagicianBroker();
		return broker.getMagicianAccountInfo(id);
	}

	/**
	 * @param id
	 * @param name 
	 * @throws SQLException 
	 * @throws IllegalNameException 
	 */
	public void saveMagicianName(int id, String name) throws SQLException, IllegalNameException
	{
		MagicianBroker broker = new MagicianBroker();
		Account.validateName(name);
		broker.saveMagicianName(id, name);
	}

	/**
	 * @param id
	 * @param password
	 * @throws SQLException 
	 */
	public void saveMagicianPassword(int id, String currentPassword, String password) throws SQLException
	{
		MagicianBroker broker = new MagicianBroker();
		broker.saveMagicianPassword(id, currentPassword, password);
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
		MagicianBroker broker = new MagicianBroker();
		broker.saveMagicianPrices(id, price30, price45, price60, priceCorporate, priceSchool);
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
		MagicianBroker broker = new MagicianBroker();
		broker.saveMagicianDescriptions(id, description, personalDescription, corporateDescription, schoolDescription);
	}

	/**
	 * @param id
	 * @param filename
	 * @throws SQLException 
	 */
	public void saveMagicianImage(int id, String filename) throws SQLException
	{
		MagicianBroker broker = new MagicianBroker();
		broker.saveMagicianImage(id, filename);
	}

	/**
	 * @param id
	 * @return
	 */
	public String getPreviousImage(int id)
	{
		MagicianBroker broker = new MagicianBroker();
		return broker.getPreviousImage(id);
	}	
	
}
