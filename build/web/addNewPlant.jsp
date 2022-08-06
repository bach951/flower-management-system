<%-- 
    Document   : addNewPlant
    Created on : Mar 11, 2022, 11:18:57 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <c:import url="header_loginedAdmin.jsp"/>
        </header>
        <table>
            <form method="post" action="mainController">               
                <tr><td>PName</td><td><input value="${param.pName}" name="pName" required="required" pattern="[^0-9_]+[a-zA-Z ]" title="name not contain special character and number"></td></tr>
                <tr><td>Price</td><td><input value="${param.price}" name="price" required="required" type="number"></td></tr>
                <tr><td>ImgPath</td><td><input value="${param.imgPath}" name="imgPath" required="required"></td></tr>
                <tr><td>Description</td><td><input value="${param.description}" name="description" required="required"></td></tr>
                <tr><td>Status</td><td><input value="${param.status}" name="status" required="required" type="number" max="1" min="0"></td></tr>
                <tr><td>CateId</td><td><input value="${param.cateId}" name="cateId" required="required" type="number"></td></tr>                
                <tr><td></td><td><input type="submit" name="action" value="createNewPlant"></td></tr>
            </form>
        </table> 
        <c:if test="${message != null}"> 
            <h3 style="color: green"><c:out value="${message}"/></h3>
        </c:if>
        <c:if test="${notValidCateId != null}">
            <h3 style="color: red"><c:out value="${notValidCateId}"/></h3>
        </c:if>
        <a href="mainController?action=viewUpdatePlant">Update Plant</a>   
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
