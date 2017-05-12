package exchange;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.MagicianController;

/**
 * Servlet implementation class MagicianAccountExchange
 */
@WebServlet("/MagicianAccountExchange")
public class MagicianAccountExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagicianAccountExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int id = (int) session.getAttribute("id");
		
		MagicianController controller = new MagicianController();
		Object[] info = controller.getMagicianAccountInfo(id);
		
		session.setAttribute("name", info[0]);
		session.setAttribute("price30Min", info[1]);
		session.setAttribute("price45Min", info[2]);
		session.setAttribute("price60Min", info[3]);
		session.setAttribute("priceCorporate", info[4]);
		session.setAttribute("priceSchool", info[5]);
		session.setAttribute("description", info[6]);
		session.setAttribute("personalDescription", info[7]);
		session.setAttribute("corporateDescription", info[8]);
		session.setAttribute("schoolDescription", info[9]);
		
		response.sendRedirect("magicianAccountSettings.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
