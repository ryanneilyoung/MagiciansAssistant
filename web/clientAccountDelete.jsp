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
<form class="form-horizontal" action="ClientAccountDeleteExchange" id="form" method="POST">
<fieldset>

<!-- Form Name -->
<H1 style="margin-left: 15%;">Delete Account</H1>
<hr style="height:1px;border:none;color:#d3d3d3;background-color:#d3d3d3;">

<!-- Name-->

<div class="form-group">
  <label class="col-md-4 control-label" for="phone">Enter password to confirm delete:  </label>  
  <div class="col-md-4">
  	<input id="confirmPass" name="confirmPass" type="password" placeholder="" class="form-control input-md">
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>  
  <div class="col-md-5">
  <div class='btn-group pull-right' role='group' aria-label='...' style='margin-top:10px; margin-bottom: 10px;'>
  	<a href="ClientAccountExchange" type='button' class='btn btn-default' id="cancel">&nbsp;Cancel</a>
  	<button class="btn btn-default btn-danger delete-account" id="delete-account"><i class="fa fa-times-circle"></i>&nbsp;Delete Account</button>
  	</div>
  </div>
</div>
</fieldset>
</form>
</div>
<script>

	$( "#delete-account" ).click(function(event) {
		event.preventDefault();
		var form = document.getElementById("form");
		bootbox.confirm({
		    title: "Delete Account?",
			message: "Deleting your account will result in all your information being deleted. Are you sure you would like to continue?",
		    buttons: {
		        confirm: {
		            label: '<i class="fa fa-times-circle"></i> Yes, delete my account',
		            className: 'btn-danger'
		        },
		        cancel: {
		            label: 'Cancel'
		        }
		    },
		    callback: function (result) {
		        if(result){
		        	form.submit();
		        }
		        else{
		        	return;
		        }
		    }
		});
	});
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
		loadCart();
		$("#cartTotal").html(displayCountCart());
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