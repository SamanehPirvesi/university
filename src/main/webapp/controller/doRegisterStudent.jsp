<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@page import="com.example.service.UserService"%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.ValidatorBeanUtil"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@page import="com.example.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="student" class="com.example.model.Student" scope="request"></jsp:useBean>
<jsp:useBean id="department" class="com.example.model.Department" scope="request"></jsp:useBean>
<jsp:useBean id="course" class="com.example.model.Course" scope="request"></jsp:useBean>
<jsp:useBean id="userService" class="com.example.service.UserService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="student" />
<jsp:setProperty property="*" name="department" />
<jsp:setProperty property="*" name="course" />
<% 
User readedUser = userService.getUserByUserName(student.getUserName());
Department readedDepartment=departmentService.getDepartmentById(department.getDepartmentId());
Course readedCourse=courseService.getCourseById(course.getCourseId());
	Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(student);
	if (student != null && readedUser == null && errors.size() == 0) {
		student.setPassword(PasswordCodification.codificatePass(student.getPassword()));
		student.setDepartment(readedDepartment);
		student.setCourse(readedCourse);
		readedCourse.addStudent(student);
		readedDepartment.addStudent(student);
		userService.createUser(student);
		departmentService.updateDepartment(readedDepartment);
		courseService.updateCourse(readedCourse);
		System.out.println(student.getDepartment().getDepartmentName());
		System.out.println(student.getSurName());
		response.sendRedirect("../userPortal/adminHome.jsp");
	} else {
		if (readedUser != null) {
			errors.clear();
			errors.add("user " + student.getSurName() + " already existed, please Enter another Student");
		}
		request.setAttribute("errors", errors);
%>

<jsp:forward page="../student/registerStudent.jsp"></jsp:forward>
<%
	}
%>