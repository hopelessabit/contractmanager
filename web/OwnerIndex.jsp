<%-- 
    Document   : OwnerIndex
    Created on : Feb 21, 2023, 10:39:31 AM
    Author     : mical
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="abc.contract.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Index</title>
    </head>
    <body>
        ${sessionScope.userType}
        <h1>Welcome, ${sessionScope.user.getFullName()}</h1>
        <!--Dung de view & edit profile -->
        <form action="MainController" method="post">
            <input type="hidden" value="C" name="userTypeFromJsp"/>
            <input type="submit" value="View Profile" name="action"/>
        </form>
        <form action="MainController" method="post">
            <input type="submit" value="Logout" name="action"/>
        </form>
        <!--Dung de view all contracts-->
        <form action="MainController" method="post">
            <input type="submit" name="action" value="View Contract"/>
        </form>
        <c:set var="contractStats" value="${requestScope.contractStats}"></c:set>
            <!--ContractStats = 1 : Co nhieu hon 2 contracts-->
            <!--ContractStats = 0 : Co 1 hoac 2 contracts-->
            <!--ContractStats = -1 : Khong co contracts-->
        <c:if test="${contractStats == 1}">
            <form action="MainController" method="post">
                <input type="submit" value="View All Contract">
                <input type="hidden" name="action" value="View Contract">
            </form>
        </c:if>
        <c:if test="${requestScope.contractStats  == -1}" >
            <p>Khong co contract</p>
        </c:if>
        <!-- Dung de view 2 contracts-->
        <table>
            <c:forEach var="contract" varStatus="counter" items="${requestScope.contractList}">
                <tr><td>Contract's ID: ${contract.getCoID()}</td></tr>
                <tr><td>${contract.toString()}</td></tr>
            </c:forEach>
        </table>

    </body>
</html>


