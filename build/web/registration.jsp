<%-- 
    Document   : registration.jsp
    Created on : Feb 5, 2022, 8:49:48 PM
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
            <form action="mainController" method="post" class="formregister">
                <h1>Register</h1>
                <table>
                    <tr>
                        <td>email</td>
                        <td><input type="text" name="txtemail" required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="monalisa@gmail.com" title="email must have form: ...@gmail.com"></td>  
                    </tr>
                    <tr>
                        <td>full name</td>
                        <td><input type="text" name="txtfullname" required="" pattern="[^0-9_]+[a-zA-Z ]" title="name not contain number and special character"></td>  
                    </tr>
                    <tr>
                        <td>password</td>
                        <td><input type="password" name="txtpassword" pattern=".{8,}" required="" title="Eight or more characters"></td>  
                    </tr>
                    <tr>
                        <td>phone</td>
                        <td><input title="phone number must be a number" type="text" name="txtphone" pattern="[0-9]*" required=""></td>  
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="register" name="action" ></td>

                    </tr>
                </table>
            </form>
            <%

                if (request.getAttribute("invalidEmail") != null) {
            %>
            <h3 style="color: red"><%=request.getAttribute("invalidEmail")%> </h3>
            <%
                }
            %>
        </section>

        <footer>
            <%@include file ="footer.jsp" %>
        </footer>
    </body>
</html>
