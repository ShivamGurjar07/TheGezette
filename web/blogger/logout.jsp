<%-- 
    Document   : logout
    Created on : Apr 27, 2022, 1:32:23 PM
    Author     : DIPESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("blogger");
    response.sendRedirect("../login.jsp");
    
    %>