<%-- 
    Document   : cart
    Created on : 29 Jul 2024, 23:11:36
    Author     : arets
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Javas.Product" %>
<%@ page import="Javas.CartUtils" %>

<%
    // Retrieve the cart from the session and calculate the total price
    ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
    float totalPrice = 0;

    if (cart != null) {
        totalPrice = CartUtils.calculateTotalPrice(cart);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>All For Mountains - Your Cart</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="css/styleCart.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fork-awesome@1.1.7/css/fork-awesome.min.css" integrity="sha256-gsmEoJAws/Kd3CjuOQzLie5Q3yshhvmo7YNtBG7aaEY=" crossorigin="anonymous">
    <link rel="icon" href="img/Logo-Bike-96x96.png" type="image/png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="bg-background">
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-black fixed-top text-center compact-navbar">
    <div class="container">
        <!-- Brand Logo -->
        <a class="navbar-brand montblack" href="index.html"><img src="img/Logo-Bike-96x96.png" width="40" height="40" /> All For Mountains </a>
        <!-- Toggler Button for Collapsed Navigation -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar Links -->
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto montlight" style="padding-right: 40px;">
                <!-- Home Link -->
                <li class="nav-item">
                    <a class="nav-link" href="WelcomeServlet">Home</a>
                </li>
                <!-- Shop Dropdown -->
                <li class="nav-item active dropdown montlight" id="shop">
                    <a class="nav-link dropdown-toggle" href="#" role="button" id="dropshop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        SHOP <span class="sr-only">(current)</span>
                    </a>
                    <div class="dropdown-menu bg-dark bg-black" aria-labelledby="dropshop">
                        <a class="dropdown-item text-white" href="QueryServlet?producttype=Mountain Bikes">Mountain Bikes </a>
                        <a class="dropdown-item text-white" href="QueryServlet?producttype=Hiking Clothes">Hiking Clothes</a>
                        <a class="dropdown-item text-white" href="QueryServlet?producttype=Hiking Boots">Hiking Boots</a>
                        <a class="dropdown-item text-white" href="QueryServlet?producttype=Hiking Tours">Hiking Tours</a>
                    </div>
                </li>
                <!-- Support Dropdown -->
                <li class="nav-item dropdown montlight">
                    <a class="nav-link dropdown-toggle" href="#" role="button" id="dropsupport" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Support
                    </a>
                    <div class="dropdown-menu bg-dark bg-black" aria-labelledby="dropsupport">
                        <a class="dropdown-item text-white" href="contact.html">Contact Us</a>
                    </div>
                </li>
                <!-- Account Dropdown -->
                <li class="nav-item dropdown montlight">
                    <a class="nav-link dropdown-toggle" href="#" role="button" id="dropaccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Account
                    </a>
                    <div class="dropdown-menu bg-dark bg-black" aria-labelledby="dropaccount">
                        <a class="dropdown-item text-white" href="index.html"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                    </div>
                </li>
            </ul>
            <!-- Search Form -->
            <span class="navbar-text montlight">
                <form class="form-inline" action="SearchServlet" method="get">
                    <div class="input-group">
                        <input class="form-control" type="text" name="search" placeholder="Search" aria-label="Search" aria-describedby="Search Button">
                        <div class="input-group-append">
                            <button class="btn btn-outline-warning" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </form>
            </span>
        </div>
    </div>
</nav>
<!-- Cart Container -->
<div class="containerCart">
    <h1>Your Cart</h1>
    <table class="table table-borderless m-auto">
        <thead>
            <tr>
                <th>Image</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Display the products in the cart
                if (cart != null && !cart.isEmpty()) {
                    for (Product product : cart) {
            %>
            <tr>
                <td class="align-middle"><img src="<%= product.getImg() %>" alt="<%= product.getProductName() %>" class="product-img"></td>
                <td class="align-middle"><%= product.getId() %></td>
                <td class="align-middle"><%= product.getProductName() %></td>
                <td class="align-middle"><%= product.getPrice() %> €</td>
                <td class="align-middle"><%= product.getQuantity() %></td>
                <td class="align-middle">
                    <!-- Form to remove the product from the cart -->
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="id" value="<%= product.getId() %>">
                        <input type="hidden" name="name<%= product.getId() %>" value="<%= product.getProductName() %>">
                        <input type="hidden" name="price<%= product.getId() %>" value="<%= product.getPrice() %>">
                        <input type="hidden" name="quantity<%= product.getId() %>" value="<%= product.getQuantity() %>">
                        <input type="hidden" name="img<%= product.getId() %>" value="<%= product.getImg() %>">
                        <input type="hidden" name="type<%= product.getId() %>" value="<%= product.getProductType() %>">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6" class="text-center">Your cart is empty.</td>
            </tr>
            <%
                }
            %>
        </tbody>
        <%
            // Display the total price if the cart is not empty
            if (cart != null && !cart.isEmpty()) {
        %>
        <tfoot>
            <tr>
                <td colspan="4"></td>
                <td class="text-right"><strong>Total Price:</strong></td>
                <td class="text-right"><strong><%= String.format("%.2f", totalPrice) %> €</strong></td>
            </tr>
        </tfoot>
        <%
            }
        %>
    </table>
    <div class="cart-buttons">
        <!-- Proceed to Checkout Button -->
        <form action="OrderServlet" method="post" class="form-inline">
            <button type="submit" class="btn btn-success">Proceed to Checkout</button>
        </form>
        <!-- Back to Shop Button -->
        <form action="home.html" method="get" class="form-inline">
            <button type="submit" class="btn btn-primary">Back to Shop</button>
        </form>
    </div>
    <br><br>
</div>
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap Bundle -->
<script src="js/bootstrap.bundle.js"></script>
</body>
</html>