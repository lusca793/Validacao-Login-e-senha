<%-- 
    Document   : logout
    Created on : 21/09/2020, 09:47:25
    Author     : lucas
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
