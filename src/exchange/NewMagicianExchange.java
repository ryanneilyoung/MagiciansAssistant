package exchange;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.AdminController;

/**
 * Servlet implementation class NewMagicianExchange
 */
@WebServlet("/NewMagicianExchange")
public class NewMagicianExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMagicianExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			double price30 = Double.parseDouble(request.getParameter("30MinPrice"));
			double price45 = Double.parseDouble(request.getParameter("45MinPrice"));
			double price60 = Double.parseDouble(request.getParameter("60MinPrice"));
			double priceCorporate = Double.parseDouble(request.getParameter("corporatePrice"));
			double priceSchool = Double.parseDouble(request.getParameter("schoolPrice"));
			
			
			if(name != null && email != null && !name.equals("") && !email.equals(""))
			{
					AdminController controller = new AdminController();
					try
					{
						if(controller.addMagician(name, email, price30, price45, price60, priceCorporate, priceSchool))
						{
							response.sendRedirect("manageMagicians.jsp");
						}
						else
						{
							response.sendRedirect("newMagician.jsp");
						}
						
					}
					catch (Exception e)
					{
						response.sendRedirect("newMagician.jsp?message=invalid");
					}
					
				}
			else
			{
				response.sendRedirect("newMagician.jsp?message=all fields required");
			}
		}
		catch(NumberFormatException|NullPointerException e)
		{
			response.sendRedirect("login.jsp");
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
