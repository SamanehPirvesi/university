<%@page import="com.example.model.Student"%>
<%@page import="com.example.model.Lesson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lessonService" class="com.example.service.LessonService" scope="page"></jsp:useBean>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>

<%
long id = Long.parseLong(request.getParameter("studentId"));
Student student= studentService.getStudentById(id);
String[] lessonSelected=request.getParameterValues("lessons");
  for(int i=0 ; i<lessonSelected.length ; i++){
 studentService.deletLessonFromLessonListForStudent(Long.parseLong(lessonSelected[i]),id);
}

 response.sendRedirect(request.getContextPath()+"/adminPortal/student/listOfLessonForStudent.jsp");
%>

