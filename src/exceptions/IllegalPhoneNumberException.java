package exceptions;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description:
 * 
 */
public class IllegalPhoneNumberException extends Exception
{

	/**
	 * @param message
	 * @param cause
	 * @param enableSuppression
	 * @param writableStackTrace
	 */
	public IllegalPhoneNumberException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace)
	{
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public IllegalPhoneNumberException(String message, Throwable cause)
	{
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public IllegalPhoneNumberException(Throwable cause)
	{
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	public IllegalPhoneNumberException()
	{
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public IllegalPhoneNumberException(String message)
	{
		super(message);
		// TODO Auto-generated constructor stub
	}

}
