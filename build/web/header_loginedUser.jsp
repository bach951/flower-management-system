<%-- 
    Document   : header_loginUser
    Created on : Feb 6, 2022, 8:16:41 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="nav-loginedUser">
            <ul class="clearfix header" >
                <li>
                    <a href="index.jsp">Home</a>
                </li>
                <li>
                    <a href="changeProfile.jsp">Change profile</a>
                </li>
                <li>
                    <a href="completeOrder.jsp">Completed orders</a>
                </li>
                <li>
                    <a href="canceledOrder.jsp">Canceled orders</a>
                </li>
                <li>
                    <a href="processingOrders.jsp">Processing orders</a>
                </li>
                <li>
                    <form action="mainController">
                        from <input type="date" name="from"> to <input type="date" name="to">
                        <input type="submit" value="searchDate" name="action">
                    </form>

                </li>
            </ul>
        </nav>
    </body>
</html>
