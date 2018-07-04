<%@page import="com.example.model.Department"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>

<%
long id =  Long.parseLong(request.getParameter("departmentId"));
Department department=departmentService.getDepartmentById(id);
departmentService.deleteDepartment(department);
response.sendRedirect(request.getContextPath()+"/adminPortal/department/listOfDepartments.jsp");
%>

