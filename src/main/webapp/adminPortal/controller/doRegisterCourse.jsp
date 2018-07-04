<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.ValidatorBeanUtil"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="course" class="com.example.model.Course" scope="request"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="course" />

<% 
Course readedCourse = courseService.getCoursementByName(course.getCourseName());
long departmentId=Long.parseLong(request.getParameter("departmentId"));
Department readedDepartment=departmentService.getDepartmentById(departmentId);
Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(course);
	if (course != null && readedCourse == null && errors.size() == 0) {
	course.setDepartment(readedDepartment);
	readedDepartment.addCourse(course);
	courseService.createCourse(course);
	departmentService.updateDepartment(readedDepartment);
			
	response.sendRedirect("../course/listOfCourses.jsp");
	} else {
		if (readedCourse != null) {
			errors.clear();
			errors.add("user " +course.getCourseName() + " already existed, please Enter another Course Name");
		}
		request.setAttribute("errors", errors);
%>

<jsp:forward page="../course/registerCourse.jsp"></jsp:forward>
<%
	}
%>