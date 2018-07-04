<%@page import="com.example.utility.DateUtil"%>
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
<jsp:useBean id="userService" class="com.example.service.UserService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="student" />

<% 
User readedUser = userService.getUserByUserName(student.getUserName());
student.setBirthday(DateUtil.getStringToDate(request.getParameter("birthday_Costum")));
long courseId = Long.parseLong(request.getParameter("courseId"));
long departmentId=Long.parseLong(request.getParameter("departmentId"));
Department readedDepartment=departmentService.getDepartmentById(departmentId);
Course readedCourse=courseService.getCourseById(courseId);

	Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(student);
	if (student != null && readedUser == null && errors.size() == 0) {
		student.setPassword(PasswordCodification.codificatePass(student.getPassword()));
		student.setDepartment(readedDepartment);
		student.setType("student");
		student.setCourse(readedCourse);
		readedCourse.addStudent(student);
		readedDepartment.addStudent(student);
		userService.createUser(student);
		departmentService.updateDepartment(readedDepartment);
		courseService.updateCourse(readedCourse);
		
		response.sendRedirect("../student/listOfStudents.jsp");
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