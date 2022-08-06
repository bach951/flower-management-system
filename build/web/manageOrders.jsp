<%-- 
    Document   : manageOrders
    Created on : Mar 8, 2022, 3:05:13 PM
    Author     : AD
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:import url="header_loginedAdmin.jsp"/>

        <form action="mainController">
            from <input type="date" name="from" value="${param.from}"> to <input type="date" name="to" value="${param.to}">
            <input type="submit" value="searchDateManageOrders" name="action">
        </form>
        <section>
            <c:if test="${listOrders !=null}">
                <table>
                    <tr class="header-order-table">
                        <th>OrderID</th>
                        <th>OrdDate</th>
                        <th>Shipdate</th>
                        <th>Status</th>
                        <th>AccID</th>
                    </tr>

                    <c:forEach items="${listOrders}" var="listOrd">
                        <form action="mainController" method="post">
                            <tr class="order-table">
                                <td><input value="<c:out value="${listOrd.getOrderID()}" />" readonly="" name="orderId"></td>
                                <td><c:out value="${listOrd.getOrderDate()}" /></td>
                                <td> <input value="<c:out value="${listOrd.getShipDate()}"/>" type="date" name="shipdate"></td>
                                <td>
                                    <c:if test="${listOrd.getStatus() == 1}">Processing</c:if>
                                    <c:if test="${listOrd.getStatus() == 2}">Completed</c:if>
                                    <c:if test="${listOrd.getStatus() == 3}">Canceled</c:if>
                                    </td>
                                    <td><c:out value="${listOrd.getAccID()}" /></td>
                                <td><input name="action" value="saveShipDate" type="submit"></td>
                            </tr>
                        </form>
                    </c:forEach>           
                </table>
            </c:if>

        </section>

        <section>
            <c:if test="${requestScope.listOrdersManage != null}">
                <table>
                    <tr>
                        <th>OrderID</th>
                        <th>OrdDate</th>
                        <th>Shipdate</th>
                        <th>Status</th>
                        <th>AccID</th>
                    </tr>

                    <c:forEach items="${requestScope.listOrdersManage}" var="list">
                        <form action="mainController" method="post">
                            <tr>
                                <td><input value="<c:out value="${list.getOrderID()}" />" readonly="" name="orderId"></td>
                                <td><c:out value="${list.getOrderDate()}" /></td>
                                <td> <input value="<c:out value="${list.getShipDate()}"/>" type="date" name="shipDate"></td>
                                <td>
                                    <c:if test="${list.getStatus() == 1}">Processing</c:if>
                                    <c:if test="${list.getStatus() == 2}">Completed</c:if>
                                    <c:if test="${list.getStatus() == 3}">Canceled</c:if>
                                    </td>
                                    <td><c:out value="${list.getAccID()}" /></td>
                                <td><input name="action" value="saveShipDate" type="submit"></td>
                            </tr>
                        </form>
                    </c:forEach>           
                </table>
            </c:if>
        </section>
        <c:if test="${message != null}">
            <h3 style="color: green"><c:out value="${message}" /></h3>
        </c:if>
        <c:if test="${messageError != null}">
            <h3 style="color: red"><c:out value="${message}" /></h3>
        </c:if>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
