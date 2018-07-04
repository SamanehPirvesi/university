<%@page import="com.example.utility.DateUtil"%>
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
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:useBean id="userService" class="com.example.service.UserService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="teacher" />
<% 
Teacher readedTeacher = teacherService.getTeacherById(teacher.getUserId());
teacher.setBirthday(DateUtil.getStringToDate(request.getParameter("birthday_Costum")));
long courseId = Long.parseLong(request.getParameter("courseId"));
long departmentId=Long.parseLong(request.getParameter("departmentId"));
Department readedDepartment=departmentService.getDepartmentById(departmentId);
Course readedCourse=courseService.getCourseById(courseId);
	Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(teacher);
	if (teacher != null && readedTeacher == null && errors.size() == 0) {
	    teacher.setType("Teacher");
		teacher.setPassword(PasswordCodification.codificatePass(teacher.getPassword()));
		teacher.addDepartmet(readedDepartment);
		teacher.addCourses(readedCourse);
		readedCourse.addTeacher(teacher);
		readedDepartment.addTeacher(teacher);
		
		/* departmentService.updateDepartment(readedDepartment); */
		/*  courseService.updateCourse(readedCourse); */
		teacherService.createTeacher(teacher);
		response.sendRedirect(request.getContextPath()+"/adminPortal/teacher/listOfTeachers.jsp");
	} else {
		if (readedTeacher != null) {
			errors.clear();
			errors.add("user " + teacher.getSurName() + " already existed, please Enter another Student");
		}
		request.setAttribute("errors", errors);
%>

<jsp:forward page="../teacher/registerTeacher.jsp"></jsp:forward>
<%
	}
%>