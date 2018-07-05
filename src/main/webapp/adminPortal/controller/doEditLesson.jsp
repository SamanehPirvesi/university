<%@page import="com.example.model.Lesson"%>
<%@page import="com.example.model.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="lessonService" class="com.example.service.LessonService" scope="page"></jsp:useBean>

   
<%
long id =  Long.parseLong(request.getParameter("lessonId"));
int course=Integer.parseInt(request.getParameter("courseId"));
String lessonName=request.getParameter("lessonName");
Course readedCourse=courseService.getCourseById(course);
Lesson lesson=lessonService.getLessonById(id);
lesson.setLessonName(lessonName);
readedCourse.addLessons(lesson);
lessonService.updateLesson(lesson);
courseService.updateCourse(readedCourse);
response.sendRedirect("../lesson/listOfLessones.jsp");
%>

