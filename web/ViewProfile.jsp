<%-- 
    Document   : Profile
    Created on : Feb 9, 2023, 11:28:20 PM
    Author     : mical
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${sessionScope.OProfile.getFullName()}Profile</title>
    </head>
    <body>
        <!--Truyen xuong userName, userID, userType, profileOwner-->
        <h1>Welcome, ${sessionScope.userName}</h1>  
        <p><a href="MainController?action=Find2contracts">HOME PAGE</a></p>
        ${requestScope.viewProfile.toString()}
        <table>
            <c:choose>
                <c:when test="${requestScope.edit}"> <%--Khu nay dung de edit--%> 
                    <form action="editProfileServlet">
                        <tr><td>Email </td> <td><input type="text" name="txtEmail"/></td></tr>
                        <tr><td>Password </td> <td><input type="text" name="txtPassword"/></td></tr>
                        <tr><td>Date of birth </td><td><input type="date" name="txtDate"/></td></tr>
                        <tr><td>Full name </td><td><input type="text" name="txtFullName"/></td></tr>
                        <tr><td><input type="submit" name="action" value="Save Profile"/></td><td></td></tr>
                    </form>
                </c:when>
                <c:otherwise> <%--Khu nay dung de view thoi--%>
                    <p>false</p> 
                </c:otherwise>
            </c:choose>
        </table>

    </body>
</html>
