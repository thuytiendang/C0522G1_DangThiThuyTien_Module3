<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/8/2022
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Discount Calculator</title>
</head>
<body>
<form action="/DiscountCalculator" method="post">
    <label>Product Description:</label>
    <input name="description" type="text"><br/>
    <label>List Price: </label>
    <input name="price" type="text"><br/>
    <label>Discount Percent: </label>
    <input name="rate" type="text"><br/>
    <input type="submit" value="submit">
</form>
</body>
</html>
