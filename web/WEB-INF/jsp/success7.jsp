

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h2> Welcome:-<b>${u_name}</b></h2>
                <h2> Service type:-<b>${ser}</b></h2>
                <hr>
                <h3>Tickets:-</h3>
                <c:forEach items="${tickets_list}" var="tick">
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    ${tick}
                </c:forEach>
                
    <center>        <p>            
    <a href="<c:url value="/"/>"><button class="btn btn-lg btn-primary" onclick="logout()">Logout</button></a>
&nbsp;&nbsp;&nbsp;
            
    <a href="<c:url value="/increment?serv=${ser}&uname=${u_name}"/>"><button class="btn btn-lg btn-primary" >Increment List</button></a>
</p>
           </center>
    </div>
            </div>
<script type="text/javascript">
function logout()
{
    <% session.invalidate(); %>
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
    </body>
</html>
