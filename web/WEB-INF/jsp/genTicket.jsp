<%-- 
    Document   : genTicket
    Created on : 7 Aug, 2016, 11:55:54 AM
    Author     : Deepanshu
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<form:form action="Generate" method="post" >
            <p>Select the service of your choice:-</p>
            <select name="serv">
                <option>Saving Account</option>
                <option>Current Account</option>
                <option>Fixed Deposit</option>
                <option>Debit Card</option>
                <option>Credit Card</option>
                <option>Loan</option>
                
            </select>
        <br/>
        <br/>
           
           
        <input type="submit" value="Generate Ticket" />
</form:form>
        
    </body>
</html>
