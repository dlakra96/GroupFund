<%-- 
    Document   : bankO_register
    Created on : 8 Aug, 2016, 5:08:53 PM
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
        <spring:url value="/Resources/styling1.css" var="styleCSS"/>
        <link href="${bootCSS}" rel="stylesheet"/>
        <link href="${styleCSS}" rel="stylesheet"/>
        <link href="<c:url value="https://fonts.googleapis.com/css?family=Denk+One"/>" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 100px">
        <div class="container">
            <div class="well">
           
        <sec:authorize access="isAuthenticated()">    
      
            <form:form  id="form_officer" method="post" action="addBO" modelAttribute="officer">
            <table class="table table-condensed ">
                <tr>
                    <td > <form:label path="id" class="d1">Enter bank officer ID </form:label>
                   <br/>ID must start with any option from the set {SA,FD,CA,LO,DB,CC} followed by a number containing 4 digits where each digit can range from 0-9   
                    </td>
                   <td class="input-lg"><form:input  path="id" cssClass="d2"/><br/>          
                        <font color="red"><form:errors path="id"/></font>
                        
            
                   </td>
                                   </tr>
                                  
                <tr>
                    <td class="d1">
                <form:label path="name">Enter name </form:label>
                    </td><td class="input-lg">
                    <form:input path="name" cssClass="d2"/><br/>
            <font color="red"><form:errors path="name" /></font>
            
                    </td>
                   
                </tr>
                <tr><td class="d1">
    <form:label path="username">Enter user name:</form:label>
                    </td>
                    <td class="input-lg">
                    <form:input  path="username" cssClass="d2"/><br/>
<font color="red"><form:errors path="username" /></font>
        
        </td>
        
    
            
                </tr>
                <tr>
                    <td >
                        <form:label path="password" class="d1">Enter password</form:label>
                    <br/>length of password must lie between 6 - 15 characters
                    </td>
                    <td class="input-lg">
                    <form:password path="password" cssClass="d2"/><br/>
                    <font color="red"><form:errors path="password" /></font>
        
        </td>
        
        
                </tr>
        
            </table>
                    <p><center><button style="background-color: #9d9d9d" type="submit" class="btn btn-lg">Submit</button>
</center></p>        
           
        </form:form>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
        
            <h1><p style="color: blue">Authentication failed!Login required to access this page<p></h1>
        </sec:authorize>
          </div>
        </div>
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"/></script>
        
<script src="${bootJS}"></script>
      
    </body>
</html>
