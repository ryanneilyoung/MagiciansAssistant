package exchange;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.ClientController;
import problemDomain.accounts.ClientAccount;

/**
 * Servlet implementation class ClientAccountExchange
 */
@WebServlet("/ClientAccountExchange")
public class ClientAccountExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientAccountExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int id = (int) session.getAttribute("id");
		String name = session.getAttribute("name").toString();
		
		ClientController controller = new ClientController();
		ClientAccount info = controller.getClientAccountInfo(id, name);
		
		session.setAttribute("email", info.getEmail());
		session.setAttribute("phone", info.getPhoneNumber());
		
		response.sendRedirect("clientSettings.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
