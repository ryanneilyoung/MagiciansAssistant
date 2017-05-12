package exchange;

import controllers.MagicianController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ManageClientListExchange
 */
@WebServlet("/ManageClientListExchange")
public class ManageClientListExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageClientListExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String reset = request.getParameter("reset");
		String delete = request.getParameter("delete");
		int magicianId = (int) request.getSession().getAttribute("id");
		
		if(reset != null && !reset.equals(""))
		{
			int id = Integer.parseInt(reset);
			if(MagicianController.resetClientPassword(id))
			{
				response.sendRedirect("magicianClientList.jsp?message=reset successful");
			}
			else
			{
				response.sendRedirect("magicianClientList.jsp?message=reset failed");
			}
		}
		else if(delete != null && !delete.equals(""))
		{
			int id = Integer.parseInt(delete);
			if(MagicianController.deleteClient(magicianId, id))
			{
				response.sendRedirect("magicianClientList.jsp?message=deletion successful");
			}
			else
			{
				response.sendRedirect("magicianClientList.jsp?message=deletion failed");
			}
		}
		else
		{
			response.sendRedirect("magicianClientList.jsp?message=Error");
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
