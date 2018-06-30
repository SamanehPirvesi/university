<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@page import="com.example.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
   
<%
long id =  Long.parseLong(request.getParameter("studentId"));
int n=Integer.parseInt(request.getParameter("departmentId"));
int n1=Integer.parseInt(request.getParameter("courseId"));
Student st=studentService.getStudentById(id);
Department readedDepartment=departmentService.getDepartmentById(n);
Course readedCourse=courseService.getCourseById(n1);
st.setCourse(readedCourse);
st.setDepartment(readedDepartment);
studentService.updateStudent(st);
response.sendRedirect("../student/listOfStudents.jsp");
%>

