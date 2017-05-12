package exchange;

import javax.naming.InvalidNameException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.MagicianController;
import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class ManageIllusionExchange
 */
@WebServlet("/ManageIllusionExchange")
public class ManageIllusionExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageIllusionExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String addIllusion = request.getParameter("addIllusion");
			String editIllusion = request.getParameter("editIllusion");
			String deleteIllusion = request.getParameter("deleteIllusion");
			String name = request.getParameter("illusionName");
			int length = Integer.parseInt(request.getParameter("illusionLength"));
			int age = Integer.parseInt(request.getParameter("recommendedAge"));
			MagicianController controller = new MagicianController();
			if(addIllusion != null && !addIllusion.equals("") )
			{	
				int id = (int) request.getSession().getAttribute("id");
				controller.addIllusion(id, name, length, age);
				response.sendRedirect("manageIllusions.jsp");
			}
			else if(editIllusion != null && !editIllusion.equals("") )
			{
				int id = Integer.parseInt(request.getParameter("illusionId"));
				controller.editIllusion(id, name, length, age);
				response.sendRedirect("manageIllusions.jsp");
			}
			else if(deleteIllusion != null && !deleteIllusion.equals("") )
			{
				int id = Integer.parseInt(request.getParameter("illusionId"));
				controller.deleteIllusion(id);
				response.sendRedirect("manageIllusions.jsp");
			}
			else
			{
				response.sendRedirect("manageIllusions.jsp?message=All fields required");
			}
		}
		catch(NumberFormatException | NullPointerException | SQLException
				| IllegalNumberSizeException | IllegalNameException e)
		{
			response.sendRedirect("manageIllusions.jsp?message=Invalid format");
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
