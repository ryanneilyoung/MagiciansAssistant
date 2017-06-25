<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!--  Fullcalendar imports -->
<link href='fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='fullcalendar/lib/moment.min.js'></script>
<script src='fullcalendar/lib/jquery.min.js'></script>
<script src='fullcalendar/fullcalendar.min.js'></script>

<!--  Fontawesome imports -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap-datepicker.js"> </script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="css/inputcalendar.css"/>

<title>View Reports</title>
</head>
<body>

<div class="page-header">
  <p align="right"><h1>Hello ${sessionScope.name}</h1>
  <div class="dropdown" align="right">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Options
  <span class="caret"></span></button>
  <ul class="dropdown-menu dropdown-menu-right">
    <li><a href="bookOffTime.jsp">Book Off Time</a></li>
    <li><a href="PrintLetterLabelsExchange">Print Letter Labels</a>
    <li><a href="MagicianAccountExchange">Account Settings</a></li>
    <li><a href="LogoutExchange">Logout</a></li>
  </ul>
</div> 
  	<nav class="navbar navbar-default">
	  	<div class="container-fluid">
		  	<div class="navbar-header">
			    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navBar">
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span>
				    <span class="icon-bar"></span>                        
			    </button>	
		    </div>
		    <div class="collapse navbar-collapse" id="navBar">
				<ul class="nav navbar-nav">
					<li><a href="upcomingShows.jsp">Upcoming Shows</a></li>
					<li><a href="MagicianCalendarExchange">Manage Shows</a></li>
					<li><a href="manageIllusions.jsp">Manage Illusions</a></li>
					<li class="active"><a href="viewReports.jsp">View Reports</a></li>
					<li><a href="magicianClientList.jsp">Manage Client List</a></li>
					<li><a href="manageInventory.jsp">Manage Inventory</a></li>
					<li><a href="manageOrders.jsp">Orders Screen</a></li>
					<li><a href="pendingShows.jsp">View Pending Shows</a></li>
					<li><a href="newClient.jsp">Register New Client</a>
				</ul>
			</div>
		</div>
	</nav>
</div>

<div class="container">
<h2>Generate Report </h2>
<br>
<div class="row">

<form action="ReportExchange" method="GET">
<div class="col-sm-4" align="left">
<div class="form-group has-feedback">
	  <label for="startdatepicker">Start Date for Reporting Period:</label>
	  	<input type="text" class="form-control" id="startdatepicker" name="startDate">
	  	<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
</div>
<div class="form-group has-feedback">
	  <label for="enddatepicker">End Date for Reporting Period:</label>
	  	<input type="text" class="form-control" id="enddatepicker" name="endDate">
	  	<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
</div>


<div class="form-group">
  <label for="sel1">Select Report Type:</label>
  <select name="report" class="form-control" id="sel1">
  	<option disabled selected value> -- Report Type -- </option>
	<option value="Bookings Report" id="bookingButton">Bookings Report</option>
	<option value="Orders Report" id="orderButton">Orders Report</option>
	<option value="Trick Sales Report" id="bookingButton">Trick Sales Report</option>	
  </select>
</div>

<div class="form-group">
	<button type="submit" class="btn btn-default" value="Generate Report" name="reportButton" id="reportButton">Generate Report</button>
</div>
</div>
</form>
</div>
</div>

<script>
	$('#startdatepicker').datepicker({
		orientation: 'auto bottom',
		autoclose: true
	});
	
	$('#enddatepicker').datepicker({
		
		orientation: 'auto bottom',
		autoclose: true
	});
</script>
</body>