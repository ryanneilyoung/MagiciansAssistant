package exchange;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.MagicianController;

/**
 * Servlet implementation class ShowExchange
 */
@WebServlet("/ShowExchange")
public class ShowExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String approve = request.getParameter("approve");
		String deny = request.getParameter("deny");
		String delete = request.getParameter("delete");
		
		if(approve != null && !approve.equals(""))
		{
			int id = Integer.parseInt(approve);
			MagicianController controller = new MagicianController();
			if(controller.approveShow(id))
			{
				response.sendRedirect("pendingShows.jsp?message=successfully approved show");
			}
			else
			{
				response.sendRedirect("pendingShows.jsp?message=error approving show");
			}
		}
		else if(deny != null && !deny.equals(""))
		{
			int id = Integer.parseInt(deny);
			MagicianController controller = new MagicianController();
			if(controller.denyShow(id))
			{
				response.sendRedirect("pendingShows.jsp?message=successfully denied show");
			}
			else
			{
				response.sendRedirect("pendingShows.jsp?message=error denying show");
			}	
		}
		else if(delete != null && !delete.equals(""))
		{
			int id = Integer.parseInt(delete);
			MagicianController controller = new MagicianController();
			if(controller.denyShow(id))
			{
				response.sendRedirect("pendingShows.jsp?message=successfully deleted show");
			}
			else
			{
				response.sendRedirect("pendingShows.jsp?message=error deleting show");
			}	
		}
		else
		{
			response.sendRedirect("pendingShows.jsp?message=error");
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
