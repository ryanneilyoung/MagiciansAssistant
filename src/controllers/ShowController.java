package controllers;

import persistence.utilities.BookingBroker;
import problemDomain.accounts.Account;
import problemDomain.utilities.Illusion;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import exceptions.IllegalNameException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Show related Use Cases
 * 
 */
public class ShowController
{
	//Constants
	//Attributes
	//Constructors
	//Getter and Setter Methods
	//Operational Methods
		
	/**
	 * A method to return a list of all unapproved Bookings in the system.
	 * @param magicianId the id of the Magician logged into the system.
	 * @return an ArrayList of unapproved Bookings belonging to the Magician.
	 * Precondition: a Magician requests a list of unapproved Bookings.
	 * Postcondition: the Magician is given a list of all unapproved Bookings in the system.
	 */
	public static String getUnapprovedShows(int magicianId)
	{
		String table = "<table class='table table-hover'><thead><th>Name</th><th>Email</th><th>Date</th><th>Length</th><th>Address</th><th>Type</th><th>Approve</th><th>Deny</th></thead>";
		
		BookingBroker broker = new BookingBroker();
		
		ArrayList<Object[]> showList = broker.getUnapprovedBookings(magicianId);
		
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy hh:mm aaa");
		
		for(Object[] booking : showList)
		{
			String type;
			if(booking[3].equals(1))
			{
				type = "Personal";
			}
			else if(booking[3].equals(2))
			{
				type = "Corporate";
			}
			else if(booking[3].equals(3))
			{
				type = "School";
			}
			else
			{
				System.out.println(booking[4]);
				return "We've encountered an error";
			}
			
			table += "<tr onclick=\"window.location = 'manageIndividualShow.jsp?id=" + booking[0] + "&length=" + booking[6] + "'\" >"
					+ "<td>" + booking[7] + "</td><td>" + booking[8] + "</td>" 
					+ "<td>" + format.format(booking[1]) + "</td><td>" + booking[6] + "</td><td>" + booking[5] + "</td><td>"
					+ type + "</td><td><a href='ShowExchange?approve="
					+ booking[0] + "' id='approve' style='color: green;'>Approve <i class='fa fa-check'></i></a> </td><td><a href='ShowExchange?deny="
					+ booking[0] + "'  onclick='return confirm(\"Are you sure you want to deny " + booking[7] + "&#39;s show?\")' id='deny'style='color: red;'>Deny <i class='fa fa-times'></i></a></td> </tr>";
		}
		table += "</table>";
		return table;
	}

	/**
	 * Method to request a Personal show. 
	 * @param clientId the Client requesting a new show
	 * @param magicianId the Magician to perform the show.
	 * @param date the date and time of the show.
	 * @param price the price of the show.
	 * @param numKids the number of kids that will be present at the show.
	 * @param advMethod how the client found out about the Magician.
	 * @param showLength the length of the show requested.
	 * @param birthdayAge the age of the birthday child
	 * @param nameOfChild the name of the birthday child.
	 * Precondition: A client enters all neccesary information and requests a show.
	 * Postcondition: The show is entered into the system, marked as not approved and awaits magician approval.
	 * @throws IllegalNameException 
	 */
	public void bookPersonalShow(int clientId, int magicianId, Date date, String address, double price, int numKids, int advMethod, int showLength, int birthdayAge, String nameOfChild) throws IllegalNameException
	{
		Account.validateName(nameOfChild);
		Account.validateName(address);
		BookingBroker broker = new BookingBroker();
		broker.bookPersonalShow(clientId, magicianId, date, address, price, numKids, advMethod, showLength, birthdayAge, nameOfChild);
	}
	
	/**
	 * Method to request a Corporate show. 
	 * @param clientId the Client requesting a new show
	 * @param magicianId the Magician to perform the show.
	 * @param date the date and time of the show.
	 * @param price the price of the show.
	 * @param numKids the number of kids that will be present at the show.
	 * @param advMethod how the client found out about the Magician.
	 * @param showLength the length of the show requested.
	 * @param companyName the name of the Company to be performed for.
	 * @param numOfAdults the number of adults that will be at the show.
	 * @param kidShow whether the show will be centered for kids or adults.
	 * @param stageShow whether the client wants the magician to do walk around magic, or a stage show.
	 * Precondition: a client enters all neccesary information and requests a show.
	 * Postcondition: the show is entered into the system, marked as not approved and awaits magician approval.
	 * @throws IllegalNameException 
	 */
	public void bookCorporateShow(int clientId, int magicianId, Date date, String address, double price, int numKids, int advMethod, int showLength, String companyName, int numOfAdults, boolean kidShow, boolean stageShow) throws IllegalNameException
	{
		Account.validateName(companyName);
		Account.validateName(address);
		BookingBroker broker = new BookingBroker();
		broker.bookCorporateShow(clientId, magicianId, date, address, price, numKids, advMethod, showLength, companyName, numOfAdults, kidShow, stageShow);
	}
	
	/**
	 * Method to request a Personal show. 
	 * @param clientId the Client requesting a new show
	 * @param magicianId the Magician to perform the show.
	 * @param date the date and time of the show.
	 * @param price the price of the show.
	 * @param numKids the number of kids that will be present at the show.
	 * @param advMethod how the client found out about the Magician.
	 * @param showLength the length of the show requested.
	 * @param schoolName the name of the school to be performed at.
	 * @param schoolShowType the type of school show to be performed.
	 * Precondition: A client enters all neccesary information and requests a show.
	 * Postcondition: The show is entered into the system, marked as not approved and awaits magician approval.
	 * @throws IllegalNameException 
	 */
	public void bookSchoolShow(int clientId, int magicianId, Date date, String address, double price, int numKids, int advMethod, int showLength, String schoolName, int schoolShowType) throws IllegalNameException
	{
		Account.validateName(schoolName);
		BookingBroker broker = new BookingBroker();
		broker.bookSchoolShow(clientId, magicianId, date, address, price, numKids, advMethod, showLength, schoolName, schoolShowType);
		
	}
	
	/**
	 * a method that returns a drop down menu containing all Magicians in the system.
	 * @param list a list containing references to all Magicians in the system and their id's. 
	 * @return a formatted drop down menu containing all Magicians in the system.
	 * Precondition: a Client logs into the system and is brought to the clientbooking page.
	 * Postcondition: a drop down menu containing a list of all Magicians in the system is returned.
	 */
	public static String getDropDownListCalendar(ArrayList<Object[]> list)
	{
		String formattedList = "";
		
		for(Object[] magician : list)
		{
			int id = (int) magician[0];
			String name = magician[1].toString();
			
			formattedList += "<li><a href=ClientCalendarExchange?id=" + id + ">" + name + "</a></li>" ;
		}
		
		return formattedList;
	}
	
	public static String getFullIllusionList(int bookingId)
	{
		BookingBroker broker = new BookingBroker();
		ArrayList<Illusion> illusions = broker.getFullIllusionList(bookingId);
		
		String formatted = "";
		
		for(Illusion illusion : illusions)
		{
			if(illusion.isSeen())
			{
				formatted += "<tr style='color: red;' onclick='setIllusionNum(" + illusion.getId() + ", false)'>";
			}
			else
			{
				formatted += "<tr onclick='setIllusionNum(" + illusion.getId() + ", false)'>";
			}
			formatted += "<td>"+ illusion.getName() + "</td><td>" + illusion.getLength() + "</td><td>" + illusion.getRecomendedAge() + "</td></tr>";
		}
		
		return formatted;
	}
	
	public static String getShowIllusionList(int bookingId, int length)
	{
		BookingBroker broker = new BookingBroker();
		ArrayList<Illusion> illusions = broker.getShowIllusionList(bookingId);
		
		String formatted = "<div class='table-responsive pre-scrollable' style='overflow-y: auto;'><table class='table table-hover' id='showIllusions' name='showIllusions'><thead><tr><th>Illusion Name</th><th>Length</th><th>Recommended Age</th></tr></thead><tbody>";
		int counter = 0;
		for(Illusion illusion : illusions)
		{
			counter += illusion.getLength();
			if(illusion.isSeen())
			{
				formatted += "<tr style='color: red;' onclick='setIllusionNum(" + illusion.getId() + ", true)'>";
			}
			else
			{
				formatted += "<tr onclick='setIllusionNum(" + illusion.getId() + ", true)'>";
			}
			formatted += "<td>"+ illusion.getName() + "</td><td>"
			+ illusion.getLength() + "</td><td>" + illusion.getRecomendedAge() + "</td></tr>";
		}
		//The addition of 11 minutes is for balloon animals and the dove
		if(counter + 8 > length)
		{
			formatted = formatted + "</tbody></table></div>" + "<br><h1 style='color: red;'>Length is: " + counter + " minutes</h1>";
			//formatted = "<br><h1 style='color: red;'>Length is: " + counter + " minutes</h1>" + formatted +  "</tbody></table>";
		}
		else
		{
			formatted = formatted + "</tbody></table></div>" + "<br><h1>Length is: " + counter + " minutes</h1><br><br>";
			//formatted = "<br><h1>Length is: " + counter + " minutes</h1>" + formatted + "</tbody></table>";
		}
		return formatted;
	}

	/**
	 * @param booking
	 * @param illusion
	 * @throws SQLException 
	 */
	public void removeIllusion(int booking, int illusion) throws SQLException
	{
		BookingBroker broker = new BookingBroker();
		broker.removeIllusion(booking, illusion);
	}

	/**
	 * @param booking
	 * @param illusion
	 * @throws SQLException 
	 */
	public void addIllusion(int booking, int illusion) throws SQLException
	{
		BookingBroker broker = new BookingBroker();
		broker.addIllusion(booking, illusion);
	}
	
	/**
	 * 
	 * @param booking
	 * @return
	 */
	public static String getShowInfo(int booking)
	{
		BookingBroker broker = new BookingBroker();
		Object[] list = broker.getShowInfo(booking);
		
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy hh:mm aaa");
		
		int type = (int) list[0];
		Date date = (Date) list[1];
		String info;
		
		String[] advertisementMethod = {"", "Return Customer", "Refferal", "Mailings", "Calgary's Child", "Google", "Gigmasters", "Gigsalad", "Other"};
        String[] schoolShowType = {"", "Early Literacy (Kindergarten)", "Challenge Your Senses! (Grade One)", "Magical Colours! (Grade One)", "Magic of Magnets! (Grade Two)", "The ABC's of Character (Grades K-6)", "The Magic of Reading (Grades K-9)", "Beyond Bullying (K-9)"};
        
		
		switch (type)
		{
			case 1:
				info = "<h2>Personal Show</h2><br>"
						+ "<table class='table table-striped'> <tr>"
						+ "<td>Date: </td><td>" + format.format(date)
						+ "</td></tr>"
						+ "<tr><td>Client Name: </td><td>" + list[2]
						+ "<tr><td>Address: </td><td>" + list[3]
						+ "<tr><td>Client Email: </td><td>" + list[4]
						+ "<tr><td>Phone Number: </td><td>" + list[5]
						+ "<tr><td>Number of Kids: </td><td>" + list[6]
						+ "<tr><td>Advertisement Method: </td><td>" + advertisementMethod[(int) list[7]]
						+ "<tr><td>Approved: </td><td>" + list[8]
						+ "<tr><td>Child Age: </td><td>" + list[9]
						+ "<tr><td>Child Name: </td><td>" + list[10]
						+ "</td></tr></table>";
				break;
				
			case 2:
				info = "<h2>Corporate Show</h2><br>"
						+ "<table class='table table-striped'> <tr>"
						+ "<td>Date: </td><td>" + format.format(date)
						+ "</td></tr>"
						+ "<tr><td>Client Name: </td><td>" + list[2]
						+ "<tr><td>Address: </td><td>" + list[3]
						+ "<tr><td>Client Email: </td><td>" + list[4]
						+ "<tr><td>Phone Number: </td><td>" + list[5]
						+ "<tr><td>Number of Kids: </td><td>" + list[6]
						+ "<tr><td>Advertisement Method: </td><td>" + advertisementMethod[(int) list[7]]
						+ "<tr><td>Approved: </td><td>" + list[8]
						+ "<tr><td>Company Name: </td><td>" + list[9]
						+ "<tr><td>Number of Adults: </td><td>" + list[10]
						+ "<tr><td>Kid Show: </td><td>" + list[11]
						+ "<tr><td>Stage Show: </td><td>" + list[12]
						+ "</td></tr></table>";
				break;
				
			case 3:
				info = "<h2>School Show</h2><br>"
						+ "<table class='table table-striped'> <tr>"
						+ "<td>Date: </td><td>" + format.format(date)
						+ "</td></tr>"
						+ "<tr><td>Client Name: </td><td>" + list[2]
						+ "<tr><td>Address: </td><td>" + list[3]
						+ "<tr><td>Client Email: </td><td>" + list[4]
						+ "<tr><td>Phone Number: </td><td>" + list[5]
						+ "<tr><td>Number of Kids: </td><td>" + list[6]
						+ "<tr><td>Advertisement Method: </td><td>" + advertisementMethod[(int) list[7]]
						+ "<tr><td>Approved: </td><td>" + list[8]
						+ "<tr><td>School Name: </td><td>" + list[9]
						+ "<tr><td>School Show Type: </td><td>" + schoolShowType[(int) list[10]]
						+ "</td></tr></table>";
				break;
				
			default:
				info = "<h2>Booked off time</h2><br>"
						+ "<table class='table table-striped'> <tr>"
						+ "<td>Date: </td><td>" + format.format(date)
						+ "</td></tr></table>";
				break;
		}
		
		return info;
	}

	/**
	 * @param list
	 * @return
	 */
	public static String getDropDownListPrices(ArrayList<Object[]> list)
	{
String formattedList = "";
		
		for(Object[] magician : list)
		{
			int id = (int) magician[0];
			String name = magician[1].toString();
			
			formattedList += "<li><a href=ClientPricingExchange?id=" + id + ">" + name + "</a></li>" ;
		}
		
		return formattedList;
	}
}
