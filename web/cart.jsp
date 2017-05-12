<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
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
        <div class="container" style="margin-top:2%; min-height: 100%;">
        <div><h1>Cart Items</h1>
        <hr>
        <div id="cartItem">

        </div>
        </div>
        
<script>
	
	
	 $(".add-to-cart").click(function(event){
		
		event.preventDefault();
		var id= Number($(this).attr("data-id"));
		var price = Number($(this).attr("data-price"));
		
		addItemToCart(id, price, 1);
		displayCart();
		saveCart();
	});
	 
	
	
	function displayCart(){
		var cartArray = listCart();
		var output = ""
		
		if(cartArray.length === 0){
			output+="<div class='row product-row'>"
				+"<div class='col-xs-12 col-sm-7'><div class='media'>"
				+"<div class='media-body'>"
			+"<h4 class='media-heading'>No items currently in cart</h4>"
			+"</div></div></div>"
		}
		for(var i in cartArray){
		
			var name = cartArray[i].name;
			
			output+="<div class='row product-row'>"
			+"<div class='col-xs-12 col-sm-7'><div class='media'>"
					+"<a class='pull-left' href='#'><img class='img-responsive' src='"+ cartArray[i].image +"' style='width: 150px; height: auto;'></a>"
					+"<div class='media-body'>"
						+"<h4 class='media-heading'>" + name +"</h4>"
						+"<p class='text-muted'>"+ cartArray[i].description +"</p>"
					+"</div>"
				+"</div>"		
			+"</div>"
			+"<div class='col-xs-12 col-sm-3'>"
				+"<b>Quanity:</b>  "+ cartArray[i].quantity 
	          +"<br>"
				+"<b>Total:</b>  $" + cartArray[i].price.toFixed(2)
				+"</div>"
			+"<div class='col-xs-12 col-sm-2'>"
				+"<div class='btn-group' role='group' aria-label='...' style='margin-top:10px;'>"
					+"<button type='button' data-id='"+cartArray[i].id+"' id='remove-from-cart'class='btn btn-default btn-danger'><span class='fa fa-close'></span>&nbsp;Remove</button>"
				+"</div>"
			+"</div>"
		+"</div>"
 				
		}
		output+="<div class='row' style='text-align:center;margin-top:15px;'>"
		+"<b>Total Cost Of Cart:</b>  " + totalCart()
		+"</div>"
		+"<div class='row' style='margin-bottom:15px'>"
    	+"<div class='col-xs-12'>"
		+"<div class='btn-group pull-right' role='group' aria-label='...' style='margin-top:10px;'>"
			+"<a href='clientOrder.jsp' type='button' class='btn btn-default btn-info'><span class='fa fa-arrow-left'></span>&nbsp;Back to Products</a>"
			+"<a href='shipmentInfo.jsp' type='submit' class='btn btn-default btn-success'><span class='fa fa-shopping-cart'></span>&nbsp;Checkout</a>"
				+"</div></div></div>"
		
		$("#cartItem").html(output);
		$("#cartTotal").html(displayCountCart());
	} 
	
	var cart = [];
	var Item= function(id, price, quantity, image, name, description){
		this.id= id
		this.price = price
		this.quantity = quantity
		this.image = image
		this.name = name
		this.description = description
	};
	
	function addItemToCart(id,price,quantity, image, name) {	//add an item to the cart
	
		for(var i in cart){
			
			if(cart[i].id === id){
				cart[i].quantity += quantity;
				return;
			}
		
		}
		var item= new Item(id,price,quantity, image, name);
		cart.push(item);
	}
	
	
	function removeItemFromCart(id){	//remove only one of specified item
		for(var i in cart){
		
			if(cart[i].id === id){
				cart[i].quantity --;
				if(cart[i].quantity === 0){
					cart.splice(i, 1);
				}
			}
		}
	
	}
	
	function removeAllItemFromCart(id){	//remove all of one item
		for(var i in cart){
		
		if(cart[i].id === id){
			cart.splice(i, 1);
			break;
			}
		}
	}
	
	function clearCart(){ //remove all items in cart
		cart = [];
	}
	
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
	
	function totalCart(){ //total cost
		var price =0;
		for(var i in cart){
			price += cart[i].price * cart[i].quantity;
		}
		
		if(price === 0){
			return "$0.00";
		}
		else{
			return "$" + price.toFixed(2);
		}
	}
	
	function listCart(){
	
		var cartCopy = [];
		
		for(var i in cart){
			var item = cart[i];
			var itemCopy = {};
			for(var j in item){
				itemCopy[j] = item[j];
			}
			cartCopy.push(itemCopy);
		}
		
		return cartCopy;
	}
	
	function saveCart(){
		sessionStorage.setItem("shoppingCart", JSON.stringify(cart));
	}
	
	function loadCart(){
		if(JSON.parse(sessionStorage.getItem("shoppingCart"))){
			cart = JSON.parse(sessionStorage.getItem("shoppingCart"));
		}
	}
	
	$(document).on("click", "#remove-from-cart", function(){
		 

			var id= Number($(this).attr("data-id"));
			removeAllItemFromCart(id);
			
			displayCart();
			saveCart();
		});
	
	$(document).ready(function() {

		loadCart();
		displayCart();
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