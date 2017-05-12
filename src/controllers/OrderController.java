package controllers;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import persistence.RelationBroker;
import persistence.utilities.InventoryBroker;
import persistence.utilities.OrderBroker;
import problemDomain.utilities.SaleTrick;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Order related Use Cases
 * 
 */
public class OrderController
{
	//Constants
	//Attributes
	//Constructors
	//Getter and Setter Methods
	//Operational Methods

	/**
	 * Method to return a drop down list containing all the Magicians in the system.
	 * @param list a list containing references to every Magician and their id in the system.
	 * @return a formatted drop down menu containing all magicians in the system.
	 * Precondition: a Client navigates to the order page.
	 * Postcondition: a list containing all Magicians in the system is passed back. 
	 */
	public String getDropDownListInventory(ArrayList<Object[]> list)
	{
		String formattedList = "";
		for(Object[] magician : list)
		{
			int id = (int) magician[0];
			String name = magician[1].toString();
			
			formattedList += "<li><a href=ClientStoreExchange?id=" + id + ">" + name + "</a></li>" ;
			
		}
		return formattedList;
	}
	
	public static String getOrders(int magicianId)
	{
		
		OrderBroker broker = new OrderBroker();
		ArrayList<Object[]> orderList = broker.getOrders(magicianId);
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy");
		String table = "<table class='table table-hover'><thead><th>Address</th><th>Date Placed</th><th>Shipped</th></thead>";
		
		for(Object[] order : orderList)
		{
			table += "<tr data-toggle='tooltip' title='Click to view order details or change shipping status' style='cursor:pointer' onclick=\"window.location = 'manageIndividualOrder.jsp?id=" + order[0] + "'\" >";
			table += "<td>" + order[3] + "</td>";
			table += "<td>" + format.format(order[2]) + "</td>";
			table += "<td>" + order[1] + "</td></tr>";		
		}
		
		table += "</table>"; 
		return table;
	}
	
	public static String getTricks(int orderId)
	{
		OrderBroker broker = new OrderBroker();
		ArrayList<Object[]> tricks = broker.getTricks(orderId); 
		String formatted = "";
		for(Object[] trick : tricks)
		{
			formatted += "<tr><td>" + trick[0]
						+"</td><td>" + trick[1] + "</td></tr>";
		}
		return formatted;
	}
	
	public boolean placeOrder(int clientId, int magicianId, String address, String address1, String postal, String city, String province, ArrayList<SaleTrick> trickList)
	{
		OrderBroker broker = new OrderBroker();
		int orderId = broker.placeOrder(clientId, magicianId, address, address1, postal, city, province, trickList);
		if(orderId > 0)
		{
			//String to = broker.getOrderEmail(orderId);
			//String filename = generateInvoice(orderId);
			generateInvoice(orderId);
			//MagicianController.sendInvoice(to, "Your order has been Places", filename);
			return true;
		}
		else
		{
			return false;
		}
	}

	public static String getOrderShippingInfo(int orderId)
	{
		OrderBroker broker = new OrderBroker();
		Object[] order = broker.getOrderShippingInfo(orderId);
		
		SimpleDateFormat format = new SimpleDateFormat("EEE, d MMM yyyy");
		NumberFormat formatter = NumberFormat.getCurrencyInstance();
		
		if((boolean) order[4])
		{
			return "<tr><td>Client Name</td><td>" + order[0]
				+ "</td></tr><tr><td>Phone Number</td><td>" + order[1]
				+ "</td></tr><tr><td>Email Address</td><td>" + order[2]
				+ "</td></tr><tr><td>Client Address</td><td>" + order[3]
				+ "</td></tr><tr><td>Date Placed</td><td>" + format.format(order[5])
				+ "</td></tr><tr><td>Order Total</td><td>" + formatter.format((double) order[6])
				+ "</td></tr><tr><td>Shipped on</td><td>" + format.format(order[7]) + "</td></tr></tbody></table>";
		}
		else
		{
			return "<tr><td>Client Name</td><td>" + order[0]
				+ "</td></tr><tr><td>Phone Number</td><td>" + order[1]
				+ "</td></tr><tr><td>Email Address</td><td>" + order[2]
				+ "</td></tr><tr><td>Client Address</td><td>" + order[3]
				+ "</td></tr><tr><td>Date Placed</td><td>" + format.format(order[5])
				+ "</td></tr><tr><td>Order Total</td><td>" + formatter.format((double) order[6])
				+ "</td></tr><tr><td>Shipped</td><td id='shipped' name ='shipped'>" + order[4] + "</td></tr></tbody></table>"
				+ "<input type='submit' name='orderShipped' value='Order Shipped' class='btn btn-default'"
				+ "onclick='return confirm(\"Are you sure you want to mark this as shipped?\")' />"
				+ "<input type='submit' name='cancelOrder' value='Cancel Order' class='btn btn-default'"
				+ "onclick='return confirm(\"Are you sure you want to cancel your order?\")' />";
		}
	}

	/**
	 * @param id
	 * @throws SQLException 
	 */
	public void markShipped(int id) throws SQLException
	{
		OrderBroker broker = new OrderBroker();
		broker.markShipped(id);
	}

	/**
	 * @param id
	 * @throws SQLException 
	 */
	public void cancelOrder(int id) throws SQLException
	{
		OrderBroker broker = new OrderBroker();
		broker.cancelOrder(id);
	}

	/**
	 * @param magicianId
	 * @return 
	 */
	public String getInventory(int magicianId)
	{
		ArrayList<SaleTrick> list = InventoryBroker.getInventory(magicianId);
		
		String store = "";
		
		assert list != null;
		
		NumberFormat formatter = NumberFormat.getCurrencyInstance();
		
		for(SaleTrick trick : list)
		{
			store += "<div class='row' style='margin-top: 5%;'><div class='col-sm-4' style='margin-left: 5%;'>"
					+ "<img width='250px' class='img-responsive rounded mb-3 mb-md-0'"
					+ "src='/Capstone/images/" + trick.getImageLocation()
					+ "' alt=''></div><div class='col-sm-5' style='margin-left: 5%;'><h3>" + trick.getName() 
					+ "</h3><p>" + trick.getDescription() + "</p><b>Price: " + formatter.format(trick.getPrice())
					+ "</b><br><a class='btn btn-primary add-to-cart' href='#' "
					+ "data-name='" + trick.getName()
					+ "' data-img='/Capstone/images/" + trick.getImageLocation()
					+ "' data-id='" + trick.getId() + "' data-price='"
					+ trick.getPrice() + "' data-description='" + trick.getDescription() 
					+ "'>Add to Cart <span class='glyphicon glyphicon-chevron-right'></span></a></div></div><hr>";
		}
		
		return store;
	}	
	
	/**
	 * @param object
	 */
	private static String generateInvoice(int id)
	{
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
			return pdfFileName;
		}
		catch(JRException|SQLException|NumberFormatException e)
		{
			e.printStackTrace();
			return null;
		}
	}
	
}
