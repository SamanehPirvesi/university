<%@page import="com.example.model.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>


<%
long id =  Long.parseLong(request.getParameter("courseId"));
Course course=courseService.getCourseById(id);
courseService.deleteCourse(course);
response.sendRedirect(request.getContextPath()+"/adminPortal/course/listOfCourses.jsp");
%>

