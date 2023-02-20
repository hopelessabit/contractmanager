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
    </form>
    <form action="MainController" method="post">
        <input type="submit" value="Logout" name="action"/>
    </form>
    <p><a href="Find2ContractsServlet">HOME PAGE</a></p>
    <table>
        <c:forEach var="contract" varStatus="counter" items="${requestScope.contractList}">
            <c:set var="RID" value="${contract.getRID()}"></c:set>
            <c:set var="SaID" value="${contract.getSaID()}"></c:set>
            <c:set var="CID" value="${contract.getCID()}"></c:set>
            <tr><td>${contract.toString()}</td></tr>
            
            <!--View Customer-->
            <c:if test="${CID != 0}">
                <tr>
                    <td>Customer: </td>
                    <td>
                        <form action="MainController">
                            <input type="submit" value="${contract.getCName()}"/>
                            <input type="hidden" value="viewCustomerProfile" name="action"/>
                            <input type="hidden" value="${contract.getCID()}" name="CID"/>
                        </form>
                    </td>
                </tr>
            </c:if>

            <!--View Owner-->
            <tr>
                <td>Owner: </td>
                <td>
                    <form action="MainController">
                        <input type="submit" value="${contract.getOName()}"/>
                        <input type="hidden" value="viewOwnerProfile" name="action"/>
                        <input type="hidden" value="${contract.getOID()}" name="OID"/>
                    </form>
                </td>
            </tr>
            
            <!--View Seller-->
            <c:if test="${SaID != 0}">
                <tr>
                    <td>Seller:</td>
                    <td>
                        <form action="MainController">
                            <input type="submit" value="${contract.getSname()}"/>
                            <input type="hidden" value="viewSellerProfile" name="action"/>
                            <input type="hidden" value="${contract.getSaID()}" name="SID"/>
                        </form>
                    </td>
                </tr>
            </c:if>

            <!--View Resident-->
            <c:if test="${RID != 0}">
                <tr>
                    <td>Resident:</td>
                    <td>
                        <form action="MainController">
                            <input type="submit" value="${contract.getRname()}"/>
                            <input type="hidden" value="viewResidentProfile" name="action"/>
                            <input type="hidden" value="${contract.getRID()}" name="SID"/>
                        </form>
                    </td>
                </tr>
            </c:if>


        </c:forEach>
    </table>

</body>
</html>
