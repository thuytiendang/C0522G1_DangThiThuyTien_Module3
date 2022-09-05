<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/8/2022
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Update Customer</title>
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="mx-5 px-5 pt-3">
    <h2 class="text-center fw-bold">Update Customer</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/customer"><i class="fa-solid fa-backward"></i> Back to Customer list</a>
    </p>

    <c:if test="${mess!=null}">
        <p>${mess}</p>
    </c:if>

    <div class="d-flex justify-content-center">
        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" action="/customer?action=update"
              method="post">
            <div class="form-group" hidden>
                <label class="h6">Customer:</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="customerId" value="${customer.customerId}" readonly>
                    <span class="input-group-text"> <i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="h6">Name:</label>
                <div class="input-group">
                    <input type="text" id="name" class="form-control" placeholder="Input name" name="customerName" value="${customer.customerName}">
                    <span class="input-group-text"> <i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="dateOfBirth" class="h6">Date of Birth:</label>
                <input type="date" id="dateOfBirth" class="form-control" name="customerBirthday" value="${customer.customerBirthday}">
            </div>

            <div class="mt-3 form-group">
                <label class="h6">Gender:</label>
                <div class="d-flex">
                    <label class="d-block me-4">
                        <input type="radio" value="1" name="customerGender" checked> Male
                        <i class="fa-solid fa-mars"></i>
                    </label>
                    <label class="d-block">
                        <input type="radio" value="0" name="customerGender"> Female
                        <i class="fa-solid fa-venus"></i>
                    </label>
                </div>

            </div>

            <div class="mt-3 form-group">
                <label for="idCard" class="h6">Identity card:</label>
                <div class="input-group">
                    <input type="text" id="idCard" class="form-control" placeholder="Input Id card" name="customerIdCard" value="${customer.customerIdCard}">
                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="phone" class="h6">Phone number:</label>
                <div class="input-group">
                    <input type="text" id="phone" class="form-control" placeholder="Input Phone number" name="customerPhone" value="${customer.customerPhone}">
                    <span class="input-group-text"><i class="fa-solid fa-square-phone"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="email" class="h6">Email:</label>
                <div class="input-group">
                    <input type="text" id="email" class="form-control" placeholder="Input Email" name="customerEmail" value="${customer.customerEmail}">
                    <span class="input-group-text"><i class="fa-solid fa-envelope-circle-check"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="address" class="h6">Address:</label>
                <div class="input-group">
                    <input type="text" id="address" class="form-control" placeholder="Input Address" name="customerAddress" value="${customer.customerAddress}">
                    <span class="input-group-text"><i class="fa-solid fa-map-location-dot"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="customerType">Customer Type:</label>
                <div class="input-group">
                    <select id="customerType" class="form-control" name="customerTypeId">
                        <c:forEach var="customerTypeList" items="${customerTypeList}">
                            <option value="${customerTypeList.getCustomerTypeId()}">${customerTypeList.getCustomerTypeName()}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-ranking-star"></i></span>
                </div>
            </div>

            <div class="mt-3 text-center">
                <button class="btn btn-info btn-sm border border-2 border-success">
                    -- Save <i class="fa-solid fa-floppy-disk"></i> --
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>
