<%-- 
    Document   : manageCategories
    Created on : Mar 15, 2022, 4:33:31 PM
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
                <th>CateID</th>
                <th>CateName</th>
            </tr>
           
            <c:forEach items="${requestScope.listCate}" var="listC">
                <tr> 
                    <td><c:out value="${listC.getCateid()}" /></td>
                    <td><c:out value="${listC.getCatename()}" /></td>                   
                </tr>
            </c:forEach>           
        </table>

        <a href="mainController?action=addNewCate">Add new Cate</a>  
        <br/>
        <a href="mainController?action=viewUpdateCategories">Update Categories</a>   
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
