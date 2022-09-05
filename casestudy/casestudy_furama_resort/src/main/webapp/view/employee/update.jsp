<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/9/2022
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Update Employee</title>
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
    <h2 class="text-center fw-bold">Update Employee</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/employee"><i class="fa-solid fa-backward"></i>Back to Employee list</a>
    </p>

    <c:if test="${mess!=null}">
        <p>${mess}</p>
    </c:if>

    <div class="d-flex justify-content-center">
        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" action="/employee?action=update"
              method="post">
            <div class="form-group" hidden>
                <label class="h6">Employee:</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="employeeId" value="${employee.employeeId}" readonly>
                    <span class="input-group-text"> <i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="h6">Name:</label>
                <div class="input-group">
                    <input type="text" id="name" class="form-control" placeholder="Input name" name="employeeName" value="${employee.employeeName}">
                    <span class="input-group-text"> <i class="fa-solid fa-person-circle-question"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="dateOfBirth" class="h6">Date of Birth:</label>
                <input type="date" id="dateOfBirth" class="form-control" name="employeeBirthday" value="${employee.employeeBirthday}">
            </div>

            <div class="mt-3 form-group">
                <label for="idCard" class="h6">Identity card:</label>
                <div class="input-group">
                    <input type="text" id="idCard" class="form-control" placeholder="Input Id card" name="employeeIdCard" value="${employee.employeeIdCard}">
                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="salary" class="h6">Salary:</label>
                <div class="input-group">
                    <input type="text" id="salary" class="form-control" placeholder="Input salary" name="employeeSalary" value="${employee.employeeSalary}">
                    <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="phone" class="h6">Phone number:</label>
                <div class="input-group">
                    <input type="text" id="phone" class="form-control" placeholder="Input Phone number" name="employeePhone" value="${employee.employeePhone}">
                    <span class="input-group-text"><i class="fa-solid fa-square-phone"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="email" class="h6">Email:</label>
                <div class="input-group">
                    <input type="text" id="email" class="form-control" placeholder="Input Email" name="employeeEmail" value="${employee.employeeEmail}">
                    <span class="input-group-text"><i class="fa-solid fa-envelope-circle-check"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="address" class="h6">Address:</label>
                <div class="input-group">
                    <input type="text" id="address" class="form-control" placeholder="Input Address" name="employeeAddress" value="${employee.employeeAddress}">
                    <span class="input-group-text"><i class="fa-solid fa-map-location-dot"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="positionId">Position:</label>
                <div class="input-group">
                    <select id="positionId" class="form-control" name="positionId">
                        <c:forEach var="positionList" items="${positionList}">
                            <option value="${positionList.getPositionId()}">${positionList.getPositionName()}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-person"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="educationDegreeId">Degree:</label>
                <div class="input-group">
                    <select id="educationDegreeId" class="form-control" name="educationDegreeId">
                        <c:forEach var="educationDegreeList" items="${educationDegreeList}">
                            <option value="${educationDegreeList.getEducationDegreeId()}">${educationDegreeList.getEducationDegreeName()}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-user-graduate"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="divisionId">Division:</label>
                <div class="input-group">
                    <select id="divisionId" class="form-control" name="divisionId">
                        <c:forEach var="divisionList" items="${divisionList}">
                            <option value="${divisionList.getDivisionId()}">${divisionList.getDivisionName()}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-regular fa-building-user"></i></span>
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