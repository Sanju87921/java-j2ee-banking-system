<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // End admin session safely
    if (session != null) {
        session.invalidate();
    }

    // Redirect back to admin login
    response.sendRedirect("admin_login.jsp");
%>
