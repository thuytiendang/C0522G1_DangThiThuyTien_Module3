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
    <h2 class="text-center fw-bold">FACILITY LIST</h2>

    <nav class="navbar navbar-expand-lg py-0 my-0">
        <div class="container-fluid">
            <a href="/facility?action=create">
                <button class="btn btn-success btn-outline-secondary btn-sm">
                    <span class="fa-solid fa-house-medical text-light h5 my-auto me-1"></span>
                    <span class="text-light"> Add new Facility</span>
                </button>
            </a>

            <form class="d-flex my-2" role="search" action="/facility">
                <input class="form-control me-2" type="text" placeholder="Input find Facility name"
                       aria-label="Search" name="facilityName" style="width: 210%">
                <select class="form-control me-2" name="facilityTypeName">
                    <option value="">Facility type</option>
                    <c:forEach var="facilityType" items="${facilityTypeList}">
                        <option value="${facilityType.facilityTypeName}">${facilityType.facilityTypeName}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-outline-success" type="submit" name="action" value="search">
                    <i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
    </nav>

    <table class="table table-striped table-bordered" id="customerTable">
        <thead>
        <tr class="text-center bg-info">
            <th>Number</th>
            <th>Name</th>
            <th>Area</th>
            <th>Cost</th>
            <th>Max people</th>
            <th>Standard room</th>
            <th>Other convenience</th>
            <th>Pool area</th>
            <th>Floor</th>
            <th>Facility free</th>
            <th>Type of rent</th>
            <th>Type of facility</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="facility" items="${facilityList}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td>${facility.facilityName}</td>
                <td class="text-center">${facility.facilityArea}</td>
                <td class="text-center">${facility.facilityCost}</td>
                <td class="text-center">${facility.maxPeople}</td>
                <td class="text-center">${facility.standardRoom}</td>
                <td class="text-center">${facility.descriptionOtherConvenience}</td>
                <td class="text-center">${facility.poolArea}</td>
                <td class="text-center">${facility.numberOfFloors}</td>
                <td class="text-center">${facility.facilityFree}</td>
                <c:forEach var="rentType" items="${rentTypeList}">
                    <c:if test="${rentType.rentTypeId == facility.rentTypeId}">
                        <td class="text-center">${rentType.rentTypeName}</td>
                    </c:if>
                </c:forEach>
                <c:forEach var="facilityType" items="${facilityTypeList}">
                    <c:if test="${facilityType.facilityTypeId == facility.facilityTypeId}">
                        <td class="text-center">${facilityType.facilityTypeName}</td>
                    </c:if>
                </c:forEach>
                <td class="text-center">
                    <a href="/facility?action=update&facility_id=${facility.getFacilityId()}">
                        <span class="fa-solid fa-user-pen text-primary h4 m-auto"></span>
                    </a>
                </td>
                <td class="text-center">
                    <a data-bs-toggle="modal" data-bs-target="#exampleModal"
                       onclick="deleteCustomer('${facility.getFacilityId()}','${facility.getFacilityName()}')">
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
                        <h5 class="modal-title" id="exampleModalLabel">Delete Facility</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure to delete <span id="facilityName"></span></p>
                        <input type="hidden" id="facilityId" name="facility_id">
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
        document.getElementById("facilityName").innerText = name;
        document.getElementById("facilityId").value = id;
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
