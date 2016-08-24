<%-- 
    Document   : welcomeA
    Created on : 7 Aug, 2016, 12:27:59 PM
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
        <spring:url value="/Resources/styling.css" var="styleCSS"/>
        <link href="${bootCSS}" rel="stylesheet"/>
        <link href="${styleCSS}" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="well">
        <sec:authorize access="isAuthenticated()">    
                
            <div class="row">
            
           <div class="col-lg-10">
                <h1> Welcome Administrator: <b><sec:authentication property="principal.username" /></b></h1>
           </div>
           <div class="col-lg-2">      
           <a href="j_spring_security_logout"><button class="btn btn-lg btn-primary b1">Logout</button></a>
 
           </div>

            </div>
                   
           <b><h2> ::Banking Officers::</h2> </b>
                
                
                 
                 <table class="table table-bordered">
                     <tr class="h1">    
                     <td>ID</td>
                 <td>Name</td>
        <td>Username</td>
        <td>Password</td>
        </tr>
                     <c:forEach var="item" items="${l}">
                         <tr class="c1">
                             <td>
                      <c:out value="${item.id}"/>
                             </td>
                             <td>
                              <c:out value="${item.name}"/>
                             </td>
                             <td>
                              <c:out value="${item.username}"/>
                             </td>
                             <td>
                               <c:out value="${item.password}"/>
                             </td>
                             
                         </tr>
                     </c:forEach>
                 
                 </table>
           
           <p><center>
                     <a href="<c:url value="/admin/addBO"/>">        <button class="btn btn-lg btn-primary" >Add Banking Officer </button>     </a>              
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="<c:url value="/admin/delBO"/>">        <button class="btn btn-lg btn-primary" >Remove Banking Officer </button>     </a>              
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="<c:url value="/admin/modifyBO"/>">        <button class="btn btn-lg btn-primary" >Modify Banking Officer </button>     </a>              
                    
                    </center>
                    </p>
           <b><h2> ::Bank Branches::</h2> </b>
                 <table class="table table-bordered">
                     <tr class="h1">    
                     <td>Code</td>
                 <td>Location</td>
        </tr>
                     <c:forEach var="item" items="${lb}">
                         <tr class="c1">
                             <td>
                      <c:out value="${item.code}"/>
                             </td>
                             <td>
                              <c:out value="${item.location}"/>
                             </td>
                             
                         </tr>
                     </c:forEach>
                 
                 </table>
           <p><center>
                     <a href="<c:url value="/admin/addBranch"/>">        <button class="btn btn-lg btn-primary" >Add Branch </button>     </a>              
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="<c:url value="/admin/delBranch"/>">        <button class="btn btn-lg btn-primary" >Remove existing branch </button>     </a>              
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="<c:url value="/admin/modifyBranch"/>">        <button class="btn btn-lg btn-primary" >Modify existing branch </button>     </a>              
                    
                    </center>
                    </p>
           <b><h2> ::Service Desks::</h2> </b>
                
                
                 
                 <table class="table table-bordered">
                     <tr class="h1">    
                     <td>Branch-code</td>
                 <td>Desk-number</td>
        <td>isActive</td>
       
        </tr>
                     <c:forEach var="item" items="${lbb}">
                         <tr class="c1">
                             <td>
                      <c:out value="${item.b_code}"/>
                             </td>
                             <td>
                              <c:out value="${item.number}"/>
                             </td>
                             <td>
                              <c:out value="${item.isactive}"/>
                             </td>
                             
                         </tr>
                     </c:forEach>
                 
                 </table>
           <p> 
           <center>
               <a href="<c:url value="/admin/addServ"/>">        <button class="btn btn-lg btn-primary" >Add Service Desk </button>     </a>              
               &nbsp;&nbsp;&nbsp;&nbsp;
               <a href="<c:url value="/admin/delServ"/>">        <button class="btn btn-lg btn-primary" >Remove existing Service desk </button>     </a>              
           &nbsp;&nbsp;&nbsp;&nbsp;
               <a href="<c:url value="/admin/modifyDesk"/>">        <button class="btn btn-lg btn-primary" >Modify existing Service desk </button>  </a>              
           
           </center>
            </p>       
           
           <b><h2> ::Products & Services::</h2> </b>
                
                
                 
                 <table class="table table-bordered">
                     <tr class="h1">    
                     <td>Code</td>
                 <td>Name</td>
        <td>Description</td>
       
        </tr>
                     <c:forEach var="item" items="${lbbl}">
                         <tr class="c1">
                             <td>
                      <c:out value="${item.pid}"/>
                             </td>
                             <td>
                              <c:out value="${item.pname}"/>
                             </td>
                             <td>
                              <c:out value="${item.description}"/>
                             </td>
                             
                         </tr>
                     </c:forEach>
                 
                 </table>
           <p> 
           <center>
               <a href="<c:url value="/admin/addProd"/>">        <button class="btn btn-lg btn-primary" >Add Product/Service </button>     </a>              
               &nbsp;&nbsp;&nbsp;&nbsp;
               <a href="<c:url value="/admin/delProd"/>">        <button class="btn btn-lg btn-primary" >Remove existing Product/Service </button>     </a>              
           &nbsp;&nbsp;&nbsp;&nbsp;
               <a href="<c:url value="/admin/modifyProduct"/>">        <button class="btn btn-lg btn-primary" >Modify existing Product/Service </button>     </a>
               
               
           </center>
            </p>       
           
                
                
                      </sec:authorize>
            </div>
        </div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
      
    </body>
</html>
