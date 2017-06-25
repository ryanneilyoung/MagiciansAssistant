<%@ page language="java" contentType="text/html; charset=UTF-8"
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
  	
  <!-- Import for confirmation box -->
    <script src="js/bootbox.min.js"></script>
    

  <!-- Local CSS-->
  	<link rel="stylesheet" type="text/css" href="css/clientside.css">


  	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
  <!--  Fullcalendar imports -->
	<link href='fullcalendar/fullcalendar.min.css' rel='stylesheet'>
	<link href='fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' >
	<script src='fullcalendar/lib/moment.min.js'></script>
	<!--  <script src='fullcalendar/lib/jquery.min.js'></script> -->
	<script src='fullcalendar/fullcalendar.min.js'></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                    <li >
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
                  <li class="dropdown" style=" position: relative; display: inline-block; vertical-align: middle;">
                      <a class="dropdown-toggle" data-toggle="dropdown" id="accountDropDown" href="#">Account<span class="caret"></span></a>
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

 
	<div class="dropdown magician-name text-center">
			<h1 id="magicianName">${sessionScope.magicianName}</h1><br>
		    <button class="btn dropdown-toggle btn-info" type="button" data-toggle="dropdown" style="width: 50%;">Select a Magician to Begin Booking
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu dropdown-menu-center" style="width: 50%;">
		    ${sessionScope.dropDown}
		    </ul>
		    
	</div>
	
	<div class="container ">	  
      <div class="row">
      	<form action="BookShowExchange" method="POST" id="form">
      	<input style="display: none;" type="hidden" name="confirm" id="confirm" >
      	<div class="col-md-3">
      	<br>
      	<br>
      	<span id="showbuttons">
      	<h3>To begin booking select show type:</h3><br>
      	
      		<button type="button" id="school" class="btn btn-info btn-block">School Show</button><br>
      		<button type="button" id="corporate" class="btn btn-info btn-block">Corporate Show</button><br>
      		<button type="button" id="personal" class="btn btn-info btn-block">Personal Show</button><br>
      		
      		</span>
      		
      		<input type="hidden" name="confirm" id="confirm" value="">
      		
    		<h3 id="schooltitle" style="display: none;">School Show Booking:<br></h3>
    		<h3 id="corporatetitle" style="display: none;">Corporate Show Booking:<br></h3>
    		<h3 id="personaltitle" style="display: none;">Personal Show Booking:<br></h3>
    		
    		<p id="allshows" style="display: none;">
    		
    		<span id="nameofschool">Name of School:<br>
    			<input type="text" id="schoolName" name="schoolname" ><br>
    		</span>
    		
    		<span id="nameofcompany">Name of Company:<br>
    			<input class="companyname" id="companyName" type="text" name="companyname" ><br>
    		</span>
    		
    		Address:<br>
    		<input type="text" id="address" name="address"><br>
    		Date:<br> <input type="text" id="datepicker" name="date" ><br>
    		Start Time:<br> <input type="text" id='starttime' name="starttime" ><br>
    		Length of Show:
    		<span class=styled-select>
    		<select name="showlength" id="showlength">
    		  <option disabled selected value> -- select an option -- </option>
			  <option value="30">30 min</option>
			  <option value="45">45 min</option>
			  <option value="60">1 hr</option>
			</select><br>
			</span>
			<span class=styled-select>
    		<select name="showlength" id="corpLength" data-toggle="tooltip" data-placement="top" title="Corperate and Schools show must be 1 hr in length">
			  <option value="60">1 hr</option>
			</select><br>
			</span>
			<span id="nameofchild">Name of Birthday Child:<br>
    		<input type="text" name="childname" id="childName"><br>
    		Age of child:<br>
    		<input id="spinner" type="number" name="childAge" id="childAge"><br>
    		</span>
    		Number of kids attending:<br>
    		<input id="spinner2" type="number" name="numkids"><br>
    		<span id="adults">Number of adults attending:<br>
    		<input id="spinner3" type="number" name="numadults"><br></span>
      		<span id="schoolShowType">Show type:<br>
      		<span class=styled-select>
    		<select name="schoolShowType">
    		  <option disabled selected value> -- select an option -- </option>
			  <option value="1">Early Literacy (Kindergarten)</option>
			  <option value="2">Challenge Your Senses! (Grade One)</option>
			  <option value="3">Magical Colours! (Grade One)</option>
			  <option value="4">Magic of Magnets! (Grade Two)</option>
			  <option value="5">The ABC's of Character (Grades K-6)</option>
			  <option value="6">The Magic of Reading (Grades K-9)</option>
			  <option value="7">Beyond Bullying (K-9)</option>
			</select>
			</span><br></span>
			<br>
			<span id="kidorstage"><input type="checkbox" name="kidShow" value="true">Kid Show<br>
			<input type="checkbox" name="stageShow" value="true">Stage Show<br><br></span>
      		How did you hear about me?:<br>
      		<span class=styled-select>
    		<select id="advertising" name="advertising">
    		  <option disabled selected value> -- select an option -- </option>
			  <option value="1">Have booked a show before</option>
			  <option value="2">Referral</option>
			  <option value="3">Mailings</option>
			  <option value="4">Calgary's Child</option>
			  <option value="5">Google</option>
			  <option value="6">Gigmasters</option>
			  <option value="7">Gigsalad</option>
			  <option value="8">Other</option>
			</select>
			</span><br>
      		</p>
      		<div id="bookcancel" class="btn-group btn-group-justified" style="display: none;">
      		<div class ="btn-group">
      		<button type="submit" name="enter" id="enter" class="btn btn-info btn-block" value="">Submit</button>

      		</div>
      		<div class ="btn-group">
      		<button type="button" id="cancel" class="btn btn-secondary btn-block">Cancel</button>
      		</div>
      		</div>
    
    	</div>
        </form>
        <div class="col-md-8 calendar-container">
        <div id='calendar'></div>
        </div>
      </div>
     </div>
     
     <input type="hidden" id="magicName" name="magicianName" value=${sessionScope.magicianName}>

<script>
var magicianName = $("#magicName").val();
var date = Date();
	$(document).ready(function(){
		
		loadCart();
		$("#cartTotal").html(displayCountCart());
		
		$('[data-toggle="tooltip"]').tooltip();
		

		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			displayEventEnd: {
                    month: true,
                    basicWeek: true,
                    "default": true
                },
			defaultDate: date,
			navLinks: true, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [${sessionScope.calendarValues}]});
		$('#starttime').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 15,
		    minTime: '10',
		    maxTime: '6:00pm',
		    defaultTime: '',
		    startTime: '10:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});

		$('#datepicker').datepicker();
		
		$("#school").click(function(){
			
			if(magicianName == null || magicianName == ""){
				alert("Must select a magician to book show");
				return;
			}
			$("#confirm").val("school");
			
			$("#showbuttons").hide();
	        $("#allshows").show();
	        $("#bookcancel").show();
			$("#schooltitle").show();
			$("#corpLength").show();
			$("#showlength").hide();
			
			$("#adults").hide();
			$("#nameofcompany").hide();
			
			$("#schoolShowType").show();
			$("#nameofschool").show();
			
			$("#nameofchild").hide();

			$("#kidorstage").hide();
			
			$("#schoolName").prop('required',true);
			$("#address").prop('required',true);
			$("#datepicker").prop('required',true);
			$("#starttime").prop('required',true);
			$("#schoolShowType").prop('required',true);
			
			
	    });
		$("#personal").click(function(){
			
			if(magicianName == null || magicianName == ""){
				alert("Must select a magician to book show");
				return;
			}
			$("#confirm").val("personal");
			
			$("#showbuttons").hide();
	        $("#allshows").show();
	        $("#bookcancel").show();
	        $("#personaltitle").show();
	        $("#showlength").show();
	        $("#corpLength").hide();
	        
	        $("#adults").hide();
	        $("#nameofcompany").hide();
	        
	        $("#schoolShowType").hide();
	        $("#nameofschool").hide();

	        $("#nameofchild").show();

	        $("#kidorstage").hide();
	        
			$("#address").prop('required',true);
			$("#datepicker").prop('required',true);
			$("#starttime").prop('required',true);
	        
	        
	    });
		$("#corporate").click(function(){
			
			if(magicianName == null || magicianName == ""){
				alert("Must select a magician to book show");
				return;
			}
			
			$("#confirm").val("corporate");
			
			$("#showbuttons").hide();
	        $("#allshows").show();
	        $("#bookcancel").show();
	        $("#corporatetitle").show();
	        $("#showlength").hide();
	        
	        $("#corpLength").show();
	        
	        $("#adults").show();
	        $("#nameofcompany").show();
	        
	        $("#schoolShowType").hide();
	        $("#nameofschool").hide();
	        
	        $("#nameofchild").hide();

	        $("#kidorstage").show();
	        
	        $("#companyName").prop('required',true);
			$("#address").prop('required',true);
			$("#datepicker").prop('required',true);
			$("#starttime").prop('required',true);
			$("#schoolShowType").prop('required',true);
	    });
		$("#cancel").click(function(){
			$("#allshows").hide();
			$("#bookcancel").hide();
			$("#personaltitle").hide();
			$("#schooltitle").hide();
			$("#corporatetitle").hide();
			$("#schoolShowType").hide();
			$("#nameofschool").hide();
			$("#adults").hide();
			$("#nameofcompnay").hide();
			$("#nameofchild").hide();
			$("#kidorstage").hide();
			$("#corpLength").hide();
			
			$("#showbuttons").show();
			
			$("#companyName").prop('required',false);
			$("#schoolName").prop('required',false);
			$("#address").prop('required',false);
			$("#datepicker").prop('required',false);
			$("#starttime").prop('required',false);
			$("#schoolShowType").prop('required',false);
	    });
		
		$("#enter").click(function(event){
			event.preventDefault();
			
			var address = document.getElementById("address").value;
			var startTime = document.getElementById("starttime").value;
			var date = document.getElementById("datepicker").value;
			var length = document.getElementById("showlength").value;
			
			if(!date || !address || !startTime ){
				bootbox.alert("Missing Information", callback);
				return;
			}

			bootbox.confirm({
			    title: "Booking Show",
				message: "Would you like to continue?",
			    buttons: {
			        confirm: {
			            label: '<i class="fa fa-calendar" aria-hidden="true"></i> Yes, book my show',
			            className: 'btn-success'
			        },
			        cancel: {
			            label: 'Cancel'
			        }
			    },
			    callback: function (result) {
			        if(result){
			        	document.getElementById("form").submit();
			        	}
			        else{
			        	return;
			        }
			    }
			});
		});
	});
	
	$(function() {
        $('#spinner').spinner({
            min: 1,
            step: 1
        });
    });
	
	$(function() {
        $('#spinner2').spinner({
            min: 1,
            step: 1
        });
    });
	$(function() {
        $('#spinner3').spinner({
            min: 1,
            step: 1
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
	
	function formatDate(dt) {
	    var dd = dt.getDate();
	    var mm = dt.getMonth() + 1;
	    var yyyy = dt.getFullYear();
	    return dd + "/" + mm + "/" + yyyy;
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