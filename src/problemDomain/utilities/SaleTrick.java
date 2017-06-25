package problemDomain.utilities;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import exceptions.IllegalDescriptionException;
import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

/**
 * @author Ryan Young, Sean Allen, Scott Bolstad, Tyler Power
 * @version 1.0
 *
 * Class description: Object representing the tricks that will
 * be sold by a magician in their online store.
 * The system will generate the ID for the trick.
 * 
 */
public class SaleTrick implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5176016876061085509L;
	//Constants
	//Attributes
	private final int id;
	private final String name;
	private final double price;
	private final int quantity;
	private final String description;
	private final String imageLocation;
	
	//Constructors
	
	/**
	 * A Constructor for a Illusion object representing a trick
	 * @param id the ID of the trick.
	 * @param name the name of the trick. 
	 * @param price the price of the trick set by the magician.
	 * @param quantity the quantity of tricks contained in the store.
	 * @param description the description of the trick.
	 * @param imageLocation the file path to the image associated with the trick.
	 * @throws IllegalNumberSizeException 
	 * @throws IllegalNameException 
	 */
	public SaleTrick(int id, String name, double price, int quantity, String description, String imageLocation) throws IllegalNumberSizeException, IllegalNameException, IllegalDescriptionException
	{
		validatePrice(price);
		validateQuantity(quantity);
		validateName(name);
		//validateDescription(description);
		
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
		this.imageLocation = imageLocation;
	}
	
	//Getter and Setter Methods
	//Operational Methods

	/**
	 * Method to return the value of imageLocation
	 * @return the imageLocation
	 */
	public String getImageLocation()
	{
		return imageLocation;
	}

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
	 * Method to return the value of price
	 * @return the price
	 */
	public double getPrice()
	{
		return price;
	}

	/**
	 * Method to return the value of quantity
	 * @return the quantity
	 */
	public int getQuantity()
	{
		return quantity;
	}

	/**
	 * Method to return the value of description
	 * @return the description
	 */
	public String getDescription()
	{
		return description;
	}

	
	public static void validatePrice(double price) throws IllegalNumberSizeException
	{
		if(price <= 0 )
		{
			throw new IllegalNumberSizeException();
		}
	}
	
	public static void validateQuantity(int quantity) throws IllegalNumberSizeException
	{
		if(quantity < 0)
		{
			throw new IllegalNumberSizeException();
		}
	}
	
	public static void validateName(String name) throws IllegalNameException
	{
		Pattern pattern = Pattern.compile("[~#@*+%{}<>\\[\\]|\"\'\\_^]");
	    Matcher matcher = pattern.matcher(name);
	    if(matcher.find())
	    {
	    	throw new IllegalNameException();
	    }
	}
	
	public static void validateDescription(String description) throws IllegalNameException
	{
		Pattern pattern = Pattern.compile("[~#@*+%{}<>\\[\\]|\"\'\\_^]");
	    Matcher matcher = pattern.matcher(description);
	    if(matcher.find())
	    {
	    	throw new IllegalNameException();
	    }
	}
}
