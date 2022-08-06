<%-- 
    Document   : orderDetail.jsp
    Created on : Feb 8, 2022, 8:51:00 PM
    Author     : AD
--%>

<%@page import="javax.xml.soap.Detail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bachlx.dao.OrderDAO"%>
<%@page import="bachlx.dto.OrderDetail"%>
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
            if (name == null) {

        %>
        <p> <font color="red"> you must login to view personal page</font> </p>
        <p></p>
        <%} else {
        %>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3>Welcome <%= name%> come back </h3>
            <h3> <a href="mainController?action=logout" class="logout">Logout</a> </h3>
            <h3><a href="viewAllOrderPersonalServlet" class="view-all-orders">view all orders</a></h3>      
        </section>
        <section>
            <%
                String orderid = request.getParameter("orderid");
                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail orderDetail : list) {%>
            <table class="order-detail-table"> 
                <tr class="header-order-detail">
                    <td>Plant</td>
                    <td>Plant Name</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>quantity</td>                          
                </tr>
                <tr>
                    <td><%= orderDetail.getOrderID()%></td>
                    <td><%= orderDetail.getPlantName()%></td>
                    <td> <img src="<%= orderDetail.getImgPath()%>" class="plant-img"> </td>
                    <td><%= orderDetail.getQuantity()%></td>
                    <td><%= orderDetail.getPrice()%></td>
                    <% money = money + orderDetail.getPrice() * orderDetail.getQuantity();%>
                </tr>
            </table>
            <% }%>
            <h3>Total money: <%= money%></h3>
            <% } else {

            %>
            <p>You don't have any order</p>
            <%                    }
                    }
                }
            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
