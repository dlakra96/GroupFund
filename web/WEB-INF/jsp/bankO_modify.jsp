<%-- 
    Document   : bankO_modify
    Created on : 17 Aug, 2016, 9:49:04 AM
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
          
          <form:form   method="post" action="modifyBO" modelAttribute="officer">
      
          
                  <table class="table table-condensed ">
                <tr>
                    <td class="d1"> <form:label path="id">Enter bank officer ID :- </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="id" cssClass="d2"/><br/>          
                        <font color="red"><form:errors path="id"/></font>
                        
            
                   </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <p class="d1">Select and enter the new information :-</p>
                                       </td>
                                   <td>
                                   </tr>
                                   <tr>
                    <td class="d1"> <input type="checkbox" class="big-checkbox" name="user_option"  value="user_uname" id="box1"/><form:label path="username">User-Name </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="username"  cssClass="d2" id="text1" placeholder="Enter new username" disabled="true"/><br/>          
                        <font color="red"><form:errors path="username"/></font>
                        
            
                   </td>
                                   
                                   </tr>
                                   <tr>
                    <td class="d1"> <input type="checkbox" class="big-checkbox" name="user_option"  value="user_name" id="box2"/><form:label path="name">Name </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="name"  cssClass="d2" id="text2" placeholder="Enter new name" disabled="true"/><br/>          
                        <font color="red"><form:errors path="name"/></font>
                        
            
                   </td>
                                   
                                   </tr>
                                   <tr>
                    <td class="d1"> <input type="checkbox" class="big-checkbox" name="user_option"  value="user_pass" id="box3"/><form:label path="password">Password</form:label>
                   </td>
                   <td class="input-lg"><form:input  path="password"  cssClass="d2" id="text3" placeholder="Enter new password" disabled="true"/><br/>          
                        <font color="red"><form:errors path="password"/></font>
                        
            
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
