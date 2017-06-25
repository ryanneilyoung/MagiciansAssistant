<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="clientController" class="controllers.ClientController"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Custom Fonts -->
	  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Font Awesome import for icons-->
  	<script src="https://use.fontawesome.com/30dab5103b.js"></script>

  <!-- Required imports for bootstrap -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Import for confirmation box -->
    <script src="js/bootbox.min.js"></script>
	
  <!-- Local CSS-->
  	<link rel="stylesheet" type="text/css" href="css/clientside.css">

	<link rel="stylesheet" type="text/css" href="css/override.css">
	<link rel="stylesheet" type="text/css" href="css/cart.css">
	
  <title>iFoolu</title>
  </head>
  <body>
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-left">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a href="ClientPricingExchange">Pricing</a>
                    </li>
                    <li >
                        <a href="ClientCalendarExchange">Booking</a>
                    </li>
                    <li>
                        <a href="ClientStoreExchange">Order Tricks</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                  <li>
                  	<a href="cart.jsp">Cart<i class="fa fa-shopping-cart" aria-hidden="true"></i> <span id="cartTotal"></span></a>
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account<span class="caret"></span></a>
                      <ul style="background-color: #2C3E50;" class="dropdown-menu">
				          <li><a href="clientViewOrder.jsp">View Orders</a></li>
				          <li><a href="ClientAccountExchange">Settings</a></li>
				          <li><a href="LogoutExchange">Logout</a></li>
				      </ul>
                  </li>
                </ul>
            </div>
          </div>
        </nav>
<div class="wrap" style="min-height: 100%;">
<div class="container">       
<form class="form-horizontal" action="ClientSettingsExchange" method="POST">
<fieldset>

<!-- Form Name -->
<H1 style="margin-left: 15%;">Account Information</H1>
<hr style="height:1px;border:none;color:#d3d3d3;background-color:#d3d3d3;">

<!-- Name-->
<div class="form-group">
  <label class="col-md-4 control-label" for="name">Name: </label>  
  <div class="col-md-4">
   <label class="control-label" for="name" id="nameLabel">${sessionScope.name} </label>  
   <input id="name" name="name" type="text" placeholder="" class="form-control input-md" value="${sessionScope.name}">
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="email">Email: </label>  
  <div class="col-md-4">
   <label class="control-label" for="email" id="emailLabel"> ${sessionScope.email} </label> 
  <input id="email" name="email" type="text" placeholder="" class="form-control input-md" value="${sessionScope.email}"> 
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="phone">Phone Number:  </label>  
  <div class="col-md-4">
   	<label class="control-label" for="phone" id="phoneLabel">${sessionScope.phone}</label>  
  	<input id="phoneNumber" name="phoneNumber" type="text" placeholder="" class="form-control input-md" value="${sessionScope.phone}">
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>  
  <div class="col-md-5">
  <div class='btn-group pull-right' role='group' aria-label='...' style='margin-top:10px; margin-bottom: 10px;'>
  	<button type='button' class='btn btn-default' id="cancel"><span class='fa fa-times'></span>&nbsp;Cancel</button>
  	<button type='submit' class='btn btn-default btn-success' id="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp;Save Changes</button>
  	<a href="clientChangePassword.jsp" class="change-pass" id="change-pass" style="text-decoration: underline;">Change Password</a> &nbsp;
  	<a href="#" class="edit-names" id="edit-names" style="text-decoration: underline;">Edit Info</a>&nbsp;
  	<a href="clientAccountDelete.jsp" class="delete-account" id="delete-account" style="text-decoration: underline;">Delete Account</a>
  	</div>
  </div>
</div>
</fieldset>
</form>
</div>
<script>

	var cart = [];
	
	function countCart(){	//total items
		var count =0;
		for (var i in cart){
			count += cart[i].quantity;
		}
		
		return count;
	}
	
	function displayCountCart(){
			var count = countCart();
			if(count === 0){
				return "";
			}
			else{
				return "(" + count + ")";
			}
	}

	function loadCart(){
		if(JSON.parse(sessionStorage.getItem("shoppingCart"))){
			cart = JSON.parse(sessionStorage.getItem("shoppingCart"));
		}
	}
	
	$(document).ready(function() {
		document.getElementById("submit").style.display = "none";
		document.getElementById("cancel").style.display = "none";
		document.getElementById("name").style.display = "none";
		document.getElementById("email").style.display = "none";
		document.getElementById("phoneNumber").style.display = "none";
		loadCart();
		$("#cartTotal").html(displayCountCart());
	});
	
	$( ".edit-names" ).click(function() {
		document.getElementById("submit").style.display = "inline";
		document.getElementById("cancel").style.display = "inline";
		document.getElementById("name").style.display = "inline-flex";
		document.getElementById("email").style.display = "inline-flex";
		document.getElementById("phoneNumber").style.display = "inline-flex";
		document.getElementById("nameLabel").style.display = "none";
		document.getElementById("emailLabel").style.display = "none";
		document.getElementById("phoneLabel").style.display = "none";
		document.getElementById("change-pass").style.display = "none";
		document.getElementById("edit-names").style.display = "none";
		
		});

	
	$( "#cancel" ).click(function() {
		document.getElementById("submit").style.display = "none";
		document.getElementById("cancel").style.display = "none";
		document.getElementById("name").style.display = "none";
		document.getElementById("email").style.display = "none";
		document.getElementById("phoneNumber").style.display = "none";
		document.getElementById("nameLabel").style.display = "inline-flex";
		document.getElementById("emailLabel").style.display = "inline-flex";
		document.getElementById("phoneLabel").style.display = "inline-flex";
		document.getElementById("change-pass").style.display = "inline-flex";
		document.getElementById("edit-names").style.display = "inline-flex";
		});
		

</script>
	</div>
 <!-- Footer -->
    <footer class="text-center">
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; iFoolU.com 2017
                    </div>
                </div>
            </div>
        </div>
    </footer>
  </body>
</html>