<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/8/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Detail</title>
</head>
<body>
<p>
    <a href="/product">Back to Products List</a>
</p>
<table border="1">
    <tr>
        <td>Product Name: </td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>Manufacture: </td>
        <td>${product.getManufacture()}</td>
    </tr>
</table>
</body>
</html>
