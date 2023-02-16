<%-- 
    Document   : registration
    Created on : Feb 9, 2023, 10:15:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
         
        <form action="MainController" method="post">
            Email <input type="text" name="txtEmail" value="${param.txtEmail}"/> ${ERROR.emailErr} <br>
            Password <input type="password" name="txtPassword" value=""/> ${ERROR.passwordErr}<br>
            Confirm <input type="password" name="txtConfirm" value=""/> ${ERROR.confirmErr}  <br>
            ID <input type="text" name="txtID" value="${param.txtID}"/>  ${ERROR.idErr}<br>
            <input type="submit" value="Create New Account" name="action" />
            <input type="reset" value="Reset"/>
            ${ERROR.existed}           
        </form>
        <a href="index.jsp">${requestScope.noti}</a>
    </body>
</html>
