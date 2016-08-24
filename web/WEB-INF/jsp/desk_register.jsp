
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
        <link href="${bootCSS}" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sec:authorize access="isAuthenticated()">      
        <div class="container">
            <div class="well">
            <form:form method="post" action="AddServ" commandName="desk">
            <table class="table table-bordered">
            
                <tr>
            <td>
                <form:label path="number">Enter service desk number </form:label>
            </td>
            <td>
            <form:input path="number" />
            
            </td> 
                <td>
                <form:errors path="number"/>
            </td>
            
            </tr>
                <tr>
            <td>
                <form:label path="b_code">Enter branch code</form:label>
            </td>
            <td>
            <form:input path="b_code" />
            
            </td> 
                <td>
                <form:errors path="b_code"/>
            </td>
            
            </tr>
                <tr>
            <td>
                <form:label path="isactive">Is the service desk active or not? </form:label>
            </td>
            <td>
            <form:radiobutton path="isactive" value="Yes"/>Yes &nbsp;&nbsp;&nbsp;
            <form:radiobutton path="isactive" value="No"/>No
            </td> 
                <td>
                <form:errors path="isactive"/>
            </td>
            
            </tr>
            
            </table>
            <p><center>            <button type="submit" class="btn btn-lg btn-primary">Add</button>
</center></p>        
           
        
        </form:form>
           </div>
        </div>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
                                    <h1><p style="color: blue">Authentication failed!Login required to access this page<p></h1>
</sec:authorize>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="${bootJS}"></script>
    </body>
</html>
