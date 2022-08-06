<%-- 
    Document   : login
    Created on : Feb 5, 2022, 8:38:01 PM
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
            <%@include file="header.jsp" %>
        </header>

        <section>
            <form action = "mainController" method="post" class="formlogin">
                <font style="color: red;"> <%=(request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </font>
                <table>
                    <tr>
                        <td>email</td>
                        <td> <input type="text" name="txtemail" </td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td> <input type="password" name="txtpassword"> </td>
                    </tr>

                    <tr>
                        <td colspan="2"> <input type="submit" value = "login" name="action"></td>

                    </tr>
                    <%
                        if (request.getAttribute("invalidEmail") != null) {
                    %>
                    <h3><p style="color: red">
                            <%= request.getAttribute("invalidEmail")%>
                        </p></h3>    
                        <%
                            }
                        %>
                    <tr>
                        <td colspan="2"> <input type="checkbox" value = "savelogin" name="savelogin"> Stayed signed in</td>

                    </tr>
                </table>

            </form>
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
