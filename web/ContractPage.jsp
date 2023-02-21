<%-- 
    Document   : ContractPage
    Created on : Feb 13, 2023, 12:47:53 AM
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
        <title>Contract Manage</title>
    </head>
    <body>
        <h1>Hi</h1>
        <c:set var="contractList" value="${requestScope.contractList}"></c:set>
        ${requestScope.contractList.size()}
        <form action="MainController" method="post">
            <input type="submit" value="Logout" name="action"/>
        </form>
        <p><a href="Find2ContractsServlet">HOME PAGE</a></p>
        <table>
            <c:forEach var="contract" items="${contractList}">
                <tr><td>${contract.toString()}</td></tr>
            </c:forEach>
        </table>

    </body>
</html>
