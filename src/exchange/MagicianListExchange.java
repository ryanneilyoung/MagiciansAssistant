package exchange;

import controllers.GeneralController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class MagicianListExchange
 */
@WebServlet("/MagicianListExchange")
public class MagicianListExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagicianListExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GeneralController controller = new GeneralController();
		ArrayList<Object[]> list = controller.getMagicianList();
		HttpSession session = request.getSession();
		session.setAttribute("magicianList", list);
		String li = controller.getDropDownListIndex(list);
		session.setAttribute("dropDown", li);
		
		session.setAttribute("magicianDescription", "Please select a Magician to see more detail.");
		session.setAttribute("personalDescription", "</p><p id='personal-description'>Please select a Magician to see more detail.");
		session.setAttribute("corporateDescription", "</p><p id='corporate-description'>Please select a Magician to see more detail.");
		session.setAttribute("schoolDescription", "</p><p id='school-description'>Please select a Magician to see more detail.");
		session.setAttribute("image", "<img id='profile' class='img-responsive center-block' src='/Capstone/images/default.jpg' alt=''>");
		
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
