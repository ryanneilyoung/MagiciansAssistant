<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Font Awesome import for icons-->
    <script src="https://use.fontawesome.com/30dab5103b.js"></script>
    <!--Require for Bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Local CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <title>Login</title>
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
                        <a href="index.jsp"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back to main page</a>
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

        <!-- Login Form -->
      <section id="login-form">
        <div class="container" align="center">
          <br><br>
          <h2 id="login-title">Login</h2><br>
			<form action="LoginExchange" method="POST">
				<div class="row">
				  <div class="form-group col-lg-4 col-lg-offset-4">
				    <input type="email" class="form-control input-lg" id="email" placeholder="Email" name="email" autofocus>
				  </div>
				 </div>
			  <div class="row">
				  <div class="form-group col-lg-4 col-lg-offset-4">
				    <input type="password" class="form-control input-lg" id="pwd" placeholder="Password" name="pass">
				  </div>
			  </div><br>
			  <button type="submit" name="login" value="Login" class="btn btn-primary btn-md">Login</button>
			</form>
          <br>
          ${param.message}
        </div>
    </section>

<!-- Footer -->
<footer class="text-center">
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    Copyright &copy; Your Website 2016
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>