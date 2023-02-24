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
        <h1>Welcome, ${sessionScope.user.getFullName()}</h1>  
        <p><a href="MainController?action=Find2contracts">HOME PAGE</a></p>
        <c:set var="profileType" value="${requestScope.profileType}"></c:set>
        <c:set var="edit" value="${requestScope.edit}"></c:set>
        <table>
            <c:if test="${edit == "true"}">
                <form action="editProfileServlet">
                    <tr><td>View Image: ${requestScope.viewProfile.getAvatar()}</td></tr>
                    <tr><td>Full name</td><td><input type="text" name="txtFullName"value="${requestScope.viewProfile.getFullName()}"/></td></tr>
                    <tr><td>Email</td> <td><input type="text" name="txtEmail" value="${requestScope.viewProfile.getEmail()}"/></td></tr>
                    <c:if test="${(profileType == 'C')}">
                        <tr><td>CID</td><td><input type="text" name="txtcid" value="${requestScope.viewProfile.getCCID()}"></td></tr>
                    </c:if>
                    <c:if test="${(profileType == 'O')}">
                        <tr><td>CID</td><td><input type="text" name="txtcid" value="${requestScope.viewProfile.getOCID()}"></td></tr>
                    </c:if>
                        <c:if test="${(profileType == 'R')}">
                        <tr><td>CID</td><td><input type="text" name="txtcid" value="${requestScope.viewProfile.getRCID()}"></td></tr>
                    </c:if>
                    <c:if test="${(profileType == 'S')}">
                        <tr><td>CID</td><td><input type="text" name="txtcid" value="${requestScope.viewProfile.getOCID()}"></td></tr>
                    </c:if>    
                    <tr><td>Date of birth</td><td><input type="date" name="txtDate" value="${requestScope.viewProfile.getDateOfBirth()}"/></td></tr>
                    <tr><td>Address</td><td><input type="text" name="txtAddress" value="${requestScope.viewProfile.getAddress()}"/></td></tr>
                    <tr><td><input type="submit" name="action" value="Save Profile"/></td><td></td></tr>
                </form>
            </c:if>
            <c:if test="${edit != "true"}">
                <tr><td>View Image: </td><td>${requestScope.viewProfile.getAvatar()}</td></tr>
                <tr><td>Full name</td><td>${requestScope.viewProfile.getFullName()}</td></tr>
                <tr><td>Email</td><td>${requestScope.viewProfile.getEmail()}</td></tr>
                <c:if test="${profileType=='S'}">
                    <tr><td>Role</td><td>Seller</td></tr>
                    <tr><td>ID</td><td>${requestScope.viewProfile.getSaID()}</td></tr>
                    <tr><td>CID</td><td>${requestScope.viewProfile.getSCID()}</td></tr>
                </c:if>
                <c:if test="${profileType=='O'}">
                    <tr><td>Role</td><td>Owner</td></tr>
                    <tr><td>ID</td><td>${requestScope.viewProfile.getOID()}</td></tr>
                    <tr><td>CID</td><td>${requestScope.viewProfile.getOCID()}</td></tr>
                </c:if>
                <c:if test="${profileType=='C'}">
                    <tr><td>Role</td><td>Customer</td></tr>
                    <tr><td>ID</td><td>${requestScope.viewProfile.getCID()}</td></tr>
                    <tr><td>CID</td><td>${requestScope.viewProfile.getCCID()}</td></tr>
                </c:if>
                <c:if test="${profileType=='R'}">
                    <tr><td>Role</td><td>Resident</td></tr>
                    <tr><td>ID</td><td>${requestScope.viewProfile.getRID()}</td></tr>
                    <tr><td>CID</td><td>${requestScope.viewProfile.getRCID()}</td></tr>
                </c:if>
                <tr><td>Date of birth</td><td>${requestScope.viewProfile.getDateOfBirth()}</td></td></tr>
                <tr><td>Address</td><td>${requestScope.viewProfile.getAddress()}</td></tr>
            </c:if>
        </table>

    </body>
</html>
