package exchange;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

import controllers.OrderController;
import problemDomain.utilities.SaleTrick;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

/**
 * Servlet implementation class PlaceOrderExchange
 */
@WebServlet("/PlaceOrderExchange")
public class PlaceOrderExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrderExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String cart = request.getParameter("passCart");
		
	
		if(cart != null && !cart.equals("[]"))
		{
			ArrayList<SaleTrick> trickList = parse(cart);
			
			HttpSession session = request.getSession();
			
			int clientId = (int) session.getAttribute("id");
			int magicianId = (int) session.getAttribute("magicianId");
			
			String address = request.getParameter("address");
			String address1 = request.getParameter("apartment");
			String postal = request.getParameter("zip");
			String city = request.getParameter("city");
			String province = request.getParameter("province");
			
			if(address != null && postal != null && city != null && province != null)
			{
				OrderController controller = new OrderController();
				boolean check = controller.placeOrder(clientId, magicianId, address, address1, postal, city, province, trickList);
				if(check){
					response.sendRedirect("clientViewOrder.jsp?deleteCart=yes");
				}
				else{
					response.sendRedirect("clientViewOrder.jsp?deleteCart=wrong");
				}
			}
			else
			{
				response.sendRedirect("clientViewOrder.jsp?message=All fields required");
			}
		}
	}

	
	private ArrayList<SaleTrick> parse(String jsonLine) {
		
		 Type listType = new TypeToken<ArrayList<SaleTrick>>() {}.getType();
         return new Gson().fromJson(jsonLine, listType);
	}

	
}


