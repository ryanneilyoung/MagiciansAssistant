package controllers;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import exceptions.IllegalPhoneNumberException;
import persistence.accounts.ClientBroker;
import problemDomain.accounts.ClientAccount;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Registration related Use Cases
 * 
 */
public class RegistrationController
{
	/**
	 * Method that allows a Client to register an account with the system.
	 * @param name The Clients name.
	 * @param email the Clients email.
	 * @param password the Clients password.
	 * @param phone the Clients phone number.
	 * @return The ClientAccount created by the system.
	 * @throws Exception if the format of data is incorrect.
	 * Precondition: A client has added all the information into the Register webpage, and requested an account.
	 * Postcondition: The client is logged into the system with their new account.
	 */
	public ClientAccount registerClient(String name, String email, String password, String phone)
	{
		ClientBroker broker = new ClientBroker();
		ClientAccount client;
		try
		{
			client = new ClientAccount(0, name, email, null, phone);
		}
		catch (IllegalArgumentException | IllegalNameException | IllegalPhoneNumberException
				| IllegalEmailException e){
			e.printStackTrace();
			return null;
		}
        return broker.registerUser(client, password);
	}

	/**
	 * A method that allows a Magician to create a new Client.
	 * @param magicianId the id of the Magician creating the new Client.
	 * @param name the name of the Client.
	 * @param email the email of the Client.
	 * @param phone the phone number of the Client.
	 * @return whether the client was added to the system.
	 * Precondition: A Magician has entered all necessary information about a Client and requested a new account.
	 * Postcondition: A new Client is added to the system and the Magician is brought to their Client list.
	 */
	public boolean registerNewClient(int magicianId, String name, String email, String phone)
	{
		ClientBroker broker = new ClientBroker();

		String password = "password";
		/*
		 * ALL of this can be collapsed into one try catch if the email functionality is present.
		String message = "A magician has made an account for you. Your log in will be this email, and the following password. <br> password: " + password;
		try
		{
			MagicianController.sendEmail(email, "Your account has been created", message);
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
			return false;
		}
		*/
		ClientAccount client;
		try
		{
			client = new ClientAccount(0, name, email, null, phone);
		}
		catch (IllegalArgumentException | IllegalNameException | IllegalPhoneNumberException
				| IllegalEmailException e){
			e.printStackTrace();
			return false;
		}
		
		return broker.registerNewUser(magicianId, client, password);
	}
}
