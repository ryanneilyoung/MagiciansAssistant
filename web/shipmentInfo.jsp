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
<div class="container">       
<form class="form-horizontal" action="PlaceOrderExchange" method="POST" id="form">
<fieldset>

<!-- Form Name -->
<H1 style="margin-left: 15%;">Shipping Information</H1>
<hr style="height:1px;border:none;color:#d3d3d3;background-color:#d3d3d3;">

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="address1">Full Shipping Name:</label>  
  <div class="col-md-2">
  <input id="firstname" name="firstname" type="text" placeholder="" class="form-control input-md" required>
  <span class="help-block">First Name</span>  
  </div>
  <div class="col-md-2">
  <input id="lastname" name="lastname" type="text" placeholder="" class="form-control input-md" required>
  <span class="help-block">Last Name</span>  
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="address1">Address</label>  
  <div class="col-md-5">
  <input id="address" name="address" type="text" placeholder="" class="form-control input-md" required>
  <span class="help-block">Street address, P.O. box, company name, c/o</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Address2">Apartment Number</label>  
  <div class="col-md-5">
  <input id="apartment" name="apartment" type="text" placeholder="" class="form-control input-md">
  <span class="help-block">Apartment, suite , unit, building, floor, etc.</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="zip">Zip/Postal code</label>  
  <div class="col-md-4">
  <input id="zip" name="zip" type="text" placeholder="Zip or Postal Code" class="form-control input-md" required>
  </div>
</div>

<!-- City input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="city">City/Town</label>  
  <div class="col-md-5">
  <input id="city" name="city" type="text" placeholder="City or Town" class="form-control input-md" required>
  </div>
</div>

<!-- Province input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="Province">Province</label>  
  <div class="col-md-5">
  <select id="province" name="province" placeholder="Province" class="form-control" required>
  		<option value="AB">Alberta</option>
		<option value="BC">British Columbia</option>
		<option value="MB">Manitoba</option>
		<option value="NB">New Brunswick</option>
		<option value="NL">Newfoundland and Labrador</option>
		<option value="NS">Nova Scotia</option>
		<option value="ON">Ontario</option>
		<option value="PE">Prince Edward Island</option>
		<option value="QC">Quebec</option>
		<option value="SK">Saskatchewan</option>
		<option value="NT">Northwest Territories</option>
		<option value="NU">Nunavut</option>
		<option value="YT">Yukon</option>
	</select>
  </div>
</div>

<!-- payment title -->

<H2 style="margin-left: 25%; margin-top: 35px; margin-bottom: 25px;">Payment Information</H2>

<!-- Credit Card -->

<div class="form-group">
  <label class="col-md-4 control-label" for="credit">Credit Card Number</label>  
  <div class="col-md-5">
  <input id="creditcard" name="creditcard" type="text" placeholder="Credit Card" class="form-control input-md" required>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="Expiration">Expiration date</label>
  <div class="col-md-1">
     <select id="date" name="date" class="form-control" required>
         <option value="01">January</option>
         <option value="02">February </option>
         <option value="03">March</option>
         <option value="04">April</option>
         <option value="05">May</option>
         <option value="06">June</option>
         <option value="07">July</option>
         <option value="08">August</option>
         <option value="09">September</option>
         <option value="10">October</option>
         <option value="11">November</option>
         <option value="12">December</option>
     </select>
     </div>
     <div class="col-md-2">
     <select id="year" name="year" class="form-control" required>
         <option value="17"> 2017</option>
         <option value="18"> 2018</option>
         <option value="19"> 2019</option>
         <option value="20"> 2020</option>
         <option value="21"> 2021</option>
         <option value="22"> 2022</option>
     </select>
     </div>
</div>


<input type="hidden" name="passCart" id="passCart" value="">

<!-- Confirmation button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>  
  <div class="col-md-5">
  <div class='btn-group pull-right' role='group' aria-label='...' style='margin-top:10px; margin-bottom: 10px;'>
  	<a href="cart.jsp" type='button' class='btn btn-default'><span class='fa fa-times'></span>&nbsp;Cancel</a>
  	<button type='submit' class='btn btn-default btn-success' id="submit"><span class='	fa fa-plane'></span>&nbsp;Ship Order</button>
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

	
	$( document ).ready(function() {
		loadCart();
		var passCart = JSON.stringify(cart);
		$("#passCart").val(passCart);
		$("#cartTotal").html(displayCountCart());
	});

	var elements = document.querySelectorAll('input,select,textarea');

	for (var i = elements.length; i--;) {
	    elements[i].addEventListener('invalid', function () {
	        this.scrollIntoView(false);
	    });
	}
	
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