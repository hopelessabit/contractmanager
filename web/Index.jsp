<%-- 
    Document   : login
    Created on : Feb 9, 2023, 1:48:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${requestScope.notification}
        <form action="MainController" method="post">
            Email <input type="text" name="emailtxt" value="${param.emailtxt}"/>
            <br/>
            Password <input type="password" name="passwordtxt"/>
            <br/>
            Login as:
            <select name="role">               
                <option value="Customer">Customer</option>
                <option value="Owner">Owner</option>
                <option value="Resident">Resident</option>
                <option value="Seller">Seller</option>             
                <option value="Admin">Admin</option>             
                <option value="BoardManager">Board Manager</option>             
            </select>
            <input type="submit" value="Login" name="action"/>
        </form>
            <br/>
            <a href="Registration.jsp">Registration</a>
            <br/>
            <a href="ChangePassword.jsp">Change password</a>
    </body>
</html>
