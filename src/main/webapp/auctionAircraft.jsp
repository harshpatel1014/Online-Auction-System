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

<label for="airCategory"><b>Airplane Category</b></label>
<select name="airCategory" id="airCategory">
    <option value="" selected disabled hidden="hidden">type</option>
    <option value="Jet">Jet</option>
    <option value="Turboprop">Turboprop</option>
    <option value="Piston Single">Piston Single</option>
    <option value="Piston Twin">Piston Twin</option>
    <option value="Light Sport">Light Sport</option>
    <option value="Piston Amphibious/Floatplanes">Piston Amphibious/Floatplanes</option>
    <option value="Turbine Amphibious/Floatplanes">Turbine Amphibious/Floatplanes</option>
    <option value="Piston Helicopters">Piston Helicopters</option>
    <option value="Turbine Helicopters">Turbine Helicopters</option>
</select>
<br>

<label for="engineHours"><b>Engine Hours</b></label>
<input type="number" placeholder="Enter the current engine hours" name="engineHours" id="engineHours"
       min="0" step=".1">

<label for="avionics"><b>Electronic Systems</b></label>
<br>
<textarea placeholder="Enter the aircraft's equipment" name="avionics" id="avionics"></textarea>
<br>

</body>

</html>