package exchange;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import persistence.RelationBroker;

/**
 * Servlet implementation class InvoiceExchange
 */
@WebServlet("/InvoiceExchange")
public class InvoiceExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InvoiceExchange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String type = request.getParameter("type");
				int id = Integer.parseInt(request.getParameter("id"));
				
				switch (type)
				{
					case "Order":
						String jrxmlFileName = "C:/res/jasper/OrderInvoice.jrxml";
						String jasperFileName = "C:/res/jasper/OrderInvoice.jasper";
						String pdfFileName = "C:/res/pdfs/OrderInvoice" + id +".pdf";
						
						try
						{
							JasperCompileManager.compileReportToFile(jrxmlFileName, jasperFileName);
							
							Connection conn = RelationBroker.getBroker().getConnection();
							
							HashMap<String, Object> hm = new HashMap<>();
							hm.put("OrderId", id);
							JasperPrint jprint = JasperFillManager.fillReport(jasperFileName, hm, conn);
							
							JasperExportManager.exportReportToPdfFile(jprint, pdfFileName);
							conn.close();
							response.sendRedirect("index.jsp");
						}
						catch(JRException|SQLException|NumberFormatException|NullPointerException e)
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
							response.sendRedirect("index.jsp");
						}
						break;
						
					case "Booking":
						jrxmlFileName = "C:/res/jasper/BookingInvoice.jrxml";
						jasperFileName = "C:/res/jasper/BookingInvoice.jasper";
						pdfFileName = "C:/res/pdfs/BookingInvoice" + id +".pdf";
						
						try
						{
							JasperCompileManager.compileReportToFile(jrxmlFileName, jasperFileName);
							
							Connection conn = RelationBroker.getBroker().getConnection();
							
							HashMap<String, Object> hm = new HashMap<>();
							hm.put("BookingId", id);
							JasperPrint jprint = JasperFillManager.fillReport(jasperFileName, hm, conn);
							
							JasperExportManager.exportReportToPdfFile(jprint, pdfFileName);
							conn.close();
						}
						catch(JRException|SQLException|NumberFormatException e)
						{
							// TODO Auto-generated catch block
							e.printStackTrace();
							response.sendRedirect("index.jsp");
						}
						break;

					default:
						response.sendRedirect("index.jsp");
						break;
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
