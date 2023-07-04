<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ebay</title>
    <link rel="stylesheet" href="css/main.css">
    <script src="js/main.js"></script>
</head>

<body>
<%@ include file="navigationBar.jsp" %>
<% if ((session.getAttribute("user") == null)) { %>
<div class="marginLeft-Right">
    <h1> ebay</h1>
    <hr>
    <a href="login.jsp">Login</a>
    <br>
    <a href="register.jsp">Register</a>
</div>
<%} else { %>
<%@include file="auctionClosedCheck.jsp" %>
<%
    response.setIntHeader("Refresh", 20);
    Account userAccount = (Account) session.getAttribute("userAccount");
    if (userAccount.getAccessLevel() > 1) {%>
<div class="marginLeft-Right">
    <h1> ebay</h1>
    <hr>
    <a href="auctionList.jsp">List of Auctions</a>
    <br>
</div>
<% } else { %>
<div class="marginLeft-Right">
    <h1> ebay</h1>
    <hr>
    <a href="profile.jsp">admin functions</a>
    <br>
</div>
<% } %>
<% } %>
</body>

</html>