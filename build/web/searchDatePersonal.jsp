<%-- 
    Document   : searchDatePersonal
    Created on : Mar 17, 2022, 9:27:08 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mycss.css">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${requestScope.listOrders != null}">
            <table class="order-table"> 
                <tr class="header-order-table">
                    <td>Order ID</td>
                    <td>Order Date</td>
                    <td>Ship Date</td>
                    <td>Status</td>
                    <td>Action</td>
                </tr>
                <c:forEach items="${listOrders}" var="list">
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
                                </br> <a href="mainController?action=canceledOrdersInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> Order again</a>
                            </c:if>

                        </td>  
                        <td><a href="orderDetail.jsp?orderid=<c:out value="${list.getOrderID()}"/>">detail</a></td>
                    </tr>
                </c:forEach>

            </c:if>
        </table>
        <c:if test="${requestScope.listOrders == null}">
            <h3>without any date</h3>
        </c:if>
    </body>
</html>
