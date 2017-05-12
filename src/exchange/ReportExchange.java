package exchange;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


import controllers.ReportController;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Servlet implementation class ReportExchange
 */
@WebServlet("/ReportExchange")
public class ReportExchange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportExchange() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			SimpleDateFormat fileNameFormat = new SimpleDateFormat("YYYY|MM|dd");
			
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String reportType = request.getParameter("report");
			
			Date start = null;
			Date end = null;
			
			if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals(""))
			{
				start = dateFormat.parse(startDate);
				end = dateFormat.parse(endDate);
			}
			
			assert start != null;
			assert end != null;
			
			if(start.after(end))
			{
				response.sendRedirect("viewReports.jsp?message=Dates are reversed");
			}
			int id = (int) request.getSession().getAttribute("id");
			ReportController controller = new ReportController();
			ArrayList<Object[]> report;
			
			switch (reportType)
			{
				case "Bookings Report":
					report = controller.generateBookingReport(id, start, end);
					String filename = "BookingReport-" + fileNameFormat.format(start) + "-" + fileNameFormat.format(end) + ".xlsx";
					bookingReportSheet(filename, report, request, response);
					break;
					
				case "Orders Report":
					report = controller.generateOrderReport(id, start, end);
					filename = "OrderReport-" + fileNameFormat.format(start) + "-" + fileNameFormat.format(end) + ".xlsx";
					ordersReportSheet(filename, report, request, response);
					break;
					
				case "Trick Sales Report":
					report = controller.generateTrickSalesReport(id, start, end);
					filename = "InventoryReport-" + fileNameFormat.format(start) + "-" + fileNameFormat.format(end) + ".xlsx";
					salesReportSheet(filename, report, request, response);
					break;
	
				default:
					response.sendRedirect("viewReports.jsp?message=Invalid Report Type");
					break;
			}
			
		} catch (ParseException|IOException e)
		{
			response.sendRedirect("viewReports.jsp?message=Error writing File");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	/**
	 * @param filename
	 * @param report
	 * @param response 
	 * @param request 
	 * @throws IOException 
	 */
	private void salesReportSheet(String filename, ArrayList<Object[]> report, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("application/vnd.ms-excel");
	    response.setHeader("content-disposition", "attachment;filename=\"" + filename + "\"");
	    
	    XSSFWorkbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Report");  

        Row rowhead = sheet.createRow((short)0);
        rowhead.createCell(0).setCellValue("Order ID");
        rowhead.createCell(1).setCellValue("Name");
        rowhead.createCell(2).setCellValue("Quantity");
        rowhead.createCell(3).setCellValue("Trick Price");
        rowhead.createCell(4).setCellValue("Date Placed");
        rowhead.createCell(5).setCellValue("Order Total");
        
        CellStyle dateStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        dateStyle.setDataFormat((createHelper.createDataFormat().getFormat("dddd, mmmm dd, yyyy")));
        
        CellStyle currencyStyle = workbook.createCellStyle();
        currencyStyle.setDataFormat((short)8);

        int i = 1;
        for(Object[] entry : report)
        {
        	Row row = sheet.createRow(i);
        	row.createCell(0).setCellValue((int) entry[0]);
        	row.createCell(1).setCellValue(entry[1].toString());
        	row.createCell(2).setCellValue((int) entry[2]);
        	row.createCell(3).setCellValue((double) entry[3]);
        	row.getCell(3).setCellStyle(currencyStyle);
        	row.createCell(4).setCellValue((Date) entry[4]);
        	row.getCell(4).setCellStyle(dateStyle);
        	row.createCell(5).setCellValue((double) entry[5]);
        	row.getCell(5).setCellStyle(currencyStyle);
        	
        	i++;
        }
        
        workbook.write(response.getOutputStream());
        workbook.close();
	}

	/**
	 * @param filename
	 * @param report
	 * @param response 
	 * @param request 
	 * @throws IOException 
	 */
	private void ordersReportSheet(String filename, ArrayList<Object[]> report, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("application/vnd.ms-excel");
	    response.setHeader("content-disposition", "attachment;filename=\"" + filename + "\"");
	    
	    XSSFWorkbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Report");  

        Row rowhead = sheet.createRow((short)0);
        rowhead.createCell(0).setCellValue("Order ID");
        rowhead.createCell(1).setCellValue("Shipped");
        rowhead.createCell(2).setCellValue("Client ID");
        rowhead.createCell(3).setCellValue("Date Placed");
        rowhead.createCell(4).setCellValue("Order Total");
        rowhead.createCell(5).setCellValue("Date Shipped");
        rowhead.createCell(6).setCellValue("Client Email");
        rowhead.createCell(7).setCellValue("Trick Name");
        rowhead.createCell(8).setCellValue("Number Ordered");
        rowhead.createCell(9).setCellValue("Trick Price");
        
        CellStyle dateStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        dateStyle.setDataFormat((createHelper.createDataFormat().getFormat("dddd, mmmm dd, yyyy")));
        
        CellStyle currencyStyle = workbook.createCellStyle();
        currencyStyle.setDataFormat((short)8);
        
        int i = 1;
        for(Object[] entry : report)
        {
        	Row row = sheet.createRow(i);
        	row.createCell(0).setCellValue((int) entry[0]);
        	row.createCell(1).setCellValue((boolean) entry[1]);
        	row.createCell(2).setCellValue((int) entry[2]);
        	row.createCell(3).setCellValue((Date) entry[3]);
        	row.getCell(3).setCellStyle(dateStyle);
        	row.createCell(4).setCellValue((double) entry[4]);
        	row.getCell(4).setCellStyle(currencyStyle);
        	row.createCell(5).setCellValue((Date) entry[5]);
        	row.getCell(5).setCellStyle(dateStyle);
        	row.createCell(6).setCellValue(entry[6].toString());
        	row.createCell(7).setCellValue(entry[7].toString());
        	row.createCell(8).setCellValue((int) entry[8]);
        	row.createCell(9).setCellValue((double) entry[9]);
        	row.getCell(9).setCellStyle(currencyStyle);
        	i++;
        }
        
        workbook.write(response.getOutputStream());
        workbook.close();
	}

	/**
	 * @param filename
	 * @param report
	 * @param response 
	 * @param request 
	 * @throws IOException 
	 */
	private void bookingReportSheet(String filename, ArrayList<Object[]> report, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("application/vnd.ms-excel");
	    response.setHeader("content-disposition", "attachment;filename=\"" + filename + "\"");
	    
	    XSSFWorkbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Report");  

        Row rowhead = sheet.createRow((short)0);
        rowhead.createCell(0).setCellValue("ID");
        rowhead.createCell(1).setCellValue("Date");
        rowhead.createCell(2).setCellValue("Price");
        rowhead.createCell(3).setCellValue("Show Type");
        rowhead.createCell(4).setCellValue("Number of Kids");
        rowhead.createCell(5).setCellValue("Advertisement Method");
        rowhead.createCell(6).setCellValue("Show Length");
        rowhead.createCell(7).setCellValue("Birthday Age");
        rowhead.createCell(8).setCellValue("Number of Adults");
        rowhead.createCell(9).setCellValue("Kid Show");
        rowhead.createCell(10).setCellValue("Stage Show");
        rowhead.createCell(11).setCellValue("School Show Type");
        rowhead.createCell(12).setCellValue("Illusion Name");
        
        CellStyle dateStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        dateStyle.setDataFormat((createHelper.createDataFormat().getFormat("dddd, mmmm dd, yyyy")));

        CellStyle currencyStyle = workbook.createCellStyle();
        currencyStyle.setDataFormat((short)8);
        
        String[] showType = {"", "Personal", "Corporate", "School"};
        String[] advertisementMethod = {"", "Return Customer", "Refferal", "Mailings", "Calgary's Child", "Google", "Gigmasters", "Gigsalad", "Other"};
        String[] schoolShowType = {"", "Early Literacy (Kindergarten)", "Challenge Your Senses! (Grade One)", "Magical Colours! (Grade One)", "Magic of Magnets! (Grade Two)", "The ABC's of Character (Grades K-6)", "The Magic of Reading (Grades K-9)", "Beyond Bullying (K-9)"};
        
        int i = 1;
        for(Object[] entry : report)
        {
        	Row row = sheet.createRow(i);
        	row.createCell(0).setCellValue((int) entry[0]);
        	row.createCell(1).setCellValue((Date) entry[1]);
        	row.getCell(1).setCellStyle(dateStyle);
        	row.createCell(2).setCellValue((double) entry[2]);
        	row.getCell(2).setCellStyle(currencyStyle);
        	row.createCell(3).setCellValue(showType[(int) entry[3]]);
        	row.createCell(4).setCellValue((int) entry[4]);
        	row.createCell(5).setCellValue(advertisementMethod[(int) entry[5]]);
        	row.createCell(6).setCellValue((int) entry[6]);
        	row.createCell(7).setCellValue((int) entry[7]);
        	row.createCell(8).setCellValue((int) entry[8]);
        	row.createCell(9).setCellValue((boolean) entry[9]);
        	row.createCell(10).setCellValue((boolean) entry[10]);
        	row.createCell(11).setCellValue(schoolShowType[(int) entry[11]]);
        	row.createCell(12).setCellValue(entry[12].toString());
        	
        	i++;
        }
        
        workbook.write(response.getOutputStream());
        workbook.close();
	}

}
