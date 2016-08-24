<%-- 
    Document   : form
    Created on : 7 Aug, 2016, 12:10:41 PM
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link href="${bootCSS}" rel="stylesheet"/>
        <script src="${bootJS}"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="container">
            <div class="well">
            <form:form method="post" action="addCustomer" commandName="cust">
            <table class="table table-bordered">
            <tr>
            <td>
                <form:label path="name">Enter name </form:label>
            </td>
            <td>
            <form:input path="name" />
            
            </td> 
                
            </tr>
            <tr>
            <td>
                <form:label path="password">Enter password</form:label>
            </td>
            <td>
            <form:password path="password"/>
            </td>
            </tr>
<tr>
<td>
    <form:label path="date">Enter date of birth(dd/mm/yyyy):</form:label>
</td>
<td>
<form:input path="date"/>
</td>
</tr>
            <tr>
           <td>
            <button type="submit" class="btn btn-lg btn-primary">Register</button>
           </td>
            </tr>
            </table>
        
        
        </form:form>
        </div>
        </div>
        
    </body>
</html>
