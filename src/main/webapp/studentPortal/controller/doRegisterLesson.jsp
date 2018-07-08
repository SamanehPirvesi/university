<%@page import="com.example.model.Student"%>
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
<jsp:useBean id="user" class="com.example.model.User" scope="session"></jsp:useBean>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>

<% 
Student readedStudent=studentService.getStudentById(user.getUserId());
String[] lessonSelected=request.getParameterValues("lessons");
 for(int i=0 ; i<lessonSelected.length ; i++){
Lesson readedLesson=lessonService.getLessonById(Long.parseLong(lessonSelected[i]));
readedStudent.Addlessons(readedLesson);
studentService.updateStudent(readedStudent);
 }
 response.sendRedirect("../listOfLessonForStudent.jsp");
	



%>