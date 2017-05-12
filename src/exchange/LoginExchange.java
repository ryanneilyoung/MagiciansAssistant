package exchange;

import controllers.LoginController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class LoginExchange
 */
@WebServlet("/LoginExchange")
public class LoginExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		if(email != null && password !=null && !email.equals("") && !password.equals(""))
		{
			HttpSession session = request.getSession();
			Object test[] = LoginController.login(email, password);
			switch (test[0].toString()) {
				case "Admin":
					session.setAttribute("type", "Admin");
					session.setAttribute("id", test[1]);
					session.setAttribute("name", test[2]);
					response.sendRedirect("manageMagicians.jsp");
					break;
				case "Magician":
					session.setAttribute("type", "Magician");
					session.setAttribute("id", test[1]);
					session.setAttribute("name", test[2]);
					response.sendRedirect("upcomingShows.jsp");
					break;
				case "Client":
					session.setAttribute("type", "Client");
					session.setAttribute("id", test[1]);
					session.setAttribute("name", test[2]);
					response.sendRedirect("ClientCalendarExchange");
					break;
				default:
					response.sendRedirect("login.jsp?message=Invalid email or password");
					break;
			}
		}
		else
		{
			response.sendRedirect("login.jsp?message=all fields required");
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
