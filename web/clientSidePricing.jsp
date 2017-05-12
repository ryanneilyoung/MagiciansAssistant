<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Arima+Madurai:100" rel="stylesheet">

  <!-- Font Awesome import for icons-->
  	<script src="https://use.fontawesome.com/30dab5103b.js"></script>

  <!-- Required imports for bootstrap -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <!-- Local CSS-->
  	
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
	 
	
  <title>iFoolu</title>
  </head>
  <body style="margin-top: 5%;">
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
                  	<a class="go-to-cart" href="cart.jsp">Cart</span><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span id="cartTotal"></span></a>
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
        
<section id="pricing">
      <div class="container">
        <div class="col-lg-12 text-center">
            <h2 id="price-title">Pricing</h2>
        </div>
        <div class="dropdown col-lg-12 text-center">
		    <button style="color: black;" class="btn dropdown-toggle dropdown" type="button" data-toggle="dropdown">Select a Magician
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu dropdown-menu-center">
		      ${sessionScope.dropDown}
		    </ul></br>
		  </div>
        <div id="pricing-catergories" class="row">
          <div class="col-sm-4">
              <h3 class="pricing-titles">
                School Show
              </h3>
              <p id="price">${sessionScope.schoolPrice}</p>
          </div>
          <div class="col-sm-4">
            <h3 class="pricing-titles">
              Personal Show
            </h3>
            <p id="price">${sessionScope.personalPrice}</p>
            </div>
          <div class="col-sm-4">
            <h3 class="pricing-titles">
              Corporate Show
            </h3>
            <p id="price">${sessionScope.corporatePrice}</p>
          </div>
        </div>
      </div>
</section>
<script>

	$(document).ready(function() {
		loadCart();
		$("#cartTotal").html(displayCountCart());
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
	
	loadCart();
	displayCart();
	</script>
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