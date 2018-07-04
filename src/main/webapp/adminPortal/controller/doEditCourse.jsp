<%@page import="java.util.List"%>
<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
   
<%
long id =Long.parseLong(request.getParameter("courseId"));
long n=Long.parseLong(request.getParameter("departmentId"));
String courseName=request.getParameter("coursename");
Course course=courseService.getCourseById(id);
List<Course> listOfCourseForDepartment=(List<Course>)departmentService.getListOfCourseForDepartment(n);
Department readedDepartment=departmentService.getDepartmentById(n);
course.setCourseName(courseName);
course.setDepartment(readedDepartment);
courseService.updateCourse(course);
response.sendRedirect("../course/listOfCourses.jsp");

%>

