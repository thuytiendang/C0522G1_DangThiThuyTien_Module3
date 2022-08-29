<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/8/2022
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<h3 class="text-danger">Xóa người dùng</h3>
<h4>Bạn có muốn xóa người dùng này?</h4>
<form method="post">
    <fieldset>
        <legend>Thông tin khách hàng</legend>
        <pre>Id:                <span>${user.getId()}</span></pre>
        <pre>Tên người dùng:    <span>${user.getName()}</span></pre>
        <pre>Email:             <span>${user.getEmail()}</span></pre>
        <pre>Quốc gia:          <span>${user.getCountry()}</span></pre>
        <input type="submit" value="Delete">
    </fieldset>
</form>
<a href="/user">< Quay lại trang Danh sách người dùng</a>
</body>
</html>
