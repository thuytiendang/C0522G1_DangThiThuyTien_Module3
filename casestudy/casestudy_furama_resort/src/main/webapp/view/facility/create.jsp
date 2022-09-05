<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03/09/2022
  Time: 2:53 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Add new Facility</title>
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
    <h2 class="text-center fw-bold">Add new Facility</h2>

    <p class="text-center mt-3"><a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a></p>

    <p class="text-center">
        <a href="/facility"><i class="fa-solid fa-backward"></i> Back to Facility list</a>
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

        <form class="w-50 border border-2 border-success p-3 bg-warning rounded" action="/facility?action=create"
              method="post">
            <div class="form-group">
                <label class="h6" for="facilityType">Facility type:</label>
                <div class="input-group">
                    <select id="facilityType" class="form-control" name="facilityTypeId" onchange="changeForm(this)">
                        <c:forEach var="facilityType" items="${facilityTypeList}">
                            <option value="${facilityType.facilityTypeId}">${facilityType.facilityTypeName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-house-user"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="facilityName" class="h6">Facility name:</label>
                <div class="input-group">
                    <input type="text" id="facilityName" class="form-control" placeholder="Input Facility name"
                           name="facilityName">
                    <span class="input-group-text"><i class="fa-solid fa-file-signature"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="area" class="h6">Area (m<sup>2</sup>):</label>
                <div class="input-group">
                    <input type="number" id="area" class="form-control" placeholder="Input Facility area" name="facilityArea">
                    <span class="input-group-text"><i class="fa-solid fa-chart-area"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="cost" class="h6">Cost:</label>
                <div class="input-group">
                    <input type="text" id="cost" class="form-control" placeholder="Input Cost" name="facilityCost">
                    <span class="input-group-text"><i class="fa-solid fa-dollar-sign"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label for="maxPeople" class="h6">Maximum number of people:</label>
                <div class="input-group">
                    <input type="number" id="maxPeople" class="form-control"
                           placeholder="Input maximum number of people" name="maxPeople">
                    <span class="input-group-text"><i class="fa-solid fa-person"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group" id="standardRoomForm">
                <label for="standardRoom" class="h6">Standard room:</label>
                <div class="input-group">
                    <input type="text" id="standardRoom" class="form-control" name="standardRoom" value=" -">
                    <span class="input-group-text"><i class="fa-solid fa-star"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group" id="descriptionForm">
                <label for="description" class="h6">Description other convenience:</label>
                <div class="input-group">
                    <input type="text" id="description" class="form-control" name="otherConvenience" value=" -">
                    <span class="input-group-text"><i class="fa-solid fa-book"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group" id="poolAreaForm">
                <label for="poolArea" class="h6">Pool area (m<sup>2</sup>):</label>
                <div class="input-group">
                    <input type="text" id="poolArea" class="form-control" name="poolArea" value="0">
                    <span class="input-group-text"><i class="fa-solid fa-person-swimming"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group" id="numberOfFloorsForm">
                <label for="numberOfFloors" class="h6">Number of floors:</label>
                <div class="input-group">
                    <input type="number" id="numberOfFloors" class="form-control" name="numberOfFloor" value="0">
                    <span class="input-group-text"><i class="fa-solid fa-building"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group" id="facilityFreeForm" style="display: none">
                <label for="facilityFree" class="h6">Facility free:</label>
                <div class="input-group">
                    <input type="text" id="facilityFree" class="form-control" name="facilityFree" value=" -">
                    <span class="input-group-text"><i class="fa-solid fa-gift"></i></span>
                </div>
            </div>

            <div class="mt-3 form-group">
                <label class="h6" for="rentType">Rent type:</label>
                <div class="input-group">
                    <select id="rentType" class="form-control" name="rentTypeId">
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                        </c:forEach>
                    </select>
                    <span class="input-group-text"><i class="fa-solid fa-business-time"></i></span>
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
    function changeForm(type) {
        let selectType = type.value;
        switch (selectType) {
            case "1":
                document.getElementById("standardRoomForm").style.display = "block";
                document.getElementById("descriptionForm").style.display = "block";
                document.getElementById("poolAreaForm").style.display = "block";
                document.getElementById("numberOfFloorsForm").style.display = "block";
                document.getElementById("facilityFreeForm").style.display = "none";
                break;
            case "2":
                document.getElementById("standardRoomForm").style.display = "block";
                document.getElementById("descriptionForm").style.display = "block";
                document.getElementById("poolAreaForm").style.display = "none";
                document.getElementById("numberOfFloorsForm").style.display = "block";
                document.getElementById("facilityFreeForm").style.display = "none";
                break;
            default:
                document.getElementById("standardRoomForm").style.display = "none";
                document.getElementById("descriptionForm").style.display = "none";
                document.getElementById("poolAreaForm").style.display = "none";
                document.getElementById("numberOfFloorsForm").style.display = "none";
                document.getElementById("facilityFreeForm").style.display = "block";
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>