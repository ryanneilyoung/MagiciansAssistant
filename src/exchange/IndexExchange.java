package exchange;

import controllers.GeneralController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class IndexExchange
 */
@WebServlet("/IndexExchange")
public class IndexExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			int id = Integer.parseInt(request.getParameter("id"));
			String[] descriptions = GeneralController.getDescription(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("magicianDescription", descriptions[0]);
			session.setAttribute("personalDescription", descriptions[1]);
			session.setAttribute("corporateDescription", descriptions[2]);
			session.setAttribute("schoolDescription", descriptions[3]);
			session.setAttribute("image", descriptions[4]);
			response.sendRedirect("index.jsp");
		}
		catch(NumberFormatException e)
		{
			response.sendRedirect("index.jsp");
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
