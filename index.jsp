<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // PBL 5: Session Tracking setup
    session.setAttribute("student_id", 1);
    session.setAttribute("student_name", "Alex Mercer");
    response.sendRedirect("dashboard.jsp");
%>