package exchange;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controllers.MagicianController;
import exceptions.IllegalDescriptionException;
import exceptions.IllegalNameException;
import exceptions.IllegalNumberSizeException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.SQLException;

/**
 * Servlet implementation class ManageInventoryExchange
 */
@MultipartConfig
@WebServlet("/ManageInventoryExchange")
public class ManageInventoryExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageInventoryExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		MagicianController controller = new MagicianController();
		switch (operation)
		{
			case "Add Trick":
				int magicianId = (int) request.getSession().getAttribute("id");
				String name = request.getParameter("trickName");
				double price = Double.parseDouble(request.getParameter("trickPrice"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				String description = request.getParameter("description");
				
				Part filePart = request.getPart("file");
				String contentType = filePart.getContentType();
				String[] type = contentType.split("/");
				
				String filename = controller.addItemToInventory(magicianId, name, price, quantity, description,type[1]);
				
				if(filename == null)
				{
					response.sendRedirect("manageInventory.jsp?message=Invalid format");
				}
				else
				{
					File uploads = new File("C:\\res\\images\\");
					File file = new File(uploads, filename);
					
					try (InputStream fileContent = filePart.getInputStream())
					{
						Files.copy(fileContent, file.toPath());
					}
					
					response.sendRedirect("manageInventory.jsp");
				}
				break;
				
			case "Edit Trick":
				int id = Integer.parseInt(request.getParameter("trickId"));
				name = request.getParameter("trickName");
				price = Double.parseDouble(request.getParameter("trickPrice"));
				quantity = Integer.parseInt(request.getParameter("quantity"));
				description = request.getParameter("description");
				
				try
				{
					controller.editInventoryItem(id, name, price, quantity, description);
				
					response.sendRedirect("manageInventory.jsp");
				}
				catch (IllegalNameException | IllegalNumberSizeException | IllegalDescriptionException | NumberFormatException e)
				{
					response.sendRedirect("manageInventory.jsp?message=Invalid format");
				}
				catch (SQLException e)
				{
					response.sendRedirect("manageInventory.jsp?message=Please try again later");
				}
				
				break;
				
			case "Delete Trick":
				System.out.println();
				id = Integer.parseInt(request.getParameter("trickId"));
				filename = controller.deleteInventoryItem(id);
				
				File f = new File("C:\\res\\images\\" + filename);
				f.delete();
				response.sendRedirect("manageInventory.jsp");
				break;

			default:
				//ERROR
				response.sendRedirect("manageInventory.jsp?message=Missing Argument");
				break;
		}
	}

}
