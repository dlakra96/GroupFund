<%-- 
    Document   : showTicket
    Created on : 7 Aug, 2016, 12:04:20 PM
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
               <link href="bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
           <div id="printable">
        <b>Ticket number:-</b>${requestScope.tno}
<br/>
        <b>Service Details:-</b>${param.serv}
        </div>
        
        <button class="btn btn-lg btn-primary" onclick="print77('printable')">Print Ticket</button>
        <a href="<c:url value="/centralDisp"/>" target="_blank"><button class="btn btn-lg btn-primary" >Central Display</button></a>
        
        <script>
        function print77(divname){
        var printContents=document.getElementById(divname).innerHTML;
        var originalContents=document.body.innerHTML;
        document.body.innerHTML=printContents;
        window.print();
        document.body.innerHTML=originalContents;
        }    
        </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"/></script>
        
<script src="${bootJS}"></script>


    
    </body>
</html>
