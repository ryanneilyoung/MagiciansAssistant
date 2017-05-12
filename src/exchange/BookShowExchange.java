package exchange;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.ShowController;

/**
 * Servlet implementation class BookShowExchange
 */
@WebServlet("/BookShowExchange")
public class BookShowExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookShowExchange() {
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
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
			int clientId = (int) session.getAttribute("id");
			int magicianId = (int) session.getAttribute("magicianId");
			String dateString = request.getParameter("date");
			String address = request.getParameter("address");
			String time = request.getParameter("starttime");
			Date date = dateFormat.parse(dateString + " " + time);
			int numKids = Integer.parseInt(request.getParameter("numkids"));
			int advMethod = Integer.parseInt(request.getParameter("advertising"));
			int showLength = Integer.parseInt(request.getParameter("showlength"));
			String showType = request.getParameter("confirm");
			int[] prices = (int[]) session.getAttribute("prices");
			ShowController controller = new ShowController();
			switch (showType)
			{
                case "school":
                    String schoolName = request.getParameter("schoolname");
                    int schoolShowType = Integer.parseInt(request.getParameter("schoolShowType"));
                    controller.bookSchoolShow(clientId, magicianId, date, address, prices[4], numKids, advMethod, showLength, schoolName, schoolShowType);
                    response.sendRedirect("ClientCalendarExchange?id=" + magicianId);
                    break;
               
                case "personal":
                    int price;
                    if (showLength == 30)
                    {
                        price = prices[0];
                    }
                    else if (showLength == 45)
                    {
                        price = prices[1];
                    }
                    else if (showLength == 60)
                    {
                        price = prices[2];
                    }
                    else
                    {
                        throw new Exception();
                    }
                    int birthdayAge = Integer.parseInt(request.getParameter("childAge"));
                    String nameOfChild = request.getParameter("childname");
                    controller.bookPersonalShow(clientId, magicianId, date, address, price, numKids, advMethod, showLength, birthdayAge, nameOfChild);
                    response.sendRedirect("ClientCalendarExchange?id=" + magicianId);
                    break;
                
                case "corporate":
                    String companyName = request.getParameter("companyname");
                    int numOfAdults = Integer.parseInt(request.getParameter("numadults"));
                    boolean kidShow = Boolean.parseBoolean(request.getParameter("kidShow"));
                    boolean stageShow = Boolean.parseBoolean(request.getParameter("stageShow"));
                    controller.bookCorporateShow(clientId, magicianId, date, address, prices[3], numKids, advMethod, showLength, companyName, numOfAdults, kidShow, stageShow);
                    response.sendRedirect("ClientCalendarExchange?id=" + magicianId);
                    break;
                    
                default:
                	response.sendRedirect("clientBooking.jsp?message=Invalid show type");
                    break;
	            }
			
		} catch (Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("clientBooking.jsp?message=Error parsing information");
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
