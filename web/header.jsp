<%-- 
    Document   : header
    Created on : Feb 2, 2022, 5:37:31 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width= device-width, initial-scale = 1.0">
        <link rel="stylesheet" href="mycss.css" type = "text/css"/>

    </head>
    <body>
        <header>
            <nav class="header">
                <ul class="clearfix">
                    <li><a href="index.jsp"><img src="images/logo.jpg" id="logo" ></a></li>
                    <li class="nav-header"><a href="index.jsp">Home</a></li>
                    <li class="nav-header"><a href="registration.jsp">Register</a></li>
                    <li class="nav-header nav-last"><a href="login.jsp">Login</a></li>
                    <li><a href="mainController?action=viewcart">view cart</a></li>
                    <li class="formsearch">
                        <form action="mainController" method ="post" >
                            <input type ="text" name="txtsearch" value ="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>">
                            <select name = "searchby">
                                <option value="byname">by name</option>
                                <option value="bycate">by category</option>
                            </select>
                            <input type="submit" value="search" name="action">
                        </form>
                    </li>

                </ul>
            </nav>
        </header>
    </body>
</html>
