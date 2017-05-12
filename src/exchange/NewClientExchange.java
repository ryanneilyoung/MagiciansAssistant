package exchange;

import controllers.RegistrationController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class NewClientExchange
 */
@WebServlet("/NewClientExchange")
public class NewClientExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClientExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		if(name != null && email != null && phone != null && !name.equals("") && !email.equals("") && !phone.equals(""))
		{
				RegistrationController controller = new RegistrationController();
				try
				{
					int magicianId = (int) request.getSession().getAttribute("id");
					if(controller.registerNewClient(magicianId, name, email, phone))
					{
						response.sendRedirect("magicianClientList.jsp");
					}
					else
					{
						response.sendRedirect("newClient.jsp?message=Client not saved");
					}
					
				}
				catch (NumberFormatException | NullPointerException e)
				{
					response.sendRedirect("newClient.jsp?message=invalid");
				}
				
			}
		else
		{
			response.sendRedirect("newClient.jsp?message=all fields required");
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
