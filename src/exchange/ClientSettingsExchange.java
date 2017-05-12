package exchange;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.ClientController;
import exceptions.IllegalEmailException;
import exceptions.IllegalNameException;
import exceptions.IllegalPhoneNumberException;

/**
 * Servlet implementation class ClientSettingsExchange
 */
@WebServlet("/ClientSettingsExchange")
public class ClientSettingsExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientSettingsExchange()
    {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		
		if(name != null && email != null && phoneNumber !=null && !name.equals("") && !email.equals("") && !phoneNumber.equals(""))
		{
			HttpSession session = request.getSession();
			int id = (int) session.getAttribute("id");
			
			ClientController controller = new ClientController();
			try
			{
				controller.clientSaveInfo(id, name, email, phoneNumber);
				
				session.setAttribute("name", name);
				
				response.sendRedirect("ClientAccountExchange");
				
			} catch (IllegalNameException e)
			{
				e.printStackTrace();
				response.sendRedirect("clientSettings.jsp?message=Invalid Name");
			} catch (IllegalPhoneNumberException e)
			{
				e.printStackTrace();
				response.sendRedirect("clientSettings.jsp?message=Invalid Phone Number");
			} catch (IllegalEmailException e)
			{
				e.printStackTrace();
				response.sendRedirect("clientSettings.jsp?message=Invalid Email");
			} catch (SQLException e)
			{
				e.printStackTrace();
				response.sendRedirect("clientSettings.jsp?message=Error, please try again later");
			}			
		}
		else
		{
			response.sendRedirect("clientSettings.jsp?message=All fields required");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
