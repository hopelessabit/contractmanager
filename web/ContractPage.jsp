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
        <p><a href="Find2ContractsServlet">HOME PAGE</a></p>
        <table>
            <c:forEach var="contract" varStatus="counter" items="${requestScope.contractList}">
                <tr>
                    <td>${contract.toString()}</td>
                    <td>Owner: <form action="ViewOwnerProfileServlet">
                            <input type="submit" value="${contract.getOName()}"/>
                            <input type="hidden" value="viewOwnerProfile" name="action"/>
                            <input type="hidden" value="${contract.getOID()}" name="OID"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
