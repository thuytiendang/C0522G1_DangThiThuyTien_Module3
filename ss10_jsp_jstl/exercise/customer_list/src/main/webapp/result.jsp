<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/8/2022
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<table class="table table-hover align-middle" >
    <thead>
    <tr>
        <td colspan="4"><h1>Danh sách khách hàng</h1></td>
    </tr>
    <tr style="background-color: aquamarine">
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Hình ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cus" items="${customer}">
        <tr  >
            <td><c:out value="${cus.name}"/></td>
            <td><c:out value="${cus.date}"/></td>
            <td><c:out value="${cus.address}"/></td>
            <td><img src="${cus.picture}" alt=""></td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</html>
