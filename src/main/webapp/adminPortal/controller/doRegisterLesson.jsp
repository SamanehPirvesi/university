<%@page import="com.example.model.Lesson"%>
<%@page import="com.example.utility.DateUtil"%>
<%@page import="com.example.model.Course"%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.ValidatorBeanUtil"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lesson" class="com.example.model.Lesson" scope="request"></jsp:useBean>
<jsp:useBean id="lessonService" class="com.example.service.LessonService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="lesson" />
<% 
Lesson readedlesson= lessonService.getlessonByName(lesson.getLessonName());
long courseId = Long.parseLong(request.getParameter("courseId"));
Course readedCourse=courseService.getCourseById(courseId);
	Set<String> errors = ValidatorBeanUtil.validateAndGetErrors(lesson);
	if (lesson != null && readedlesson == null && errors.size() == 0) {
	  	lesson.addCourses(readedCourse);
		readedCourse.addLessons(lesson);
		lessonService.createLesson(lesson);
		response.sendRedirect(request.getContextPath()+"/adminPortal/lesson/listOfLessones.jsp");
	} else {
		if (readedlesson != null) {
			errors.clear();
			errors.add("user " + lesson.getLessonName() + " already existed, please Enter another Lesson Name");
		}
		request.setAttribute("errors", errors);
%>

<jsp:forward page="../lesson/registerLesson.jsp"></jsp:forward>
<%
	}
%>