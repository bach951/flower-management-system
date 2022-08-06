<%-- 
    Document   : headerSigned.jsp
    Created on : Mar 10, 2022, 3:19:01 PM
    Author     : AD
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="mycss.css" type = "text/css"/>
        <meta name="viewport" content="width= device-width, initial-scale = 1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <li> <c:out value="${sessionScope.name}"/></li>
                    <li> <a href="mainController?action=logout" class="logout">Logout</a></li> 
                    <li><a href="viewAllOrderPersonalServlet">Go to personal page</a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>
