<%-- 
    Document   : updateCate.jsp
    Created on : Mar 15, 2022, 5:35:27 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <th>CateID</th>
                <th>CateName</th>
            </tr>
            <c:forEach items="${listCate}" var="listC">

                <form action="mainController" method="post">
                    <tr>
                        <td><input  value="<c:out value="${listC.getCateid()}"/>" name="cateId" readonly type="number"></td>
                        <td><input title="name not contain number and special character" pattern="[^0-9_]+[a-zA-Z ]" value="<c:out value="${listC.getCatename()}"/>" name="cateName" required=""></td>
                        <td><input name="action" value="updateCate" type="submit"></td>
                    </tr>
                </form>
            </c:forEach>           
        </table>
        <c:if test="${message != null}">
            <h3 style="color: green"><c:out value="${message}" /></h3>            
        </c:if>
        <a href="mainController?action=addNewCate">Add new Categories</a>  
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
