<%-- 
    Document   : sendOTP.jsp
    Created on : Mar 20, 2022, 6:37:51 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>

        <h3>Please check your email: <c:out value="${email_newAccount}"/>, a confirm code is send to you</h3>

        <footer>
            <%@include file ="footer.jsp" %>
        </footer>
    </body>
</html>
