<%-- 
    Document   : changeProfile
    Created on : Feb 15, 2022, 4:14:06 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp"%>
        </header>

        <form action="mainController" method="post">
            <table>
                <tr>
                    <td>Full Name</td>
                    <td><input name="txtfullname" pattern="[^0-9_]+[a-zA-Z ]"></td>              
                </tr> 
                <tr>
                    <td>Phone Number</td>
                    <td><input name="txtphonenumber" pattern="[0-9]*"></td>              
                </tr>
                <tr>
                    <td>Password(confirm change profile)</td>
                    <td><input type="pasword" name="txtpassword"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="changeProfile" name="action"></td>
                </tr>
                <tr>
                    <td><h3><a href="viewAllOrderPersonalServlet">View all orders</a></h3></td>
                </tr>
                <%
                    if (request.getAttribute("updateSuccess") != null) {%>
                <h3 style="color: green"> <%=request.getAttribute("updateSuccess")%> </h3>   
                <%
                    }
                %>

                <%
                    if (request.getAttribute("updateFail") != null) {%>
                <h3 style="color: red"> <%=request.getAttribute("updateFail")%> </h3>    
                <%
                    }
                %>

            </table> 
        </form>

        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>
