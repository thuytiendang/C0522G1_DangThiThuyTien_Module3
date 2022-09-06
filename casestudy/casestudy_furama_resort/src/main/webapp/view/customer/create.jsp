<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/8/2022
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Add new Customer</title>
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
    <h2 class="text-center fw-bold">Add new Customer</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/customer"><i class="fa-solid fa-backward"></i> Back to Customer list</a>
    </p>

    <c:if test="${mess!=null}">
        <c:if test="${!check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-success alert-dismissible fade show w-50 text-center">
                    <strong>Congratulations!</strong> ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

    </c:if>


    <div class="d-flex justify-content-center">
        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" action="/customer?action=create"
              method="post">
            <div class="form-group">
                <label for="name" class="h6">Name:</label>
                <div class="input-group">
                    <input type="text" id="name" class="form-control" value="${customer.customerName}" placeholder="Input name" name="customerName">
                    <span class="input-group-text"> <i class="fa-solid fa-person-circle-question"></i></span>
                </div>

                <c:if test="${map.get('empty_name') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_name')}" />
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_name') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_name')}" />
                    </div>
                </c:if>
            </div>

            <div class="mt-3 form-group">
                <label for="dateOfBirth" class="h6">Date of Birth:</label>
                <input type="date" id="dateOfBirth" class="form-control" name="customerBirthday">
                <c:if test="${map.get('empty_birthday') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_birthday')}" />
                    </div>
                </c:if>
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
                    <input type="text" id="idCard" class="form-control" placeholder="Input Id card" value="${customer.customerIdCard}" name="customerIdCard">
                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                </div>

                <c:if test="${map.get('empty_IDCard') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_IDCard')}" />
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_IDCard') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_IDCard')}" />
                    </div>
                </c:if>
            </div>

            <div class="mt-3 form-group">
                <label for="phone" class="h6">Phone number:</label>
                <div class="input-group">
                    <input type="text" id="phone" value="${customer.customerPhone}" class="form-control" placeholder="Input Phone number" name="customerPhone">
                    <span class="input-group-text"><i class="fa-solid fa-square-phone"></i></span>
                </div>
                <c:if test="${map.get('empty_phone') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_phone')}" />
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_phone') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_phone')}" />
                    </div>
                </c:if>
            </div>

            <div class="mt-3 form-group">
                <label for="email" class="h6">Email:</label>
                <div class="input-group">
                    <input type="text" id="email" class="form-control" placeholder="Input Email"  value="${customer.customerEmail}" name="customerEmail">
                    <span class="input-group-text"><i class="fa-solid fa-envelope-circle-check"></i></span>
                </div>
                <c:if test="${map.get('empty_email') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('empty_email')}" />
                    </div>
                </c:if>
                <c:if test="${map.get('invalid_email') != null}">
                    <div class="alert alert-danger mt-3" role="alert">
                        <c:out value="${map.get('invalid_email')}" />
                    </div>
                </c:if>
            </div>

            <div class="mt-3 form-group">
                <label for="address" class="h6">Address:</label>
                <div class="input-group">
                    <input type="text" id="address" class="form-control" placeholder="Input Address" name="customerAddress">
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