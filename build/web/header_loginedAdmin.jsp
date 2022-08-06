<%-- 
    Document   : header_loginedAdmin
    Created on : Mar 6, 2022, 2:44:56 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type = "text/css"/>
    </head>
    <body>

        <header>
            <ul class="clearfix header-admin">
                <li><a href="mainController?action=manageAccounts">Manage Accounts</a></li>
                <li><a href="mainController?action=manageOrders"> Manage Orders</a></li>
                <li><a href="mainController?action=managePlants"> Manage Plants</a></li>
                <li><a href="mainController?action=manageCategories">Manage categories</a></li>
                <li>Welcome ${sessionScope.name} |<a href="logoutServlet">logout</a></li>
            </ul>
        </header>
    </body>
</html>
