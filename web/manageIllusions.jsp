<%@ page import="controllers.MagicianController" %>
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
					<li class="active"><a href="manageIllusions.jsp">Manage Illusions</a></li>
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
	<div class="row">
		<div class="col-sm-4">
		<h3>All Current Tricks </h3>
		<div class="table-responsive pre-scrollable" style="overflow-y: auto;">
		<table id="fullIllusions" class="table table-hover" id="fullTable" name="fullTable">
		  <thead>
		    <tr>
		      <th>Illusion Name</th><th>Length</th><th>Recommended Age</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%=MagicianController.getIllusions((Integer) session.getAttribute("id")) %>
		  </tbody>
		</table><br><br>
		</div>
		</div>
		<div style="margin-left: 10%;" class="col-sm-4">
		<h3>Add New Tricks</h3>
		<fieldset>
		<form action="ManageIllusionExchange" method="POST">
		
           <input type="hidden" name="illusionId" id="illusionId" onKeyup="enableButtons()"/><br><br>
           <label for="illusionName">Illusion Name: </label>
           <input type="text" name="illusionName" id="illusionName" onKeyup="enableButtons()"/><br><br>
           <label for="illusionLength">Illusion Length: </label>
           <input type="number" min="1" name="illusionLength" id="illusionLength" onKeyup="enableButtons()"/><br><br>
           <label for="recommendedAge">Recommended Age: </label>
           <input type="number" min="0" name="recommendedAge" id="recommendedAge" onKeyup="enableButtons()"/><br><br><br>
           
           <!--Buttons-->
            <input type="submit" name="addIllusion" value="Add Illusion" id="addIllusion" class="btn btn-default" />
            <input type="submit" name="editIllusion" value="Edit Illusion" id="editIllusion" class="btn btn-default"/>
            <input type="submit" name="deleteIllusion" value="Delete Illusion" id="deleteIllusion" class="btn btn-default" onclick='return confirm("Are you sure you want to delete this illusion?")'/>
      	</form>
		</fieldset>		
		
		</div>
	</div>
</div>
<br><br><br>

<script>

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});

$('#fullIllusions').dataTable({
	"paging": false,
	"searching": false,
	"info": false,
	"fixedheader": true
});
	var edit = false;
	function enableButtons()
    {
        var illusionId = document.getElementById("illusionId");
        var illusionName = document.getElementById("illusionName");
        var illusionLength = document.getElementById("illusionLength");
        var recommendedAge = document.getElementById("recommendedAge");
        
        var addIllusion = document.getElementById('addIllusion');
        var editIllusion = document.getElementById('editIllusion');
        var deleteIllusion = document.getElementById('deleteIllusion');
        
        addIllusion.disabled = true;
        editIllusion.disabled = true;
        deleteIllusion.disabled = true;
       

        if (edit == true && illusionName.value.length > 0 && illusionLength.value > 0 && recommendedAge.value > 0)
        {
            editIllusion.disabled = false;
        }
        else if(illusionName.value.length > 0 && illusionLength.value > 0 && recommendedAge.value > 0)
        {
            addIllusion.disabled = false;
        }
        
        
    }
    function setIllusion(num, name, length, age){
    	$("#illusionId").val(num);
    	$("#illusionName").val(name);
    	$("#illusionLength").val(length);
    	$("#recommendedAge").val(age);

    	$("#addIllusion").prop('disabled', true);
    	$("#editIllusion").prop('disabled', false);
    	$("#deleteIllusion").prop('disabled', false);
    	edit = true;
    }
</script> 

</body>
</html>
