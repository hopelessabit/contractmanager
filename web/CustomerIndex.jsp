<%-- 
    Document   : CustomerIndex
    Created on : Feb 9, 2023, 7:55:18 PM
    Author     : mical
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="abc.contracts.ContractDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Index</title>
    </head>
    <body>
        <h1>Welcome, ${sessionScope.user.getFullName()}</h1>
        <!--Dung de view & edit profile -->s
        <form action="MainController" method="post">
            <input type="hidden" value="C" name="userTypeFromJsp"/>
            <input type="submit" value="View Profile" name="action"/>
        </form>
        
        <!--Dung de view all contracts-->
        <form action="viewAllContracts" method="post">
            <input type="submit" name="action" value="View Contract"/>
        </form>
        
        <!-- Dung de view 2 contracts-->
        <c:set var="contractList" value="${requestScope.contractList}"></c:set>
            <table>
            <c:forEach var="contract" varStatus="counter" items="${requestScope.contractList}">
                <tr>
                    <td>Contract's ID: ${contract.getCoID()}</td>
                    <td>${contract.toString()}</td>
                    <td>Customer's ID: ${contract.getCID()}</td>
                    <td>Owner: <form action="viewOwnerProfileServlet">
                                    <input type="submit" value="${contract.getOName()}"/>
                                    <input type="hidden" value="viewOwnerProfile" name="action"/>
                                    <input type="hidden" value="${contract.getOID()}" name="OID"/>
                                    <input type="hidden" value="${requestScope.userName}" name="userName"/>
                                    <input type="hidden" value="${requestScope.userID}" name="userID"/>
                                    <input type="hidden" value="${requestScope.userType}" name="userType"/>
                                </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>