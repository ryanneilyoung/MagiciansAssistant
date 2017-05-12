<%@ page import="controllers.ShowController" %>
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
   
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></link>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

<title>Illusion Management Page</title>
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
	<form action="IllusionExchange" method="POST">
<div class="container">
<h2>All Tricks</h2>
	<div class="row">
	<div class="col-sm-4">
		<div class="table-responsive pre-scrollable" style="overflow-y: auto;">

		
		<table id="fullIllusions" class="table table-hover" id="fullTable" name="fullTable">
		  <thead>
		    <tr>
		      <th>Illusion Name</th><th>Length</th><th>Recommended Age</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%=ShowController.getFullIllusionList(Integer.parseInt(request.getParameter("id")))%>
		  </tbody>
		</table>
		
		</div>
		<br><br>
		<input type="submit" name="add" id="add" value="Add Trick to Show List" class="btn btn-default" disabled/>
		<br><br><br><br>
		</div>
		<div class="col-sm-4" style="margin-top: -60px !important;">
	
		<input type="hidden" name="illusion" id="illusion" value=""/>
		<input type="hidden" name="booking" id="booking" value=${param.id} />
		<input type="hidden" name="length" id="length" value=${param.length} />	
		
		<%=ShowController.getShowInfo(Integer.parseInt(request.getParameter("id")))%><br>
		<a href="ShowExchange?delete=${param.id}" class="btn btn-default" onclick='return confirm("Are you sure you want to delete this show?")'>Delete Show</a>
		<br><br><br><br>
		</div>
		
		<div class="col-sm-4" style="margin-top: -60px !important;">
			<h2>Show Trick List</h2>
		  	<%=ShowController.getShowIllusionList(Integer.parseInt(request.getParameter("id")), Integer.parseInt(request.getParameter("length")))%>
		</div>
		<input type="submit" name="remove" id="remove" value="Remove Trick From Show List" class="btn btn-default" disabled/>
	</div>

	</div>
</div>
<br><br><br>
<script>
$('#fullIllusions').dataTable({
	"paging": false,
	"searching": false,
	"info": false,
	"fixedheader": true
});
$('#showIllusions').dataTable({
	"paging": false,
	"searching": false,
	"info": false
});
function setIllusionNum(num, inShow){
	$("#illusion").val(num);
	if(inShow)
	{
		$('#add').prop('disabled', true);
		$('#remove').prop('disabled', false);
	}
	else
	{
		$('#add').prop('disabled', false);
		$('#remove').prop('disabled', true);
	}
}
</script>
</div>
</form>
</body>
</html>