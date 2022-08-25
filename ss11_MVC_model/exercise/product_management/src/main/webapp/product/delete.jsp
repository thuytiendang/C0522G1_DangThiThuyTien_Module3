<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/8/2022
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/product">Back to products list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product Information</legend>
        <table>
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
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/product">Back to products list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
