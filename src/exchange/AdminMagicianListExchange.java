package exchange;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.AdminController;

/**
 * Servlet implementation class AdminMagicianListExchange
 */
@WebServlet("/AdminMagicianListExchange")
public class AdminMagicianListExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMagicianListExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reset = request.getParameter("reset");
		String delete = request.getParameter("delete");
		
		if(reset != null && !reset.equals(""))
		{
			int id = Integer.parseInt(reset);
			if(AdminController.resetMagicianPassword(id))
			{
				response.sendRedirect("manageMagicians.jsp?message=reset successful");
			}
			else
			{
				response.sendRedirect("manageMagicians.jsp?message=reset failed");
			}
		}
		else if(delete != null && !delete.equals(""))
		{
			int id = Integer.parseInt(delete);
			if(AdminController.deleteMagician(id))
			{
				response.sendRedirect("manageMagicians.jsp?message=deletion successful");
			}
			else
			{
				response.sendRedirect("manageMagicians.jsp?message=deletion failed");
			}
		}
		else
		{
			response.sendRedirect("manageMagicians.jsp?message=Error");
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
