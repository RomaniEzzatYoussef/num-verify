<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Romani Ezzat
  Date: 1/20/2020
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/index.css">
    <title>number verify Page</title>
</head>
<body>

<div id="wrapper" class="animate">
    <nav class="navbar header-top fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav ml-md-auto d-md-flex">
                <li class="nav-item">
                    <p style="color: #ffffff; font-family: 'Lucida Sans';font-size: larger;">numverify</p>
                </li>
            </ul>

            <ul class="navbar-nav ml-md-auto d-md-flex">
                <li class="nav-item">
                    <a class="nav-link" href="showHistoryPage"><i class="fas fa-key"></i> History</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="card-right">

        <div class="card-header">
            <h3>Formatted</h3>

        </div>
        <div class="card-footer">
            <table id="code_5" class="table average_table flexslider_vatlayer_box">

                <tr>
                    <td class="width_100">Valid</td>
                    <td id="valid_number" class="valid">${numInfo.valid}</td>
                </tr>

                <tr>
                    <td class="width_100">Local Format</td>
                    <td id="local_format">${numInfo.local_format}</td>
                </tr>

                <tr>
                    <td class="width_100">Intl. Format</td>
                    <td id="intl_format">${numInfo.international_format}</td>
                </tr>

                <tr>
                    <td class="width_100">Country</td>
                    <td id="country_name">${numInfo.country_name}</td>
                </tr>

                <tr>
                    <td class="width_100">Location</td>
                    <td id="location">${numInfo.location}</td>
                </tr>

                <tr>
                    <td class="width_100">Carrier</td>
                    <td id="carrier">${numInfo.carrier}</td>
                </tr>

                <tr>
                    <td class="width_100">Line Type</td>
                    <td id="line_type">${numInfo.line_type}</td>
                </tr>

            </table>

        </div>
    </div>


    <div class="card-left">

        <div class="card-footer">
            <div class="big_box_left">
                <h1 align="left" id="promo_heading" class="promo_heading index">Global Phone Number Validation<br></h1>
                <br><br>
                <div align="left" class="promo_sub_heading">Real-time REST API supporting 232 countries
                </div><br><br>

                <form:form modelAttribute="numverify" action="checkValidNumber" id="phone_validation_form">

                    <div class="form_row vat_check">
                        <div id="realtime_check">Enter Phone Number</div>

                        <form:input id="phone_to_check"  name="phone_number" class="vat_input" placeholder="+1 415-858-6273"  path="number"/>
                        <label for="submit" class="phone_input_label disabled">Validate</label>
                        <input type="submit" id="submit" class="visibility_hidden">

                        <p style="color: red">${message}</p>
                    </div>
                </form:form>

            </div>

        </div>
    </div>



</div>


</body>
</html>
