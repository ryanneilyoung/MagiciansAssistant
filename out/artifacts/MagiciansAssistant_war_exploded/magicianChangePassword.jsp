<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Local CSS -->
<link rel="stylesheet" type="text/css" href="css/magicianside.css">


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

<!-- Import for confirmation box -->
<script src="js/bootbox.min.js"></script>

 <!-- Font Awesome import for icons-->
 <script src="https://use.fontawesome.com/30dab5103b.js"></script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<title>Account Settings</title>
</head>


<div class="page-header">
  <p align="right"><h1>Hello ${sessionScope.name}</h1>
<div class="dropdown" align="right">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Options
  <span class="caret"></span></button>
  <ul class="dropdown-menu dropdown-menu-right">
    <li><a href="bookOffTime.jsp">Book Off Time</a></li>
    <li><a href="PrintLetterLabelsExchange">Print Letter Labels</a>
    <li class="active"><a href="MagicianAccountExchange">Account Settings</a></li>
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
		<form action="SaveMagicianSettingsExchange" method="POST" id="accountForm">
		<H1 style="margin-left: 15%;">Change Account Password</H1>
		<hr style="height:1px;border:none;color:#d3d3d3;background-color:#d3d3d3;">
		<fieldset>
		<input type="hidden" name="enter" value="Save New Password" style="display: none;">
			<div class="form-group row"> 	
				<label class="col-md-4 control-label" for="currentPassword" align="right">Current password: </label>
				<div class="col-md-5">
					<input type="password" name="currentPassword" id="currentPassword" class="form-control input-md">
				</div>
			</div>
			<div class="form-group row"> 	
				<label class="col-md-4 control-label" for="newPassword" align="right">New password: </label>
				<div class="col-md-5">
					<input type="password" name="newPassword" id="newPassword" class="form-control input-md">
				</div>
			</div>
			
			<div class="form-group row"> 
				<label class="col-md-4 control-label" for="confirmNewPassword">Confirm New Password: </label>
				<div class="col-md-5">
					<input type="password" name="confirmNewPassword" id="confirmNewPassword"  class="form-control input-md">
				</div>
			</div>
			<br>
			<div class="form-group row col-md-4"> 
				<input type="submit" id="saveName" class="btn btn-default">
			</div> 
			</fieldset>
		</form>  
</div>

<script>

$("#accountForm").submit(function(event){
	event.preventDefault();
	var currentPass = document.getElementById("currentPassword").value;
    var newPass = document.getElementById("newPassword").value;
    var confirmPass = document.getElementById("confirmNewPassword").value;
    var form = document.getElementById("accountForm");
    if (currentPass == "" || newPass == "" || confirmPass == "") {
        alert("Missing information");
        return false;
    }else{
    	bootbox.confirm({
    	    title: "Changing password",
    	    message: "Would you like to continue?",
    	    buttons: {
    	        cancel: {
    	            label: '<i class="fa fa-times"></i> Cancel'
    	        },
    	        confirm: {
    	            label: '<i class="fa fa-check"></i> Confirm'
    	        }
    	    },
    	    callback: function (result) {
    	        if(result){
    	        	form.submit();
    	        }else{
    	        	return;
    	        }
    	    }
    	});
    	
    }
});



</script>
</body>
</html>