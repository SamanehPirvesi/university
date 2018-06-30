<%@page import="com.example.model.Teacher"%>
<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.ValidatorBeanUtil"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="teacher" class="com.example.model.Teacher" scope="request"></jsp:useBean>
<jsp:useBean id="department" class="com.example.model.Department" scope="request"></jsp:useBean>
<jsp:useBean id="course" class="com.example.model.Course" scope="request"></jsp:useBean>
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:useBean id="userService" class="com.example.service.UserService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="teacher" />
<jsp:setProperty property="*" name="department" />
<jsp:setProperty property="*" name="course" />
<% 
Teacher readedTeacher = teacherService.getTeacherById(teacher.getUserId());
Department readedDepartment=departmentService.getDepartmentById(department.getDepartmentId());
Course readedCourse=courseService.getCourseById(course.getCourseId());
	Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(teacher);
	if (teacher != null && readedTeacher == null && errors.size() == 0) {
		teacher.setPassword(PasswordCodification.codificatePass(teacher.getPassword()));
		teacher.addDepartmet(readedDepartment);
		teacher.addCourses(readedCourse);
		readedCourse.addTeacher(teacher);
		//readedDepartment.addTeacher(teacher);
		//userService.createUser(teacher);
		departmentService.updateDepartment(readedDepartment);
		//courseService.updateCourse(readedCourse);
		response.sendRedirect("../userPortal/adminHome.jsp");
	} else {
		if (readedTeacher != null) {
			errors.clear();
			errors.add("user " + teacher.getSurName() + " already existed, please Enter another Student");
		}
		request.setAttribute("errors", errors);
%>

<jsp:forward page="../student/registerStudent.jsp"></jsp:forward>
<%
	}
%>