<%@page import="com.example.model.Teacher"%>
<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>
   
<%
long id =  Long.parseLong(request.getParameter("teacherId"));
int department=Integer.parseInt(request.getParameter("departmentId"));
int course=Integer.parseInt(request.getParameter("courseId"));
float salary=Float.parseFloat(request.getParameter("salary"));
Teacher teacher=teacherService.getTeacherById(id);
Department readedDepartment=departmentService.getDepartmentById(department);
Course readedCourse=courseService.getCourseById(course);
teacher.addCourses(readedCourse);
teacher.addDepartmet(readedDepartment);
teacherService.updateTeacher(teacher);
departmentService.updateDepartment(readedDepartment);
response.sendRedirect("../teacher/listOfTeachers.jsp");
%>

