package exchange;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.GeneralController;
import controllers.ShowController;

/**
 * Servlet implementation class ClientPricingExchange
 */
@WebServlet("/ClientPricingExchange")
public class ClientPricingExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientPricingExchange() {
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
		String li = ShowController.getDropDownListPrices(list);
		session.setAttribute("dropDown", li);
		
		try
		{
			int magicianId = Integer.parseInt(request.getParameter("id"));
			// TODO GET PRICES FOR MAGIC SHOWS HERE
			String[] prices = GeneralController.getDescription(magicianId);
			
			session.setAttribute("schoolPrice", prices[3]);
			session.setAttribute("personalPrice", prices[1]);
			session.setAttribute("corporatePrice", prices[2]);
			
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
			response.sendRedirect("clientSidePricing.jsp");
		}
		catch(NullPointerException | NumberFormatException e)
		{
			response.sendRedirect("clientSidePricing.jsp");
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
