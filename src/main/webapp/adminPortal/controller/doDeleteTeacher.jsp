

<%@page import="com.example.model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>


<%
long id =  Long.parseLong(request.getParameter("teacherId"));
Teacher teacher=teacherService.getTeacherById(id);
teacherService.deleteTeacher(teacher);
response.sendRedirect(request.getContextPath()+"/adminPortal/teacher/listOfTeachers.jsp");
%>

