<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/9/2022
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Home</title>
    <style>
        table {
            border: solid 3px;
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
<div class="p-3">

    <h2 class="text-center fw-bold">EMPLOYEE LIST</h2>
    <a href="/employee?action=create">
        <button class="btn btn-success btn-sm my-2">
            <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span> Add new Employee
        </button>
    </a>
    <form action="/employee" class="my-3">
        <input type="text" name="searchName" placeholder="input name">
        <input type="text" name="searchAddress" placeholder="input address">
        <input type="text" name="searchPhone" placeholder="input phone">
        <button type="submit" name="action" value="search" class="btn btn-secondary btn-sm">Search</button>
    </form>

    <table class="table table-striped table-bordered" id="customerTable">
        <thead>
        <tr class="text-center bg-info">
            <th>Number</th>
            <th>Name</th>
            <th>Date of Birth</th>
            <th>Id card</th>
            <th>Salary</th>
            <th>Phone number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position</th>
            <th>Degree</th>
            <th>Division</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="employee" items="${employeeList}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td>${employee.employeeName}</td>
                <td class="text-center">${employee.employeeBirthday}</td>
                <td class="text-center">${employee.employeeIdCard}</td>
                <td class="text-center">${employee.employeeSalary}</td>
                <td class="text-center">${employee.employeePhone}</td>
                <td>${employee.employeeEmail}</td>
                <td>${employee.employeeAddress}</td>
                <c:forEach var="position" items="${positionList}">
                    <c:if test="${position.positionId == employee.positionId}">
                        <td class="text-center">${position.positionName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="degree" items="${educationDegreeList}">
                    <c:if test="${degree.educationDegreeId == employee.educationDegreeId}">
                        <td class="text-center">${degree.educationDegreeName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="division" items="${divisionList}">
                    <c:if test="${division.divisionId == employee.divisionId}">
                        <td class="text-center">${division.divisionName}</td>
                    </c:if>
                </c:forEach>
                <td class="text-center">
                    <a href="/employee?action=update&employee_id=${employee.getEmployeeId()}">
                        <span class="fa-solid fa-user-pen text-primary h4 m-auto"></span>
                    </a>
                </td>
                <td class="text-center">
                    <a data-bs-toggle="modal" data-bs-target="#exampleModal"
                       onclick="deleteCustomer('${employee.getEmployeeId()}','${employee.getEmployeeName()}')">
                        <span class="fa-solid fa-person-circle-minus text-danger h4 m-auto"></span>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a>


    <%--    delete modal--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure to delete <span id="employeeName"></span></p>
                        <input type="hidden" id="employeeId" name="employeeId">
                        <input type="hidden" name="action" value="delete">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="submit" class="btn btn-primary">Yes</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%--<3--%>
<input type="hidden" id="wf" value="${msg}">
<button type="button" id="modalSuccess" hidden class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
</button>

<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="exampleModalLabel1">${msg}</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
<script>
    function deleteCustomer(id,name){
        document.getElementById("employeeName").innerText = name;
        document.getElementById("employeeId").value = id;
    }

    function showSuccessModal(){
        let any = document.getElementById("wf").value;
        if(any){
            document.getElementById("modalSuccess").click();
        }
    }
    showSuccessModal();
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#customerTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>
</body>
</html>
