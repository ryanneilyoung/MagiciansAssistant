package problemDomain.accounts;

import java.util.Date;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import exceptions.IllegalPhoneNumberException;

/**
 * @author Ryan Young, Sean Allen, Scott Bolstad, Tyler Power
 * @version 1.0
 *
 * Class description: This an implementation of the Account Type
 * Object with Client privileges in our system.
 * Will use this for booking shows and placing orders.
 * 
 */
public class ClientAccount extends Account
{

	//Constants
	//Attributes
	final private Date 						lastShowBooked;
	final private String					phoneNumber;
	
	//Constructors
	/**
	 * Constructor for the Client Accounts of our System
	 * @param id the database id of the Client
	 * @param name the name of the Client.
	 * @param email the email address of the Client.
	 * @param illusionsSeen a list of all illusions this Client has seen.
	 * @param lastShowBooked a Date showing when the last show booked by a client was.
	 * @param phoneNumber the phone number of the client
	 * @throws IllegalNameException 
	 * @throws IllegalPhoneNumberException 
	 * @throws IllegalEmailException 
	 */
	public ClientAccount(int id, String name, String email, Date lastShowBooked, String phoneNumber) throws IllegalNameException, IllegalPhoneNumberException, IllegalEmailException
	{
		super(id, name, email);
		
		validatePhone(phoneNumber);
		
		this.lastShowBooked = lastShowBooked;
		this.phoneNumber = phoneNumber;
	}
	//Getter and Setter Methods
	//Operational Methods	

	/**
	 * Method to return the value of lastShowBooked
	 * @return the lastShowBooked
	 */
	public Date getLastShowBooked()
	{
		return lastShowBooked;
	}
	
	/**
	 * Method to return the value of phoneNumber
	 * @return the phoneNumber
	 */
	public String getPhoneNumber()
	{
		return phoneNumber;
	}

	public static void validatePhone(String phoneNumber) throws IllegalPhoneNumberException
	{
		String regrex = "(\\d{3})-(\\d{3})-\\d{4}";
		
		if(!phoneNumber.matches(regrex))
		{
			throw new IllegalPhoneNumberException();
		}
	}
	
}
