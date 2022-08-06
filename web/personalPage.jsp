<%-- 
    Document   : personnalPage
    Created on : Feb 6, 2022, 8:23:47 PM
    Author     : AD
--%>

<%@page import="bachlx.dto.Account"%>
<%@page import="bachlx.dao.AccountDAO"%>
<%@page import="bachlx.dao.OrderDAO"%>
<%@page import="bachlx.dto.Order"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mycss.css">
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                String token = "";
                for (Cookie aCookie : c) {
                    if (aCookie.getName().equals("selector")) {
                        token = aCookie.getValue();
                        Account account = AccountDAO.getAccountByToken(token);
                        if (account != null) {
                            name = account.getFullname();
                            email = account.getEmail();
                            login = true;
                        }
                    }
                }
            } else {
                login = true;
            }
            if (login) {

        %>

        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back </h3>
            <h3> <a href="mainController?action=logout" class="logout">Logout</a> </h3>
        </section>

        <section> <!--load all orders of the user at here-->
            <c:if test="${requestScope.listOd != null}">

                <c:forEach items="${listOd}" var="list">
                    <table class="order-table"> 
                        <tr class="header-order-table">
                            <td>Order ID</td>
                            <td>Order Date</td>
                            <td>Ship Date</td>
                            <td>Status</td>
                            <td>Action</td>
                        </tr>
                        <tr class="order-content-table">
                            <td><c:out value="${list.getOrderID()}"></c:out></td> 
                            <td><c:out value="${list.getOrderDate()}"></c:out></td>     
                            <td><c:out value="${list.getShipDate()}"></c:out></td>                  
                            <td><c:if test="${list.getStatus() == 1}">
                                    Processing
                                    </br> <a href="mainController?action=canceledOrdersInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> cancel order</a>
                                </c:if>
                                <c:if test="${list.getStatus() == 2}">
                                    Completed
                                </c:if>
                                <c:if test="${list.getStatus() == 3}">
                                    Canceled
                                    </br> <a href="mainController?action=OrderAgainInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> Order again</a>
                                </c:if>

                            </td>  
                            <td><a href="orderDetail.jsp?orderid=<c:out value="${list.getOrderID()}"/>">detail</a></td>
                        </tr>
                    </c:forEach>

                </c:if>
            </table>
        </section>
<!--load all orders search-->
            <section>
            <c:if test="${requestScope.listOrders != null}">
                <table class="order-table"> 

                    <c:forEach items="${listOrders}" var="list">
                        <tr class="header-order-table">
                            <td>Order ID</td>
                            <td>Order Date</td>
                            <td>Ship Date</td>
                            <td>Status</td>
                            <td>Action</td>
                        </tr>
                        <tr class="order-content-table">
                            <td><c:out value="${list.getOrderID()}"></c:out></td> 
                            <td><c:out value="${list.getOrderDate()}"></c:out></td>     
                            <td><c:out value="${list.getShipDate()}"></c:out></td>                  
                            <td><c:if test="${list.getStatus() == 1}">
                                    Processing
                                    </br> <a href="mainController?action=canceledOrdersInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> cancel order</a>
                                </c:if>
                                <c:if test="${list.getStatus() == 2}">
                                    Completed
                                </c:if>
                                <c:if test="${list.getStatus() == 3}">
                                    Canceled
                                    </br> <a href="mainController?action=OrderAgainInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> Order again</a>
                                </c:if>

                            </td>  
                            <td><a href="orderDetail.jsp?orderid=<c:out value="${list.getOrderID()}"/>">detail</a></td>
                        </tr>
                    </c:forEach>
                        <a href="viewAllOrderPersonalServlet">View All Order</a>
                </c:if>
        </section>

        <footer>
            <%@include file ="footer.jsp" %>
        </footer>
        <%}%>

    </body>
</html>
