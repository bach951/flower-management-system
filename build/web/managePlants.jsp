<%-- 
    Document   : managePlants.jsp
    Created on : Mar 10, 2022, 4:55:25 PM
    Author     : AD
--%>

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
        <table>
            <tr>
                <th>PID</th>
                <th>PName</th>
                <th>Price</th>
                <th>imgPath</th>
                <th>description</th>
                <th>status</th>
                <th>CateID</th>
            </tr>
            <c:if test="${listPlants == null}">
                <h3>hihi</h3>
            </c:if>
            <c:forEach items="${listPlants}" var="listP">
                <tr> 
                    <td><c:out value="${listP.getId()}" /></td>
                    <td><c:out value="${listP.getName()}" /></td>
                    <td><c:out value="${listP.getPrice()}"/></td>
                    <td><img class="plant-img" src="<c:out value="${listP.getImgpath()}"/>" ></td>
                    <td><c:out value="${listP.getDescription()}"/></td>
                    <td>
                        <c:if test="${listP.getStatus() == 1}">stocking</c:if>
                        <c:if test="${listP.getStatus() == 0}">Out of stock</c:if>
                        </td>
                        <td><c:out value="${listP.getCateid()}"/></td>
                    <td><c:out value="${listP.getCatename()}" /></td>
                </tr>
            </c:forEach>           
        </table>

        <a href="mainController?action=addNewPlant">Add new Plant</a>  
        <br/>
        <a href="mainController?action=viewUpdatePlant">Update Plant</a>   
        <footer>
            <c:import url="footer.jsp"/>
        </footer>

    </body>
</html>
