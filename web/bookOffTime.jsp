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

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap-datepicker.js"> </script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<title>Book Off Time</title>
</head>
<body>

<div class="page-header">
  <p align="right"><h1>Hello ${sessionScope.name}</h1>
<div class="dropdown" align="right">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Options
  <span class="caret"></span></button>
  <ul class="dropdown-menu dropdown-menu-right">
    <li class="active"><a href="bookOffTime.jsp">Book Off Time</a></li>
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
					<li><a href="viewReports.jsp">View Reports</a></li>
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
<h2>Book Time Off</h2>
<br>
<h3 style="font-weight: 550;">From: </h3>
<div class="row">
<form action="BookOffTimeExchange" method="GET">
<div class="col-sm-4" align="left">

<div class="form-group has-feedback">
	  <label for="startdatepicker">Begin date of time to be booked off:</label>
	  	<input type="text" class="form-control" id="startdatepicker" name="startDate">
	  	<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
</div>
<div class="form-group has-feedback">
	  <label for="startdatepicker">Time of day to begin time booked off:</label>
	  	<input type="text" class="form-control" id="starttime" name="starttime">
	  	<span class="glyphicon glyphicon-time form-control-feedback"></span>
</div>
<br>
<h3 style="font-weight: 550;">To: </h3>
<div class="form-group has-feedback">
	  <label for="startdatepicker">End date of time to be booked off:</label>
	  	<input type="text" class="form-control" id="enddatepicker" name="endDate">
	  	<span class="glyphicon glyphicon-calendar form-control-feedback"></span>
</div>
<div class="form-group has-feedback">
	  <label for="startdatepicker">Time of day to end time booked off:</label>
	  	<input type="text" class="form-control" id="endtime" name="endtime">
	  	<span class="glyphicon glyphicon-time form-control-feedback"></span>
</div>
<input type="submit" value="Book Off" class="btn btn-default">
</div>
</form>
</div>
</div>
<br>
<br>
<br>
<script>

$('#starttime').timepicker({
    timeFormat: 'h:mm p',
    interval: 15,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '',
    startTime: '10:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});

$('#endtime').timepicker({
    timeFormat: 'h:mm p',
    interval: 15,
    minTime: '10',
    maxTime: '6:00pm',
    defaultTime: '',
    startTime: '10:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});

$('#startdatepicker').datepicker();
$('#enddatepicker').datepicker();
</script>
</body>