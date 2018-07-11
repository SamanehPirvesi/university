<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>
   
<%
long id=Long.parseLong(request.getParameter("teacherId"));
long department=Long.parseLong(request.getParameter("departmentId"));
teacherService.DeleteDepartmentFromDepartmentListForTeacher(department,id);

response.sendRedirect("../teacher/listOfTeachers.jsp");
%>

