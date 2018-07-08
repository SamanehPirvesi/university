<%@page import="java.util.List"%>
<%@page import="com.example.model.Lesson"%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.ValidatorBeanUtil"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lesson" class="com.example.model.Lesson" scope="request"></jsp:useBean>
<jsp:useBean id="lessonService" class="com.example.service.LessonService" scope="page"></jsp:useBean>

<% 
String lessonSelected=request.getParameter("lessons");
out.println(lessonSelected);
	



%>