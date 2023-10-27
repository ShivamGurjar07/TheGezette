<%-- 
    Document   : logout
    Created on : Apr 27, 2022, 1:30:43 PM
    Author     : DIPESH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.removeAttribute("admin");
    response.sendRedirect("../login.jsp");
    
    %>