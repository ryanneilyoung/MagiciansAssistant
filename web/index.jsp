<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
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

    <!-- Scrolling Nav JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/scrolling-nav.js"></script>
    
    <!-- Local CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">


    <title>iFoolu.com</title>

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
                    <li class="page-scroll">
                        <a href="#header">Magicians</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#pricing">Pricing</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                  <li class="page-scroll">
                      <a href="login.jsp">Login</a>
                  </li>
                  <li class="page-scroll">
                      <a href="registration.jsp">Register</a>
                  </li>
                </ul>
            </div>
          </div>
        </nav>

    <!-- Header -->
        <header id="header" class="header">
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                    <img style="margin-top: 2.5cm;" class="img-responsive center-block" src="${pageContext.request.contextPath}/images/magichat.png" alt=""/>
                        <span class="name">Welcome to iFoolU.com</span>
                        <span class="skills">We have a variety of magicians to choose from</span><br>
                       
	                        
								   <div class="dropdown">
								    <button style="color: black;" class="btn dropdown-toggle dropdown" type="button" data-toggle="dropdown">Select a Magician
								    <span class="caret"></span></button>
								    <ul class="dropdown-menu dropdown-menu-center">
								      ${sessionScope.dropDown}
								    </ul></br>
								  </div>
					      </div>
                    </div>
                </div>
            </div>
    </header>
    <br>
    <section id="about">
      <div class="container">
        <div class="col-lg-12 text-center">
            <h2 style="margin-top: 7%;" id="price-title">About</h2>
        </div>
        <div id="pricing-catergories" class="row">
        ${sessionScope.image}
        </br>
          ${sessionScope.magicianDescription}
        </div>
      </div>
    </section>

    <section id="pricing">
      <div class="container">
        <div class="col-lg-12 text-center">
            <h2 style="margin-top: 7%;" id="price-title">Pricing</h2>
        </div>
        <div id="pricing-catergories" class="row">
          <div class="col-sm-4">
              <h3 class="pricing-titles">
                School Show
              </h3>
              <p id="price">${sessionScope.schoolDescription}</p>
          </div>
          <div class="col-sm-4">
            <h3 class="pricing-titles">
              Personal Show
            </h3>
            <p id="price">${sessionScope.personalDescription}</p>
            </div>
          <div class="col-sm-4">
            <h3 class="pricing-titles">
              Corporate Show
            </h3>
            <p id="price">${sessionScope.corporateDescription}</p>
          </div>
        </div>
      </div>
    </section>
<script>
$(document).on('click', 'a', function(event){

    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 600);
});
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
