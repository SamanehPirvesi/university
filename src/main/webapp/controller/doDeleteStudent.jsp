
<%@page import="com.example.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>


<%
long id =  Long.parseLong(request.getParameter("studentId"));
Student st=studentService.getStudentById(id);
studentService.deleteStudent(st);
response.sendRedirect(request.getContextPath()+"/student/listOfStudents.jsp");
%>

