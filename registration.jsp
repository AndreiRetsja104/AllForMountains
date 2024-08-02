<%-- 
    Document   : registration
    Created on : 29 Jul 2024, 06:21:06
    Author     : arets
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Page Metadata -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All For Mountains - Register</title>

    <!-- CSS Files -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fork-awesome@1.1.7/css/fork-awesome.min.css" integrity="sha256-gsmEoJAws/Kd3CjuOQzLie5Q3yshhvmo7YNtBG7aaEY=" crossorigin="anonymous">
    <link rel="icon" href="img/Logo-Bike-96x96.png" type="image/png" />
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-black bg-black fixed-top pt-4 pb-4 text-center">
    <div class="container">
        <!-- Brand Logo and Name -->
        <a class="navbar-brand montblack" href="index.html">
            <img src="img/Logo-Bike-96x96.png" width="40" height="40" alt="Logo"/> All For Mountains
        </a>
        
        <!-- Toggler for Responsive Navbar -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto montlight" style="padding-right: 40px;">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item dropdown montlight">
                    <a class="nav-link dropdown-toggle" href="#" role="button" id="dropsupport" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Support
                    </a>
                    <div class="dropdown-menu bg-dark bg-black" aria-labelledby="dropsupport">
                        <a class="dropdown-item text-white" href="contact.html">Contact Us</a>
                    </div>
                </li>
                <li class="nav-item active dropdown montlight">
                    <a class="nav-link dropdown-toggle" href="#" role="button" id="dropaccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Account <span class="sr-only">(current)</span>
                    </a>
                    <div class="dropdown-menu bg-dark bg-black" aria-labelledby="dropaccount">
                        <a class="dropdown-item text-white" href="login.html"><i class="fa fa-key" aria-hidden="true"></i> Login</a>
                        <a class="dropdown-item text-white" href="registration.html"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
                    </div>
                </li>
            </ul>
            <!-- Search Form -->
            <span class="navbar-text montlight">
                <form class="form-inline" action="SearchServlet" method="get">
                    <div class="input-group">
                        <input class="form-control" type="text" name="search" placeholder="Search" aria-label="Search" aria-describedby="Search Button">
                        <div class="input-group-append">
                            <a data-toggle="modal" data-target="#exampleModal" class="btn btn-outline-warning"><i class="fa fa-search" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </form>
            </span>
        </div>
    </div>
</nav>

<!-- Registration Form Section -->
<section class="welcome">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 login">
                <form action="RegistrationServlet" method="post" class="form">
                    <h1 class="ProductSans text-white bold">Sign Up</h1>
                    <p class="montlight text-white">Fill out your information below to Sign Up!</p>

                    <!-- Error Message Display -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </c:if>

                    <!-- Form Fields -->
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="pass" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <div class="form-group">
                        <select name="PostalRegion" id="postal" class="form-control">
                            <option value="" disabled selected>Select Your Region</option>
                            <option>Africa</option>
                            <option>Australia</option>
                            <option>Asia</option>
                            <option>Europe</option>
                            <option>North America</option>
                            <option>South America</option>
                        </select>
                    </div>
                    <input type="submit" class="btn btn-outline-warning ProductSans" value="REGISTER"/>
                    <p class="montlight text-white">Already a member? <a href="login.html">Login!</a></p>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script src="js/bootstrap.bundle.js"></script>
</body>
</html>
