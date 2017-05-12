package exchange;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.MagicianController;

/**
 * Servlet implementation class BookOffTimeExchange
 */
@WebServlet("/BookOffTimeExchange")
public class BookOffTimeExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookOffTimeExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
			HttpSession session = request.getSession();
			int id = (int) session.getAttribute("id");
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
			
			String startTime = request.getParameter("starttime");
			String endTime = request.getParameter("endtime");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			if(startDate != null && !startDate.equals("") && endDate != null && !endDate.equals(""))
			{
				Date start;
				Date end;
				
				if(startTime != null && !startTime.equals(""))
				{
					start = dateFormat.parse(startDate + " " + startTime);
				}
				else
				{
					start = dateFormat.parse(startDate + " 00:00 AM");
				}
				
				if(endTime != null && !endTime.equals(""))
				{
					end = dateFormat.parse(endDate + " " + endTime);
				}
				else
				{
					end = dateFormat.parse(endDate + " 00:00 AM");
				}
				
				if(start.before(end))
				{
					MagicianController controller = new MagicianController();
					if(controller.bookOffTime(id, start, end))
					{
						response.sendRedirect("bookOffTime.jsp?message=Success");
					}
					else
					{
						response.sendRedirect("bookOffTime.jsp?message=You have shows during those days");
					}
					
				}
				else
				{
					response.sendRedirect("bookOffTime.jsp?message=Dates are reversed");
				}
				
			}
			else
			{
				response.sendRedirect("bookOffTime.jsp?message=Both dates must be filled");
			}
		}
		catch (ParseException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("bookOffTime.jsp?message=Error reading dates");
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
