
<%@page import="com.example.model.Lesson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lessonService" class="com.example.service.LessonService" scope="page"></jsp:useBean>


<%
long id = Long.parseLong(request.getParameter("lessonId"));
Lesson lesson=lessonService.getLessonById(id);
lessonService.deleteLesson(lesson);
response.sendRedirect(request.getContextPath()+"/adminPortal/lesson/listOfLessones.jsp");
%>

