package controllers;

import persistence.accounts.MagicianBroker;

import java.util.ArrayList;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class for a user not logged into the system.
 * 
 */
public class GeneralController
{

	/**
	 * A method that retrieves a list of magicians in the system.
	 * @return Array list containing the name and id of the magicians in the system.
	 * Precondition: the index page is being accessed with no session variable instantiated yet.
	 * Postcondition: an array filled with magicians is returned to the index page.
	 */
	public ArrayList<Object[]> getMagicianList()
	{
		MagicianBroker broker = new MagicianBroker();

		return broker.getMagicianList();
	}

	/**
	 * A method to populate a drop down menu on the index page that contains a list of magicians in the system.
	 * @param list an arrayList populated with references to every magician and their id in the system.
	 * @return a formatted string that will display the drop down menu.
	 * Precondition: the system has just gotten a list of magicians, and will pass it to this method.
	 * Postcondition: the system returns a formatted drop down menu.
	 */
	public String getDropDownListIndex(ArrayList<Object[]> list)
	{
		String formattedList = "";
		
		for(Object[] magician : list)
		{
			int id = (int) magician[0];
			String name = magician[1].toString();
			
			formattedList += "<li><a href=IndexExchange?id=" + id + ">" + name + "</a></li>" ;
		}
		return formattedList;
	}

	/**
	 * Method to retrieve descriptions for the index page of our application. 
	 * @param id the id of the Magician to view the description for.
	 * @return an array containing all descriptions needed to be displayed on the index page.
	 * Precondition: a User navigates to the index page.
	 * Postcondition: an array is returned containing the descriptions on the front page.
	 */
	public static String[] getDescription(int id)
	{
		MagicianBroker broker = new MagicianBroker();
		return broker.getDescriptions(id);
	}
	
}
