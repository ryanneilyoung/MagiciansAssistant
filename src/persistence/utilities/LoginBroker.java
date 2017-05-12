package persistence.utilities;

import persistence.RelationBroker;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: An implementation of the abstract Broker interface that handles the login features of our application.
 * 
 */
public class LoginBroker
{
	
	//Constants
	//Attributes

	/**
	 * a method to validate a User log in.
	 * @param email the email of the User
	 * @param password the password of the User
	 * @return an array that contains the type of User, the appropriate id of the User, and the name of the User.
	 * Precondition: a User attempts to log into the system.
	 * Postcondition: the user is directed to the appropriate page, and all necessary information is saved into their session.
	 */
	public Object[] login(String email, String password)
	{
		RelationBroker broker = RelationBroker.getBroker();
		try(Connection conn = broker.getConnection())
		{
			try(CallableStatement cs = conn.prepareCall("call userValidate(?,?)"))
			{
				cs.setString(1, email);
				cs.setString(2, password);
				
				cs.execute();
				
				try(ResultSet rs = cs.getResultSet())
				{
					Object[] result = new Object[3];
					
					if(rs.next())
					{
						//Type of Account
						result[0] = rs.getString(1);
						//id of User
						result[1] = rs.getInt(2);
						//Name of User
						result[2] = rs.getString(3);				
					}
					else
					{
						result[0] = "error";
					}
					rs.close();
					cs.close();
					return result;
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return new String[] {"error"};
		}
	}
}
