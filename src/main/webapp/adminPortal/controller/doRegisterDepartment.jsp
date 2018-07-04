<%@page import="com.example.utility.DateUtil"%>
<%@page import="com.example.model.Department"%>

<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.ValidatorBeanUtil"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="department" class="com.example.model.Department" scope="request"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="department" />

<% 
Department readedDepartment=departmentService.getDeaprtmentByName(department.getDepartmentName());
	Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(department);
	if (department != null && readedDepartment == null && errors.size() == 0) {
		departmentService.createDepartment(department);
		
		response.sendRedirect("../department/listOfDepartments.jsp");
	} else {
		if (readedDepartment != null) {
			errors.clear();
			errors.add("user " + department.getDepartmentName() + " already existed, please Enter another Department Name");
		}
		request.setAttribute("errors", errors);
%>

<jsp:forward page="../department/registerDepartment.jsp"></jsp:forward>
<%
	}
%>