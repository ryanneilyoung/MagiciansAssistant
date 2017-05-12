package exchange;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ClientController;

/**
 * Servlet implementation class ClientChangePasswordExchange
 */
@WebServlet("/ClientChangePasswordExchange")
public class ClientChangePasswordExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientChangePasswordExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//oldPass
		//newPass
		//confirmPass
		
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String confirmPass = request.getParameter("confirmPass");
		
		if(oldPass != null && newPass != null && confirmPass != null && !oldPass.equals("") && !newPass.equals("") && !confirmPass.equals(""))
		{
			if(newPass.equals(confirmPass))
			{
				int id = (int) request.getSession().getAttribute("id");
				ClientController controller = new ClientController();
				
				if(controller.changeClientPassword(id, oldPass, newPass))
				{
					response.sendRedirect("clientChangePassword.jsp?message=Success");
				}
				else
				{
					response.sendRedirect("clientChangePassword.jsp?message=Incorrect Password");
				}
			}
			else
			{
				response.sendRedirect("clientChangePassword.jsp?message=Passwords must match");
			}
		}
		else
		{
			response.sendRedirect("clientChangePassword.jsp?message=All fields required");
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
