    
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
        <title>Central Display</title>
    </head>
    <body>
        <div class="container">
            <div class="well">
              <p><center><h1>:: Central Display Screen ::</h1></center></p>
      
                <div class="row">
                    <div class="col-lg-2">
             <h3><b>Savings Account</b></h3>
           <c:forEach items="${listSA}" var="ted">
    ${ted}<br/>
        </c:forEach>
   
                    </div>
                    <div class="col-lg-2">
             <h3><b>Fixed Deposit</b></h3>
    <c:forEach items="${listFD}" var="ted">
    ${ted}<br/>
        </c:forEach>
                          
                    </div>
                    <div class="col-lg-2">
             <h3><b>Current Account</b></h3>
    <c:forEach items="${listCA}" var="ted">
    ${ted}<br/>
        </c:forEach>
                          
                    </div>
                    <div class="col-lg-2">
             <h3><b>Debit Card</b></h3>
    <c:forEach items="${listDC}" var="ted">
    ${ted}<br/>
        </c:forEach>
                          
                    </div>
                    <div class="col-lg-2">
             <h3><b>Credit Card</b></h3>
    <c:forEach items="${listCC}" var="ted">
    ${ted}<br/>
        </c:forEach>
                          
                    </div>
                    <div class="col-lg-2">
              <h3><b>Loan Services</b></h3>
    <c:forEach items="${listLO}" var="ted">
    ${ted}<br/>
        </c:forEach>
                         
                    </div>
                    
                </div>
   </div>
        </div>       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"/></script>
<script src="${bootJS}"></script>

</body>
</html>
