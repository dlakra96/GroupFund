<%-- 
    Document   : product_modify
    Created on : 20 Aug, 2016, 12:39:32 AM
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
           <form:form   method="post" action="modifyProduct" modelAttribute="product">
                
                  <table class="table table-condensed ">
                <tr>
                    <td class="d1"> <form:label path="pid">Enter Product/Service ID :- </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="pid" cssClass="d2"/><br/>          
                        <font color="red"><form:errors path="pid"/></font>
                        
            
                   </td>
                                   </tr>
                                                                    <tr>
                                       <td>
                                           <p class="d1">Select and enter the new information :-</p>
                                       </td>
                                   <td>
                                   </tr>
  
                                                <tr>
                    <td class="d1"> <input type="checkbox" class="big-checkbox" name="user_option"  value="prod_name" id="box1"/><form:label path="pname">Product-Name </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="pname"  cssClass="d2" id="text1" placeholder="Enter new product name" disabled="true"/><br/>          
                        <font color="red"><form:errors path="pname"/></font>
                        
            
                   </td>
                                   
                                   </tr>
                                  <tr>
                    <td class="d1"> <input type="checkbox" class="big-checkbox" name="user_option"  value="prod_desc" id="box2"/><form:label path="description">Product-Description </form:label>
                   </td>
                   <td class="input-lg"><form:input  path="description"  cssClass="d2" id="text2" placeholder="Enter new product description" disabled="true"/><br/>          
                        <font color="red"><form:errors path="description"/></font>
                        
            
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
