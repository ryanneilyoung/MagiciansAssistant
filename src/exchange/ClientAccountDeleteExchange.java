package exchange;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.ClientController;

/**
 * Servlet implementation class ClientAccountDeleteExchange
 */
@WebServlet("/ClientAccountDeleteExchange")
public class ClientAccountDeleteExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientAccountDeleteExchange() {
        super();
        }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("confirmPass");
		if(password != null && !password.equals(""))
		{
			int id = (int) request.getSession().getAttribute("id");
			ClientController controller = new ClientController();
			if(controller.deleteClientAccount(id, password))
			{
				response.sendRedirect("LogoutExchange");
			}
			else
			{
				response.sendRedirect("clientAccountDelete.jsp?message=Invalid Password");
			}
		}
		else
		{
			response.sendRedirect("clientAccountDelete.jsp?message=All fields required");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
