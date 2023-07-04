<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.GregorianCalendar" %>
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
    <p>Not logged in</p>
    <br/>
    <a href="login.jsp">Login</a>
</div>
<%} else { %>
<%@include file="auctionClosedCheck.jsp" %>
<%
    String auctionType = request.getParameter("type");
    auctionType = auctionType.substring(0, 1).toUpperCase() + auctionType.substring(1);
%>
<form action="auctionProcess.jsp?type=<%out.print(auctionType);%>" method="POST">
    <div class="container">
        <h1>Create a New <%out.print(auctionType);%> Auction</h1>
        <hr>

        <label for="productID"><b>Identification Number</b></label>
        <input type="text" placeholder="Enter Vin" name="productID" id="productID" required>

        <%if (auctionType.equalsIgnoreCase("car")) {%>
        <label for="manufacturer"><b>Manufacturer</b></label>
        <select name="manufacturer" id="manufacturer" required>
            <option value="" selected disabled hidden>Select a Manufacturer</option>
            <option value="AMC">AMC</option>
            <option value="Aston Martin">Aston Martin</option>
            <option value="Audi">Audi</option>
            <option value="BMW">BMW</option>
            <option value="Bentley">Bentley</option>
            <option value="Bugatti">Bugatti</option>
            <option value="Chevrolet">Chevrolet</option>
            <option value="Edsel">Edsel</option>
            <option value="Ford">Ford</option>
            <option value="Honda">Honda</option>
            <option value="Hudson">Hudson</option>
            <option value="Hummer">Hummer</option>
            <option value="Hyundai">Hyundai</option>
            <option value="Jeep">Jeep</option>
            <option value="Land Rover">Land Rover</option>
            <option value="Lexus">Lexus</option>
            <option value="Lincoln">Lincoln</option>
            <option value="McLaren">McLaren</option>
            <option value="Mercedes-Benz">Mercedes-Benz</option>
            <option value="Nissan">Nissan</option>
            <option value="Other Makes">Other Makes</option>
            <option value="Plymouth">Plymouth</option>
            <option value="Porsche">Porsche</option>
            <option value="Renault">Renault</option>
            <option value="Rolls-Royce">Rolls-Royce</option>
            <option value="Tesla">Tesla</option>
            <option value="Toyota">Toyota</option>
            <option value="Volkswagen">Volkswagen</option>
            <option value="Volvo">Volvo</option>
        </select>
        <br>
        <%} else if (auctionType.equalsIgnoreCase("boat")) {%>
        <label for="manufacturer"><b>Manufacturer</b></label>
        <input type="text" placeholder="Enter name" name="manufacturer" id="manufacturer" required>

        <%} else if (auctionType.equalsIgnoreCase("aircraft")) {%>
        <label for="manufacturer"><b>Manufacturer</b></label>
        <input type="text" placeholder="Enter name" name="manufacturer" id="manufacturer" required>

        <%}%>

        <label for="model"><b>Model (Letters and Numbers only)</b></label>
        <input type="text" placeholder="Enter model name" name="model" id="model" pattern="[a-zA-Z0-9]+" required>

        <label for="condition"><b>New/Used</b></label>
        <select name="condition" id="condition" required>
            <option value="" selected disabled hidden>Select the condition of the vehicle</option>
            <option value="New">New</option>
            <option value="Used">Used</option>
        </select>
        <br>

        <%int currentYear = Calendar.getInstance().get(Calendar.YEAR);%>
        <label for="year"><b>Year</b></label>
        <input type="number" placeholder="year" name="year" id="year" min="1900" max="<%out.print(currentYear);%>" step="1" required>

        <label for="exteriorColor"><b>Exterior Color</b></label>
        <input type="text" placeholder="exterior color" name="exteriorColor" id="exteriorColor" required>

        <label for="interiorColor"><b>Interior Color</b></label>
        <input type="text" placeholder="interior color" name="interiorColor" id="interiorColor" required>

        <label for="capacity"><b>Capacity</b></label>
        <input type="number" placeholder="capacity" name="capacity" id="capacity" min="1" step="1" required>
        <%if (auctionType.equalsIgnoreCase("car")) {%>
            <%@ include file="auctionCar.jsp" %>
        <%} else if (auctionType.equalsIgnoreCase("boat")) {%>
            <%@ include file="auctionBoat.jsp" %>
        <%} else if (auctionType.equalsIgnoreCase("aircraft")) {%>
            <%@ include file="auctionAircraft.jsp" %>
        <%}%>

        <label for="listPrice"><b>Initial Listing Price($)</b></label>
        <input type="number" placeholder="Enter the price" name="listPrice" id="listPrice" min="1" step="0.01" required>

        <label for="minSellPrice"><b>Minimum Sell Price($)</b></label>
        <input type="number" placeholder="Enter the minimum price" name="minSellPrice" id="minSellPrice" min="1" step="0.01">

        <label for="closingDate"><b>Auction closing Date and Time</b></label>
        <br>
        <%
            Calendar cal = new GregorianCalendar();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            dateFormat.setTimeZone(cal.getTimeZone());
            timeFormat.setTimeZone(cal.getTimeZone());
            String date = dateFormat.format(cal.getTime());
            cal.add(Calendar.MINUTE, 2); // Min auction length is 2 minutes
            String time = timeFormat.format(cal.getTime());
        %>
        <input type="datetime-local" name="closingDate" id="closingDate" min="<%out.print(date);%>T<%out.print(time);%>" required>
        <br>
        <br>

        <button type="submit" class="loginbtn">Start Auction</button>

        <div class="signin">
            <p><a href="auctionList.jsp">List of auction</a>.</p>
        </div>
    </div>
</form>
<% } %>

</body>

</html>