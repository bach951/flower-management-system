<%-- 
    Document   : viewCart
    Created on : Feb 15, 2022, 9:34:45 AM
    Author     : AD
--%>

<%@page import="bachlx.dto.Plant"%>
<%@page import="bachlx.dao.OrderDAO"%>
<%@page import="bachlx.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bachlx.dao.PlantDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <section>
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>        
            <h3> Welcome <%= session.getAttribute("name")%> come back </h3>
            <h3><a href="mainController?action=logout">logout</a></h3>
            <h3><a href="viewAllOrderPersonalServlet">Back to personal Page</a></h3>
            <%
                }
            %>
            <font style="color: red;"> <%=(request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </font>
        </section>
        <section>
            <table>
                <tr class="shopping-header">
                    <td >Picture</td>
                    <td>Name</td>
                    <td >Product id</td>
                    <td >Quantity</td>
                    <td >Action</td>
                </tr>
                <%
                    Plant p;
                    int total = 0;
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            int quantity = cart.get(pid);
                            p = PlantDAO.getItem(pid);
                            total = total + quantity * p.getPrice();

                %>
                <form action="mainController" method="post">
                    <tr class="shopping-item">
                        <td class=""><img src="<%=p.getImgpath()%>" class="plant-img"> </td>
                        <td><%= p.getName()%></td>
                        <td class=""><input type="hidden" value="<%= pid%>" name="pid"> <a href="getPlantServlet?pid=<%=pid%>"><%= pid %></a> </td>
                        <td class=""><input type="number" value="<%= quantity%>" name="quantity" max="10" min="1"></td>
                        <td class=""><input type="submit" value="update" name="action"> <input type="submit" value="delete" name="action"></td>
                    </tr>
                </form>

                <%

                    }
                } else {
                %>
                <tr>
                    <td>Your cart is empty</td>
                </tr>
                <%  }

                %>
                <tr>

                    <td>Total money: <%= total%> $ </td>

                </tr>
                <tr>
                    <%
                        Date d = new Date();
                    %>
                    <td>Order Date: <%=d%></td>

                </tr>
                <tr>
                    <td>Ship Date: N/A </td>                  
                </tr>
            </table>

        </section>

        <section>
            <form action="mainController" method="post">
                <input type="submit" value="saveOrder" name="action" class="submitorder">
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>

    </body>
</html>
