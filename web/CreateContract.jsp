<%-- 
    Document   : CreateContract
    Created on : Mar 8, 2023, 11:12:08 PM
    Author     : mical
--%>
<%@page import="abc.room.RoomDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.user}"></c:set>
        <c:set var="RoIDs" value="${RoomDAO.getRoomID(user.getOID())}"></c:set>
        <c:set var="RoID" value="${requestScope.RoID}"></c:set>
            <form action="MainController" method="post">
                <p>Contract's name: <input type="text" name="txtContractName" value="${requestScope.txtContractName}"</p><hr/>
                <p>Room ID:
                    <select name="RoID">
                    <c:forEach items="${RoIDs}" var="num">
                        <c:if test="${num == RoID}"><option value="${num}" selected="selected">${num}</option></c:if>
                        <c:if test="${num != RoID}"><option value="${num}">${num}</option></c:if>
                    </c:forEach>
                </select>
            </p><hr/>
            <p>The lessee: <input type="text" name="txtLessee" value="${requestScope.txtLessee}"/></p>
            <p>Identity card no: <input type="text" name="txtLCID" value="${requestScope.txtLCID}"/> ${requestScope.lesseeError}</p><hr/>
            <p>The Lessor: ${user.getFullName()}</p>
            <p>Identity card no: ${user.getOCID()}</p><hr/>
            <p>Date of issue: <input type="date" name="dateFrom" value="${requestScope.dateFrom}"/> ${requestScope.fromError}</p>
            <p>Date of expiry: <input type="date" name="dateTo" value="${requestScope.dateTo}"/> ${requestScope.toError}</p>
            <p>Rental fee: <input type="number" name="intRentalFee" value="${requestScope.intRentalFee}"></p>
            <p><textarea name="txtDescription" rows="1" class="auto_height" oninput="auto_height(this)"></textarea></p>
            <input type="submit" name="action" value="Create Contract"/>
            ${requestScope.noti}
        </form>
            ${requestScope.descript}

        <script>
            function auto_height(elem) {  /* javascript */
                elem.style.height = "1px";
                elem.style.height = (elem.scrollHeight) + "px";
            }
        </script>
    </body>
</html>
