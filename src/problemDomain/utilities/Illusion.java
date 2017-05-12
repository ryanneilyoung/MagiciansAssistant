package problemDomain.utilities;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

/**
 * @author Ryan Young, Sean Allen, Scott Bolstad, Tyler Power
 * @version 1.0
 *
 * Class description: Object representing the illusions that will
 * be performed by a magician at different shows.
 * The system will generate the ID for the illusion.
 * 
 */
public class Illusion
{

	
	//Constants
	//Attributes
	private final int id;
	private final String name;
	private final int length;
	private final int recomendedAge;
	private final boolean seen;
	
	//Constructors
	
	/**
	 * A Constructor for a Illusion object representing a illusion
	 * a Magician can perform. The system will create the Id for the illusion.
	 * @param id the database id of the illusion.
	 * @param name the name of the illusion.
	 * @param length the length that the illusion will take to perform.
	 * @param recomendedAge the age the illusion is best suited to being performed for.
	 * @throws IllegalNameException 
	 * @throws IllegalNumberSizeException 
	 */
	public Illusion(int id, String name, int length, int recomendedAge) throws IllegalNameException, IllegalNumberSizeException
	{
		validateName(name);
		validateAge(recomendedAge);
		validateLength(length);
		this.id = id;
		this.name = name;
		this.length = length;
		this.recomendedAge = recomendedAge;
		this.seen = false;
	}
	
	//Getter and Setter Methods
	
	/**
	 * @param illusionId
	 * @param name
	 * @param length
	 * @param recomendedAge
	 * @param seen
	 * @throws IllegalNameException 
	 * @throws IllegalNumberSizeException 
	 */
	public Illusion(int illusionId, String name, int length, int recomendedAge, boolean seen) throws IllegalNameException, IllegalNumberSizeException
	{
		validateName(name);
		validateAge(recomendedAge);
		validateLength(length);
		this.id = illusionId;
		this.name = name;
		this.length = length;
		this.recomendedAge = recomendedAge;
		this.seen = seen;
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
	 * Method to return the value of length
	 * @return the length
	 */
	public int getLength()
	{
		return length;
	}

	/**
	 * Method to return the value of recomendedAge
	 * @return the recomendedAge
	 */
	public int getRecomendedAge()
	{
		return recomendedAge;
	}

	/**
	 * Method to return the value of seen
	 * @return the seen
	 */
	public boolean isSeen()
	{
		return seen;
	}
	
	//Operational Methods
	
	public static void validateAge(int age) throws IllegalNumberSizeException
	{
		if(age <= 0 || age > 99)
		{
			throw new IllegalNumberSizeException();
		}
	}
	
	public static void validateLength(int length) throws IllegalNumberSizeException
	{
		if(length <= 0 || length > 30)
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
}
