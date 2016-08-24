<%-- 
    Document   : branch_modify
    Created on : 19 Aug, 2016, 11:08:22 PM
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
        <spring:url value="/Resources/javas1.js" var="funcJS"/>
                <spring:url value="/Resources/styling1.css" var="styleCSS"/>
<link href="${bootCSS}" rel="stylesheet"/>
        <link href="${styleCSS}" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
 <div class="well">
      <sec:authorize access="isAuthenticated()">    
                <form:form   method="post" action="modifyBranch" modelAttribute="branch">
                                  <table class="table table-condensed ">
                <tr>
                    <td class="d1"> <form:label path="code">Enter branch code :- </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="code" cssClass="d2"/><br/>          
                        <font color="red"><form:errors path="code"/></font>
                        
            
                   </td>
                                   </tr>
                                                            <tr>
                    <td class="d1"> <form:label path="location">Branch-Location </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="location"  cssClass="d2"  placeholder="Enter new location" /><br/>          
                        <font color="red"><form:errors path="location"/></font>
                        
            
                   </td>
                                   
                                   </tr>
          
                                  </table>
                             <p><center><button style="background-color: #9d9d9d" type="submit" class="btn btn-lg btn1">Modify</button>
            </center></p>    
          
                </form:form>
      </sec:authorize>
     <sec:authorize access="isAnonymous()">
        
            <h1><p style="color: blue">Authentication failed!Login required to access this page<p></h1>
        </sec:authorize>
 </div>
 </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
       <script src="${funcJS}"></script>
    </body>
</html>
