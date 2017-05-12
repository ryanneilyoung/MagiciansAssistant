package persistence;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: a class to establish the connection to the database given the connection information
 * 
 */
public class RelationBroker
{
	//Constants
	
	//Attributes
	private DataSource ds = null;
	private static RelationBroker relationBroker;
	
	/**
	 * This is a private constructor to create the RelationBroker. This is an implementation of the Singleton Method. 
	 */
	private RelationBroker()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			InitialContext ic = new InitialContext();
			final String dataPool = "jdbc/CapstonePool";
			ds = (DataSource) ic.lookup(dataPool);
		}
		catch (ClassNotFoundException | NamingException e)
		{
			e.printStackTrace();
		}

    }
	
	/**
	 * Method to access the connection pool and request a connection.
	 * @return connection to the database.
	 * @throws SQLException
	 * Precondition: a broker requests a database connection.
	 * Postcondition: a connection is returned to the broker.
	 */
	public Connection getConnection() throws SQLException
	{
		return getBroker().ds.getConnection();
	}

	/**
	 * Method to access the RelationBroker as it implements the Singleton Pattern.
	 * @return a reference to the RelationBroker
	 * Precondition: a broker requests an instance of RelationBroker.
	 * Postcondition: a reference is returned. 
	 */
	public static RelationBroker getBroker()
	{
		if(relationBroker == null)
		{
			relationBroker = new RelationBroker();
		}
		return relationBroker;
	}
}
