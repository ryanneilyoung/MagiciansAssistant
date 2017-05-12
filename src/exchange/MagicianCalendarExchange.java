package exchange;

import controllers.MagicianController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class MagicianCalendarExchange
 */
@WebServlet("/MagicianCalendarExchange")
public class MagicianCalendarExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagicianCalendarExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try
		{
			int magicianId = (int) session.getAttribute("id");
			String calendar = MagicianController.getCalendar(magicianId);
			session.setAttribute("calendarValues", calendar);
			response.sendRedirect("manageShows.jsp");
		}
		catch(NullPointerException | NumberFormatException e)
		{
			response.sendRedirect("manageShows.jsp");
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
