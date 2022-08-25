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
    <title>Products List</title>
</head>
<body>
<h1>Products List</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<table border="1" style="border: aqua">
    <tr style="background-color: cornflowerblue">
        <td>Product name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Manufacture</td>
        <td>Edit</td>
        <td>delete</td>
    </tr>
    <c:forEach items='${products}' var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getManufacture()}</td>
            <td style="background-color: green"><a href="/product?action=edit&id=${product.getId()}">Edit</a></td>
            <td style="background-color: red"><a href="/product?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
