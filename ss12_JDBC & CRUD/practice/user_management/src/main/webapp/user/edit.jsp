<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/8/2022
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h3>Chỉnh sửa thông tin người dùng</h3>
<c:if test="${mess != null}">
    <p>${mess}</p>
</c:if>
<form method="post">
    <pre>Tên người dùng:       <input type="text" name="name" value="${user.getName()}"></pre>
    <pre>Email:                <input type="text" name="email" value="${user.getEmail()}"></pre>
    <pre>Quốc gia:             <input type="text" name="country" value="${user.getCountry()}"></pre>
    <pre>                      <input type="submit" value="Cập nhật"></pre>
</form>
<a href="/user">Quay lại trang Danh sách người dùng</a>
</body>
</html>
