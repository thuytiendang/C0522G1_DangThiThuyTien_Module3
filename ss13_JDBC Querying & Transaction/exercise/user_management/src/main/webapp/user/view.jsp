<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/8/2022
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View User</title>
</head>
<body>
<h3 style="color: blue">Thông tin chi tiết người dùng</h3>

<pre>Id:                <span>${user.getId()}</span></pre>
<pre>Tên người dùng:    <span>${user.getName()}</span></pre>
<pre>Email:             <span>${user.getEmail()}</span></pre>
<pre>Quốc gia:          <span>${user.getCountry()}</span></pre>

<a href="/user">Quay lại danh sách người dùng</a>
</body>
</html>
