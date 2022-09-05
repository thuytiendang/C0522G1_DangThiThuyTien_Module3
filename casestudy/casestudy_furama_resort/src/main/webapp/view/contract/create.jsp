<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/9/2022
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Add new Contract</title>
    <style>
        body {
            background-color: #d0ccd0;
            /*background-image: url("https://phuonganhviolet.com/wp-content/uploads/2019/02/garden-of-words.jpg");*/
        }
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
    <h2 class="text-center fw-bold">Add new Contract</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/contract"><i class="fa-solid fa-backward"></i> Back to Contract list</a>
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

        <c:if test="${check}">
            <div class="justify-content-center d-flex">
                <div class="alert alert-danger alert-dismissible fade show w-50 text-center">
                    <strong>Sorry!</strong> ${mess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>

    <div class="d-flex justify-content-center">

        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" action="/contract?action=create"
              method="post">
            <div class="form-group">
                <label for="startDay" class="h6">Start day:</label>
                <input type="date" id="startDay" class="form-control" name="startDate">
            </div>

            <div class="mt-3 form-group">
                <label for="endDay" class="h6">End day:</label>
                <input type="date" id="endDay" class="form-control" name="endDate">
            </div>

            <div class="mt-3 form-group">
                <label for="deposit" class="h6">Deposit:</label>
                <div class="input-group">
                    <input type="text" id="deposit" class="form-control" placeholder="Input deposit" name="deposit">
                    <span class="input-group-text"><i class="fa-solid fa-money-bill-wave"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="employee">Employee:</label>
                <div class="input-group">
                    <select id="employee" class="form-control" name="employeeId">
                        <c:forEach var="employee" items="${employeeList}">
                            <option value="${employee.employeeId}">${employee.employeeName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="customer">Customer:</label>
                <div class="input-group">
                    <select id="customer" class="form-control" name="customerId">
                        <c:forEach var="customer" items="${customerList}">
                            <option value="${customer.customerId}">${customer.customerName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="facility">Facility:</label>
                <div class="input-group">
                    <select id="facility" class="form-control" name="facilityId" onchange="changeCost(this)">
                        <c:forEach var="facility" items="${facilityList}">
                            <option value="${facility.facilityId}">${facility.facilityName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-file-signature"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="totalMoney" class="h6">Total money:</label>
                <div class="input-group">
                    <input type="text" id="totalMoney" class="form-control" name="totalMoney" readonly
                           value="${facilityList.get(0).facilityCost}" style="background-color: #b6bac2">
                    <span class="input-group-text"><i class="fa-solid fa-dollar-sign"></i></span>
                </div>
            </div>

            <div class="mt-3 text-center">
                <button class="btn btn-info btn-outline-success btn-sm border border-2 border-success text-dark">
                    -- Save <i class="fa-solid fa-floppy-disk"></i> --
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    function changeCost(fac) {
        let selectFacility = fac.value;
        <c:forEach var="facility" items="${facilityList}">
        if (selectFacility == ${facility.facilityId}) {
            document.getElementById("totalMoney").value = ${facility.facilityCost};
        }
        </c:forEach>
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>
