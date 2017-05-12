package controllers;

import java.io.File;
import java.util.ArrayList;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import persistence.accounts.AdminBroker;
import problemDomain.accounts.MagicianAccount;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Administrator related Use Cases
 * 
 */
public class AdminController
{
	//Constants
	//Attributes
	//Constructors
	//Getter and Setter Methods
	//Operational Methods
	
	/**
	 * Method to add Magician to the application
	 * @param name name of the Magician account to be created.
	 * @param email email of the Magician account to be created.
	 * @param priceSchool 
	 * @param priceCorporate 
	 * @param price60 
	 * @param price45 
	 * @param price30 
	 * @return whether the account was created.
	 * Precondition: Administrator inputs nessecary information to the application.
	 * Postcondition: A Magician Account is created.
	 */
	public boolean addMagician(String name, String email, double price30, double price45, double price60, double priceCorporate, double priceSchool)
	{
		AdminBroker broker = new AdminBroker();
		//AUTO GENERATE THIS
		String password = "password";
		try
		{
			MagicianAccount magician = new MagicianAccount(0, name, email);
			return broker.addMagician(magician, password, price30, price45, price60, priceCorporate, priceSchool);
		} catch (IllegalArgumentException | IllegalNameException | IllegalEmailException e)
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
	public static String getMagicianListTable()
	{
		AdminBroker broker = new AdminBroker();
		ArrayList<MagicianAccount> magicianList = broker.getMagicianList();
		String table = "<table class='table table-striped'><thead><th>Name</th><th>Email</th><th>Reset Password</th><th>Delete</th></thead>";
		for(MagicianAccount magician : magicianList)
		{
			table += "<tr><td>" + magician.getName() + "</td><td>"
					+ magician.getEmail() + "</td><td><a href='AdminMagicianListExchange?reset=" + magician.getId()
					+ "' onclick='return confirm(\"Are you sure you want to reset " + magician.getName()
					+ "&#39;s password?\")'> Reset </a> </td><td> <a href='AdminMagicianListExchange?delete=" + magician.getId()
					+ "' onclick='return confirm(\"Are you sure you want to delete " + magician.getName()
					+ "&#39;s account?\")'> Delete </a> </td></tr>";
					
		}
		table += "</table>"; 
		return table;
	}

	/**
	 * @param id
	 * @return
	 */
	public static boolean resetMagicianPassword(int id)
	{
		AdminBroker broker = new AdminBroker();
		return broker.resetMagicianPassword(id);
	}

	/**
	 * @param id
	 * @return
	 */
	public static boolean deleteMagician(int id)
	{
		AdminBroker broker = new AdminBroker();
		String filename = broker.deleteMagician(id);
		
		if(filename.equals("default.jpg"))
		{
			return true;
		}
		else
		{
			File f = new File("C:\\res\\images\\" + filename);
			
			return f.delete();
		}		
	}
}
