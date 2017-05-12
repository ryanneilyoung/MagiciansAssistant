package exchange;

import controllers.ClientController;
import controllers.MagicianController;
import controllers.ShowController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class CalendaryExchange
 */
@WebServlet("/ClientCalendarExchange")
public class ClientCalendarExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientCalendarExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//noinspection unchecked
		ArrayList<Object[]> list = (ArrayList<Object[]>) session.getAttribute("magicianList");
		String li = ShowController.getDropDownListCalendar(list);
		session.setAttribute("dropDown", li);
		try
		{
			int magicianId = Integer.parseInt(request.getParameter("id"));
			String calendar = ClientController.getCalendar(magicianId);
			
			int[] prices = MagicianController.getPrices(magicianId);
			session.setAttribute("prices", prices);
			session.setAttribute("calendarValues", calendar);
			session.setAttribute("magicianId", magicianId);
			String name = null;
			for(Object[] magician : list)
			{
				if(Integer.parseInt(magician[0].toString()) == magicianId)
				{
					name = magician[1].toString();
				}
			}
			session.setAttribute("magicianName", name);
			response.sendRedirect("clientBooking.jsp");
		}
		catch(NullPointerException | NumberFormatException e)
		{
			response.sendRedirect("clientBooking.jsp");
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
