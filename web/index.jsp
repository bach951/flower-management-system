<%-- 
    Document   : index
    Created on : Feb 2, 2022, 11:42:34 PM
    Author     : AD
--%>

<%@page import="bachlx.dao.PlantDAO"%>
<%@page import="bachlx.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <c:if test="${sessionScope.name != null}">
                <%@include file="headerLogined.jsp" %>
            </c:if>
            <c:if test="${sessionScope.name == null}">
                <%@include file="header.jsp" %>
            </c:if>

        </header>
        <section>
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list = new ArrayList<>();
                String[] tmp = {"out of stock", "availble"};
                if (keyword == null && searchby == null) {
                    list = PlantDAO.getPlants("", "");
                    for (Plant plant : list) {%>

            <div class="product-all">
                <table class="product-table">

                    <img src="<%=plant.getImgpath()%>" class="plant-img"> 

                    <ul class="product-content">
                        <li>Product ID: <%=plant.getId()%></li> 
                        <li>Product name: <%=plant.getName()%></li> 
                        <li>Price:<%=plant.getPrice()%></li> 
                        <li>Status: <%=plant.getStatus()%></li> 
                        <li>Category: <%=plant.getCatename()%></li> 
                        <li><a href="mainController?action=addtocart&pid=<%= plant.getId()%>">add to cart</a></li> 
                    </ul>

                </table>
            </div>




            <%
                }
            } else {
                list = PlantDAO.getPlants(keyword, searchby);
                for (Plant p : list) {%>

            <table class="product">
                <tr>
                    <td> <img src="<%=p.getImgpath()%>" class="plant-img"> </td>
                    <td>Product ID: <%=p.getId()%></td> 
                    <td>Product name: <%=p.getName()%></td>
                    <td>Price:<%=p.getPrice()%></td>
                    <td>Status: <%=p.getStatus()%></td>
                    <td>Category: <%=p.getCatename()%></td>
                    <td><a href="mainController?action=addtocart&pid=<%= p.getId()%>">add to cart</a></td>
                </tr>
            </table>
            <%
                    }
                }

            %>
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
