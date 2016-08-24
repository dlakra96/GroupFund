<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <spring:url value="/Resources/bootstrap.min.css" var="bootCSS"/>
        <spring:url value="/Resources/bootstrap.min.js" var="bootJS"/>
        <link href="${bootCSS}" rel="stylesheet"/>
<link rel="stylesheet" type="text/css"
      href="https://fonts.googleapis.com/css?family=Tangerine">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
        <div class="container"> 
            <div class="well">
                <div style="text-align: center;font-size: 60px;font-family: Tangerine;"><b>:: ${msg} ::</b></div>
         
                <center> <a href="<c:url value="/admin"/>"><button class="btn btn-lg btn-primary" style="margin-top: 200px">Admin-Home</button></a>
        </center>
        </div>      
        </div>
      
      <script src="${bootJS}"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
                 </body>
</html>
