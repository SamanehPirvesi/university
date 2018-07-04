<%@page import="com.example.model.Department"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
   
<%
long id =  Long.parseLong(request.getParameter("departmentId"));
Department department=departmentService.getDepartmentById(id);
String name=request.getParameter("name");
department.setDepartmentName(name);
departmentService.updateDepartment(department);

response.sendRedirect("../department/listOfDepartments.jsp");
%>

