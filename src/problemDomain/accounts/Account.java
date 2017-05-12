package problemDomain.accounts;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;

/**
 * @author Ryan Young, Sean Allen, Scott Bolstad, Tyler Power
 * @version 1.0
 *
 * Class description: This is the contract specification for the Superclass
 * of all accounts in the system. All Accounts will have an Id, a name, email and password.
 * the id will be assigned by the system. 
 * 
 */
public abstract class Account
{

	
	//Constants
	//Attributes
	private final int 		id;
	private final String 	name;
	private final String 	email;
	//Constructors
	
	/**
	 * Constructor for the superclass of all Account type classes
	 * @param id the database id of the Account
	 * @param name the name of the Account
	 * @param email the email of the Account
	 * @throws IllegalNameException 
	 * @throws IllegalEmailException 
	 */
	Account(int id, String name, String email) throws IllegalArgumentException, IllegalNameException, IllegalEmailException
	{
		validateEmail(email);
		validateName(name);
		//Program will determine ID of Account
		this.id = id;
		this.name = name;
		this.email = email;
	}
	
	//Getter and Setter Methods
	
	/**
	 * Method to return the value of id
	 * @return the id
	 */
	public int getId()
	{
		return id;
	}

	/**
	 * Method to return the value of name
	 * @return the name
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * Method to return the value of email
	 * @return the email
	 */
	public String getEmail()
	{
		return email;
	}
	//Operational Methods
	
	public static void validateName(String name) throws IllegalNameException
	{
		Pattern pattern = Pattern.compile("[~#@*+%{}<>\\[\\]|\"\'\\_^]");
	    Matcher matcher = pattern.matcher(name);
	    if(matcher.find())
	    {
	    	throw new IllegalNameException();
	    }
	}
	
	public static void validateEmail(String email) throws IllegalEmailException
	{
		String regrex = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        
		if(!email.matches(regrex))
		{
			throw new IllegalEmailException();
		}
	}
	
}
