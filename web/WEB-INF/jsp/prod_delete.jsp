<%-- 
    Document   : prod_delete
    Created on : 14 Aug, 2016, 1:48:30 PM
    Author     : Deepanshu
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <sec:authorize access="isAuthenticated()">
        <div class="container">
            <div class="well">
        <form:form method="post" action="DelProd" commandName="product">
            <table class="table table-bordered">
            <tr>
            <td>
                <form:label path="pid">Enter Product/Service code which you want to delete</form:label>
            </td>
            <td>
            <form:input path="pid" />
            
            </td> 
                
            </tr>
            </table>
        <p>
            <center><button type="submit" class="btn btn-lg btn-primary">Delete</button></center>
        </p>
    </form:form>
            </div>
        </div>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
                                                                <h1><p style="color: blue">Authentication failed!Login required to access this page<p></h1>

        </sec:authorize>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
    </body>
</html>
