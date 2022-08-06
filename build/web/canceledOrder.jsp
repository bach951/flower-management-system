<%-- 
    Document   : canceledOrder
    Created on : Feb 17, 2022, 9:17:14 AM
    Author     : AD
--%>

<%@page import="bachlx.dao.OrderDAO"%>
<%@page import="bachlx.dto.Order"%>
<%@page import="bachlx.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
        %>

        <section>
            <h3>
                Welcome <%= name%> com back to website
                <h3> <a href="mainController?action=logout" class="logout">Logout</a> </h3>
                <h3><a href="viewAllOrderPersonalServlet">View all orders</a></h3>
            </h3>
        </section>
        <section> <!--load all orders of the user at here-->
            <%
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
                        if (ord.getStatus() == 3) {
            %>
            <table class="order-table">
                <tr class="header-order-table">
                    <td>Order ID</td>
                    <td>Order Date</td>
                    <td>Ship Date</td>
                    <td>Order's status</td>
                    <td>action</td>                          
                </tr>
                <tr class="order-content-table">
                    <td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%>
                        <br/><a href="mainController?action=ordersAgain&&orderid=<%=ord.getOrderID()%>">order again</a>
                    </td>
                    <td> <a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>"> detail</td>
                </tr>
            </table>

            <%          }
                }
            } else {
            %>

            <p>You don't have any order</p>
            <%}%>
        </section>  








        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
