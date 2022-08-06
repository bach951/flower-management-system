<%-- 
    Document   : viewPlant
    Created on : Mar 6, 2022, 1:24:05 PM
    Author     : AD
--%>

<%@page import="java.awt.image.SampleModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type = "text/css"/>
        <title>JSP Page</title>
    </head>
    <body>


        <table>
            <tr> <td><img src="${plantObj.imgpath}" class="plant-img"></td> </tr>
            <tr><td>id:</td><td> ${plantObj.id}</td></tr>
            <tr><td>product name:</td><td> ${plantObj.name}</td></tr>
            <tr><td>price:</td><td>${plantObj.price}</td></tr>
            <tr><td>description:</td><td> ${plantObj.description}</td></tr>
            <tr><td>status:</td><td> ${plantObj.status}</td></tr>
            <tr><td>cate id:</td><td> ${plantObj.cateid}</td></tr>
            <tr><td>category:</td><td> ${plantObj.catename}</td></tr>
        </table>
    </body>
</html>
