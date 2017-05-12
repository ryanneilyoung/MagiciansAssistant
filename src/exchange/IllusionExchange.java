package exchange;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ShowController;

/**
 * Servlet implementation class IllusionExchange
 */
@WebServlet("/IllusionExchange")
public class IllusionExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IllusionExchange() {
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
			String remove = request.getParameter("remove");
			String add = request.getParameter("add");
			int booking = Integer.parseInt(request.getParameter("booking"));
			int illusion = Integer.parseInt(request.getParameter("illusion"));
			int length = Integer.parseInt(request.getParameter("length"));
			if(remove != null && !remove.equals("") )
			{
				ShowController controller = new ShowController();
				controller.removeIllusion(booking, illusion);
				response.sendRedirect("manageIndividualShow.jsp?id=" + booking + "&length=" + length);
			}
			else if(add != null && !add.equals(""))
			{
				ShowController controller = new ShowController();
				controller.addIllusion(booking, illusion);
				response.sendRedirect("manageIndividualShow.jsp?id=" + booking + "&length=" + length);
			}
			else
			{
				response.sendRedirect("manageIndividualShow.jsp?id=" + booking + "&length=" + length);
			}
		}
		catch(NullPointerException | NumberFormatException | SQLException e)
		{
			e.printStackTrace();
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
