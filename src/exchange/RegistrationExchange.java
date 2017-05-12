package exchange;

import controllers.RegistrationController;
import problemDomain.accounts.ClientAccount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class RegistrationExchange
 */
@WebServlet("/RegistrationExchange")
public class RegistrationExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String phone = request.getParameter("phone");
		if(name != null && email != null && password != null && confirm != null && phone != null && !name.equals("") && !email.equals("") && !password.equals("") && !confirm.equals("") && !phone.equals(""))
		{
			if(confirm.equals(password))
			{
				RegistrationController controller = new RegistrationController();
				ClientAccount client;
				try
				{
					client = controller.registerClient(name, email, password, phone);
					HttpSession session = request.getSession();
					session.setAttribute("type", "Client");
					session.setAttribute("id", client.getId());
					session.setAttribute("name", client.getName());
					response.sendRedirect("ClientCalendarExchange");
				}
				catch (Exception e)
				{
					response.sendRedirect("registration.jsp?message=invalid");
				}
				
			}
			else
			{
				response.sendRedirect("registration.jsp?message=passwords do not match");
			}
		}
		else
		{
			response.sendRedirect("registration.jsp?message=all fields required");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
