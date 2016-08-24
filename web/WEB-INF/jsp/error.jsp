<%-- 
    Document   : error
    Created on : 7 Aug, 2016, 11:35:39 AM
    Author     : Deepanshu
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <spring:url value="/Resources/bootstrap.min.css" var="bootCSS"/>
        <spring:url value="/Resources/bootstrap.min.js" var="bootJS"/>
        <link href="${bootCSS}" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="well warning">
                <p style="font-weight: bold;color: red">${msg} </p>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
            </div>
            </div>
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
  </body>
</html>
