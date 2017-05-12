package exchange;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.OrderController;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class OrderExchange
 */
@WebServlet("/OrderExchange")
public class OrderExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderShipped = request.getParameter("orderShipped");
		String cancelOrder = request.getParameter("cancelOrder");
		int id = Integer.parseInt(request.getParameter("order"));
		OrderController controller = new OrderController();
		
		try
		{
			if(orderShipped != null && !orderShipped.equals(""))
			{
				controller.markShipped(id);
				
				response.sendRedirect("manageIndividualOrder.jsp?id="+id);
			}
			else if(cancelOrder != null && !cancelOrder.equals(""))
			{
				controller.cancelOrder(id);
				
				response.sendRedirect("manageOrders.jsp");
			}
			else
			{
				response.sendRedirect("LogoutExchange");
			}
		}
		catch(SQLException e)
		{
			response.sendRedirect("LogoutExchange");
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
