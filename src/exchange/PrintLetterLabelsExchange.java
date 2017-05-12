package exchange;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import persistence.RelationBroker;

/**
 * Servlet implementation class PrintLetterLabelsExchange
 */
@WebServlet("/PrintLetterLabelsExchange")
public class PrintLetterLabelsExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintLetterLabelsExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = "LetterLabels.pdf";
		response.setContentType("application/pdf");
	    response.setHeader("content-disposition", "attachment;filename=\"" + filename + "\"");
		
		String jrxmlFileName = "C:/res/jasper/label_5160.jrxml";
		String jasperFileName = "C:/res/jasper/label_5160.jasper";
		try
		{
			int id = (int) request.getSession().getAttribute("id");
			
			JasperCompileManager.compileReportToFile(jrxmlFileName, jasperFileName);
			
			Connection conn = RelationBroker.getBroker().getConnection();
			
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("magicianId", id);
			JasperPrint jprint = JasperFillManager.fillReport(jasperFileName, hm, conn);
			JasperExportManager.exportReportToPdfStream(jprint, response.getOutputStream());
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("error.jsp");
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
