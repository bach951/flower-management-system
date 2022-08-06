<%-- 
    Document   : addNewCate
    Created on : Mar 15, 2022, 5:16:10 PM
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
                <tr><td>CateName</td><td><input name="cateName" required="required" pattern="[^0-9_]+[a-zA-Z ]"></td></tr>              
                <tr><td></td><td><input type="submit" name="action" value="createNewCate"></td></tr>
            </form>
        </table>
    <c:if test="${message != null}">
        <h3 style="color: green"><c:out value="${message}"/></h3>
    </c:if>
    <a href="mainController?action=viewUpdateCategories">Update Plant</a>   
    <footer>
        <c:import url="footer.jsp"/>
    </footer>
</body>
</html>
