package exchange;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controllers.MagicianController;
import exceptions.IllegalNameException;

/**
 * Servlet implementation class SaveMagicianSettingsExchange
 */
@MultipartConfig
@WebServlet("/SaveMagicianSettingsExchange")
public class SaveMagicianSettingsExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveMagicianSettingsExchange()
    {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = request.getParameter("enter");
		int id = (int) request.getSession().getAttribute("id");
		try
		{
			switch (submit)
			{
				case "Save Name":
					String name = request.getParameter("magicianName");
					MagicianController controller = new MagicianController();
					controller.saveMagicianName(id, name);
					response.sendRedirect("MagicianAccountExchange");
					break;
					
				case "Save New Password":
					String currentPassword = request.getParameter("currentPassword");
					String password = request.getParameter("newPassword");
					String confirm = request.getParameter("confirmNewPassword");
					if(password.equals(confirm))
					{
						controller = new MagicianController();
						controller.saveMagicianPassword(id, currentPassword, password);
						response.sendRedirect("MagicianAccountExchange");
					}
					else
					{
						response.sendRedirect("magicianAccountSettings.jsp?message=Passwords didnt match");
					}
					break;
					
				case "Save New Profile Image":
					Part filePart = request.getPart("file");
					String contentType = filePart.getContentType();
					String[] type = contentType.split("/");
					String filename = "profile" + id + "." + type[1];
					
					controller = new MagicianController();
					String prevFileName = controller.getPreviousImage(id);
					controller.saveMagicianImage(id, filename);
					
					if(!prevFileName.equals("default.jpg"))
					{
						File f = new File("C:\\res\\images\\" + prevFileName);
						f.delete();
					}
					File uploads = new File("C:\\res\\images\\");
					File file = new File(uploads, filename);
					
					
					try (InputStream fileContent = filePart.getInputStream())
					{
						Files.copy(fileContent, file.toPath());
					}
					response.sendRedirect("MagicianAccountExchange");
					break;
					
				case "Save New Price(s)":
					double price30 = Double.parseDouble(request.getParameter("new30Min"));
					double price45 = Double.parseDouble(request.getParameter("new45Min"));
					double price60 = Double.parseDouble(request.getParameter("new60Min"));
					double priceCorporate = Double.parseDouble(request.getParameter("newCorporatePrice"));
					double priceSchool = Double.parseDouble(request.getParameter("newSchoolPrice"));
					controller = new MagicianController();
					controller.saveMagicianPrices(id, price30, price45, price60, priceCorporate, priceSchool);
					response.sendRedirect("MagicianAccountExchange");
					break;
					
				case "Save New Description(s)":
					String description = request.getParameter("Desc");
					String personalDescription = request.getParameter("personalShowDesc");
					String corporateDescription = request.getParameter("corporateShowDesc");
					String schoolDescription = request.getParameter("schoolShowDesc");
					controller = new MagicianController();
					controller.saveMagicianDescriptions(id, description, personalDescription, corporateDescription, schoolDescription);
					response.sendRedirect("MagicianAccountExchange");
					break;
	
				default:
					response.sendRedirect("magicianAccountSettings.jsp?message=Invalid save type");
					break;
			}
		}
		catch (IllegalNameException | SQLException e) {
			response.sendRedirect("magicianAccountSettings.jsp?message=Invalid format");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
