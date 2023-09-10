<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="style/typewriter.css" rel="stylesheet"/>
    <%--    Bootstrap for Design--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <%--    For Validation--%>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <%--    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">--%>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
    <title>Welcome User</title>
</head>
<body>
<h1 align="center">Welcome User</h1>
<table border = "1" align="center" class="table table-striped table-bordered" cellspacing="0">
    <thead>
    <tr>
        <th>Sl No</th>
        <th>Full Name</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Date of Birth</th>
        <th>Department</th>
        <th>Gender</th>
    </tr>

    </thead>

    <tbody>
    <c:forEach items="${list}" var="e" varStatus="coount">
        <tr>
            <td>${coount.count}</td>
            <td>${e.name}</td>
            <td>${e.phn}</td>
            <td>${e.email}</td>
            <td>${e.dob}</td>
            <td>${e.dept}</td>
            <td>${e.gender}</td>
            <td>
                <a href = "/edit/${e.slno}">Edit</a>
                |
                <a href = "/delete/${e.slno}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>


    <tfoot>
    <tr>
        <td colspan="7" style="text-align: center;">
            <button class="btn btn-info btn-lg" onclick="window.location.href='${pageContext.request.contextPath}/Registration'">New Registration</button>
        </td>
    </tr>
    </tfoot>

</table>


<div>
    <button id="personalDetails" class="btn btn-primary">Add Personal Details</button>
    <button id="viewPersonalDetails"  class="btn btn-success">View Personal Details</button>
    <button onclick="typeWriter()"  class="btn btn-success">View Personal Details in Writing Effect</button>
<%--    onclick="window.location='viewPersonalDetails'"--%>
</div>

<div id="display"></div>
<div style="color: #0b7ec4; font-family: Constantia; font-size: 22px; margin: 60px" id="typeWriter"></div>

<%--Load Personal Detail Page using Jquery and Ajax--%>
<script>


    $('#personalDetails').click(function (e){
        e.preventDefault();
        loadPersonalDetails($(this));
    });

    function loadPersonalDetails(d){

    }



    $('#viewPersonalDetails').click(function (e){
        e.preventDefault();
        loadViewPersonalDetails($(this));
    });

    function loadViewPersonalDetails(e){
        $.ajax({
            url : "ViewPersonalDetails",
            method: "GET",
            data : e.serialize(),
            success: function (data){
                console.log("Success!!");
                $('#display').html(data);
            },
            error : function (data){
                console.log("Failed!!");
            }
        })
    }
</script>


<script>
    //Typing Effect using JavaScript
    var i = 0;
    var msg = 'Welcome, Sambit Kumar Pradhan';
    var speed = 50;

    function typeWriter() {
        if (i < msg.length) {
            document.getElementById("typeWriter").innerHTML += msg.charAt(i);
            i++;
            setTimeout(typeWriter, speed);
        }
    }
</script>


<%--First Typing Effect--%>
<%--<p class="line-1 anim-typewriter">Hello, Sambit Kumar Pradhan</p>--%>

<%--New Typing Effect--%>
<h4>Hello I'm Sambit, I'm a</h4>
<div class="container">
    <div class="typed-out">Software Engineer!!</div>
</div>
</body>
</html>