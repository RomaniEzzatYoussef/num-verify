<%--
  Created by IntelliJ IDEA.
  User: Romani Ezzat
  Date: 1/19/2020
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/index.css">
    <title>Customer Page</title>

</head>
<body>


<div id="wrapper" class="animate">
    <nav class="navbar header-top fixed-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav ml-md-auto d-md-flex">
                <li class="nav-item">
                    <p style="color: #ffffff; font-family: 'Lucida Sans';font-size: larger;">numverify history</p>
                </li>
            </ul>

            <ul class="navbar-nav ml-md-auto d-md-flex">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp"><i class="fas fa-key"></i> numverify page</a>
                </li>
            </ul>
        </div>
    </nav>


<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>History</h3>
            </div>

            <div class="card-body">
                <div class="table-responsive" id="sailorTableArea3">
                    <table id="sailorTable3" class="table table-striped table-bordered" width="100%">

                        <thead>
                        <tr>
                            <td>id</td>
                            <td>status</td>
                            <td>number</td>
                            <td>date</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="numVerifyHistories" items="${numVerifyHistories}">
                            <tr>
                                <td><c:out value="${numVerifyHistories.id}"/></td>
                                <td><c:out value="${numVerifyHistories.status}"/></td>
                                <td><c:out value="${numVerifyHistories.number}"/></td>
                                <td><c:out value="${numVerifyHistories.date}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
