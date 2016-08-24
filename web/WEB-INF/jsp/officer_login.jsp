
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
            <div class="well">
                <form:form method="post" action="loginOfficer" modelAttribute="officer">
            <table class="table table-bordered">
            <tr>
                
            <td>
                <form:label path="username">Enter username </form:label>
            </td>
            <td>
            <form:input path="username" />
            
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
            <button type="submit" class="btn btn-lg btn-primary">Login</button>
            </td>
            </tr>
            </table>
        </form:form>
        
        </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
    </body>
</html>
