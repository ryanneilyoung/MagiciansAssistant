package exchange;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.OrderController;

/**
 * Servlet implementation class ClientStoreExchange
 */
@WebServlet("/ClientStoreExchange")
public class ClientStoreExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientStoreExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		OrderController controller = new OrderController();
		
		ArrayList<Object[]> list = (ArrayList<Object[]>) session.getAttribute("magicianList");
		String li = controller.getDropDownListInventory(list);
		
		session.setAttribute("dropDown", li);
		try
		{
			int magicianId = Integer.parseInt(request.getParameter("id"));
			
			String store = controller.getInventory(magicianId);
			
			session.setAttribute("store", store);
			
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
			response.sendRedirect("clientOrder.jsp");
		}
		catch(NullPointerException | NumberFormatException e)
		{
			response.sendRedirect("clientOrder.jsp");
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
