<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<!-- Local CSS  -->
<link href='css/showlegend.css' rel='stylesheet' />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Manage Shows</title>
</head>
<body>
<div class="page-header">
  <h1>Hello ${sessionScope.name}</h1>
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
					<li  class="active"><a href="MagicianCalendarExchange">Manage Shows</a></li>
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
<b><h2>All Shows</h2></b>
<br>
	  <div class="container">
        <div class="calendar-container">
        <div id='calendar'></div>
        </div>
      </div>
      <br>
      <div class="container" >
	<h3>Legend:</h3>
		<ul class="legend">
		    <li><span class="performed"></span> Past Show</li>
		    <li><span class="personal"></span> Personal Show</li>
		    <li><span class="corporate"></span> Corporate Show </li>
		    <li><span class="school"></span> School Show</li>
		    <li><span class="unpersonal"></span> Unapproved Personal Show</li>
		    <li><span class="uncorporate"></span> Unapproved Corporate Show </li>
		    <li><span class="unschool"></span> Unapproved School Show</li>
		    <li><span class="bookoff"></span>Booked Off</li>
		</ul>
	</div>
<br>
<br>
<br>
<script>
	$(document).ready(function() {
		//noinspection JSPotentiallyInvalidConstructorUsage
        var date = Date();
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek',
				lang: 'es'
			},
			displayEventEnd: {
                    month: true,
                    basicWeek: true,
                    "default": true
            },
			defaultDate: date,
			navLinks: true, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [
			         
				${sessionScope.calendarValues}
			]
		});
		
	});
	
</script>
</div>
</body>
</html>