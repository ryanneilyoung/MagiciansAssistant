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

<title>Manage Inventory</title>
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
					<li class="active"><a href="manageInventory.jsp">Manage Inventory</a></li>
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
		<h3>Tricks Currently Available in Store</h3>
		<div class="table-responsive pre-scrollable" style="overflow-y: auto;">
		<table id="fullTricks" class="table table-hover" id="fullTable" name="fullTable">
		  <thead>
		    <tr>
		      <th>Trick Name</th><th>Price</th><th>Quantity</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%=MagicianController.getInventory((Integer) session.getAttribute("id"))%>
		  </tbody>
		</table><br><br>
		</div>
		</div>
		<div style="margin-left: 10%;" class="col-sm-4">
		<h3>Add New Trick to Store</h3>
		<fieldset>
		<form action="ManageInventoryExchange" method="POST" id="inventoryForm" enctype="multipart/form-data">
		
           <input type="hidden" name="trickId" id="trickId" onKeyup="enableButtons()"/><br><br>
           <label for="trickName">Trick Name: </label>
           <input type="text" name="trickName" id="trickName" onKeyup="enableButtons()"/><br><br>
           <label for="trickPrice">Trick Price: </label>
           <input type="number" step="any" min="0" name="trickPrice" id="trickPrice" onKeyup="enableButtons()"/><br><br>
           <label for="quantity">Quantity: </label>
           <input type="number" min="0" name="quantity" id="quantity" onKeyup="enableButtons()"/><br><br>
           <label for="description">Description</label>
           <textarea rows="4" cols="50" name="description" id=description onKeyup="enableButtons()" form="inventoryForm"></textarea><br><br>
           <label class="btn btn-default">
    			<input type="file" name="file" size="50000" style="display: none;"/>
    			Upload Image of Trick
			</label>
           <br><br>
           
           <!--Buttons-->
            <input type="submit" name="operation" value="Add Trick" id="addTrick" class="btn btn-default" disabled />
            <input type="submit" name="operation" value="Edit Trick" id="editTrick" class="btn btn-default" disabled/>
            <input type="submit" name="operation" value="Delete Trick" id="deleteTrick" class="btn btn-default" onclick='return confirm("Are you sure you want to delete this trick?")' disabled/>
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

$('#fullTricks').dataTable({
	"paging": false,
	"searching": false,
	"info": false,
	"fixedheader": true
});
	var edit = false;
	function enableButtons()
    {
        var trickId = document.getElementById("trickId");
        var trickName = document.getElementById("trickName");
        var trickPrice = document.getElementById("trickPrice");
        var quantity = document.getElementById("quantity");
        var description = document.getElementById("description");
        
        var addTrick = document.getElementById('addTrick');
        var editTrick = document.getElementById('editTrick');
        var deleteTrick = document.getElementById('deleteTrick');
        
        addTrick.disabled = true;
        editTrick.disabled = true;
        deleteTrick.disabled = true;
       

        if (edit == true && trickName.value.length > 0 && trickPrice.value > 0 && quantity.value > 0 && description.value.length > 0)
        {
            editTrick.disabled = false;
        }
        else if(trickName.value.length > 0 && trickPrice.value > 0 && quantity.value > 0 && description.value.length > 0)
        {
            addTrick.disabled = false;
        }
        
        
    }
    function setTrick(num, name, price, quantity, description){
    	$("#trickId").val(num);
    	$("#trickName").val(name);
    	$("#trickPrice").val(price);
    	$("#quantity").val(quantity);
    	$("#description").val(description)

    	$("#addTrick").prop('disabled', true);
    	$("#editTrick").prop('disabled', false);
    	$("#deleteTrick").prop('disabled', false);
    	edit = true;
    }
</script>
</body>