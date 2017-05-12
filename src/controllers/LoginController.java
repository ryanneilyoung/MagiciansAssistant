package controllers;

import persistence.utilities.LoginBroker;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Login related Use Cases
 * 
 */
public class LoginController
{
	//Constants
	//Attributes
	//Constructors
	//Getter and Setter Methods
	//Operational Methods
	
	/**
	 * Method to handle the login for the system.
	 * @param email email of the account used to login
	 * @param password password of the account to be logged in.
	 * @return an array containing the type of account, id, and name.
	 * Precondition: A user provides a email and password to log in with.
	 * Postcondition: The user is passed to the correct page in the application.
	 */
	public static Object[] login(String email, String password)
	{
		LoginBroker broker = new LoginBroker();
		return broker.login(email, password);
	}
}
