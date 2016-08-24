<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>

    <spring:url value="/Resources/bootstrap.min.css" var="bootCSS"/>
        <spring:url value="/Resources/bootstrap.min.js" var="bootJS"/>
        <link href="${bootCSS}" rel="stylesheet"/>
        
    <title>
::GroupFund Bank::
</title>

</head>
<body>
    <div class="container">
        <div class="well">
    <p><center><b><h1>::Welcome to GroupFund Banking Services::</h1></b></center><p>
    <p>
        <b>
        ::Bank Employees:: 
        </b>
<p>
    <a href="<c:url value="/admin"/>"><button class="btn btn-sm btn-primary">Administrator </button> </a>

</p>

    </p>
    <p><a href="<c:url value="/bankofficer"/>"><button class="btn btn-sm btn-primary">BankingOfficer </button> </a>
    </p>
        
    <br/>
    <br/>
    <p>
        <b>
            ::Customer::
        </b>
    </p>
    <p>
    <a href="<c:url value="/customer_login"/>"><button class="btn btn-sm btn-primary">Login </button> </a>
    </p>
    <p>
    <a href="<c:url value="/customer_register"/>"><button class="btn btn-sm btn-primary">Register </button> </a>
    </p>
    <br/>
    <br/>
  <p><b>Customers seeking for appointment with the banking officer for some services can generate their appointment ticket by clicking the button below...
      </b>
  </p>  
  <p>
   <a href="<c:url value="/ticket"/>"><button class="btn btn-sm btn-primary">Generate Ticket </button> </a>
   </p>
        </div>
    </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"/></script>
        
<script src="${bootJS}"></script>

</body>
</html>
