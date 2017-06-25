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

  <!-- Font Awesome import for icons-->
  	<script src="https://use.fontawesome.com/30dab5103b.js"></script>

  <!-- Required imports for bootstrap -->
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <!-- Local CSS-->
  	<link rel="stylesheet" type="text/css" href="css/clientside.css">

	<link rel="stylesheet" type="text/css" href="css/override.css">
	
	
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
                  	<a class="go-to-cart" href="#">Cart</span><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span id="cartTotal"></span></a>
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
<input style="display: none;" name="passCart" id="passCart" value= "${sessionScope.store}">
        <!-- Page Heading -->
<div class="wrap" style="min-height: 100%;">
        <h1 style="margin-left: 10%;" class="my-4"><span id="tricksForSale" value="Tricks"/></h1><br>

<div class="dropdown magician-name text-center">
		    <button class="btn dropdown-toggle" type="button" data-toggle="dropdown">Select a Magician to View Tricks
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu dropdown-menu-center">
		    ${sessionScope.dropDown}
		    </ul>
	</div>
	<br>
${sessionScope.store}
<div class="container order-list">

<script>

	$(".go-to-cart").click(function(event){
		event.preventDefault();
		window.location="cart.jsp";
	});
	
	 $(".add-to-cart").click(function(event){
		
		event.preventDefault();
		var id= Number($(this).attr("data-id"));
		var price = Number($(this).attr("data-price"));
		var name = $(this).attr("data-name");
		var image = $(this).attr("data-img");
		var description = $(this).attr("data-description");
		
		addItemToCart(id, price, 1, image, name, description);
		displayCart();
		saveCart();
		console.log(JSON.stringify(cart));
	});
	
	function displayCart(){
		var cartArray = listCart()
		var output = ""
		for(var i in cartArray){
		
			output += "<li>"+cartArray[i].id+" " + cartArray[i].quantity +"</li>"
		}
		
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
	
	function addItemToCart(id,price,quantity, image, name, description) {	//add an item to the cart
	
		for(var i in cart){
			
			if(cart[i].id === id){
				cart[i].quantity += quantity;
				return;
			}
		
		}
		var item= new Item(id,price,quantity, image, name, description);
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
	
	var store = document.getElementById("passCart").value;
	
	if(store){
		span = document.getElementById("tricksForSale");
		txt = document.createTextNode("${sessionScope.magicianName}'s Store");
		span.innerText = txt.textContent;
	}
	
	function saveCart(){
		sessionStorage.setItem("shoppingCart", JSON.stringify(cart));
	}
	
	function loadCart(){
		if(JSON.parse(sessionStorage.getItem("shoppingCart"))){
			cart = JSON.parse(sessionStorage.getItem("shoppingCart"));
		}
	}
	
	/* $(window).on('beforeunload', function(){
	    
			$.ajax({
	            url:'CartExchange',
	            data:{cartSession: JSON.stringify(cart)},
	            type:'get',
	            cache:false,
	            success:function(data){
	               
	            },
	            error:function(){
	              
	            }
	         }
	    );
	}); */
	
	loadCart();
	displayCart();
	
	</script>
	</div>
</div>
 <!-- Footer -->
    <footer class="text-center navbar-static-bottom">
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