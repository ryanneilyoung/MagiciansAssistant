package controllers;

import java.util.ArrayList;
import java.util.Date;

import persistence.utilities.BookingBroker;
import persistence.utilities.InventoryBroker;
import persistence.utilities.OrderBroker;

/**
 * @author Ryan Young 000698795
 * @version 1.0
 *
 * Class description: A controller class
 *  to handle all Administrator related Use Cases
 * 
 */
public class ReportController
{
	//Constants
	//Attributes
	//Constructors
	//Getter and Setter Methods
	//Operational Methods
	
	/**
	 * Method to get a report from the database
	 * @param id the Id of the magician.
	 * @param startDate Date object representing the start of the query.
	 * @param endDate Date object representing the end of the query.
	 * @return an array ready to be inserted into a excel sheet.
	 */
	public ArrayList<Object[]> generateBookingReport(int id, Date startDate, Date endDate)
	{
		BookingBroker broker = new BookingBroker();
		return broker.generateBookingReport(id, startDate, endDate);
	}
	
	/**
	 * Method to get a report from the database
	 * @param id the Id of the magician.
	 * @param startDate Date object representing the start of the query.
	 * @param endDate Date object representing the end of the query.
	 * @return an array ready to be inserted into a excel sheet.
	 */
	public ArrayList<Object[]> generateTrickSalesReport(int id, Date startDate, Date endDate)
	{
		InventoryBroker broker = new InventoryBroker();
		return broker.generateTrickSalesReport(id, startDate, endDate);
	}
	
	/**
	 * Method to get a report from the database
	 * @param id the Id of the magician.
	 * @param startDate Date object representing the start of the query.
	 * @param endDate Date object representing the end of the query.
	 * @return an array ready to be inserted into a excel sheet.
	 */
	public ArrayList<Object[]> generateOrderReport(int id, Date startDate, Date endDate)
	{
		OrderBroker broker = new OrderBroker();
		return broker.generateOrderReport(id, startDate, endDate);
	}
}
