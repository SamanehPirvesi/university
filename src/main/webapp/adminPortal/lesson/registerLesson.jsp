<%@page import="java.util.Set"%>
<%@page import="com.example.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="courseService"	class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="lessonService"	class="com.example.service.LessonService" scope="page"></jsp:useBean>
<%
Set<String> errors =(Set<String>)request.getAttribute("errors");
List<Course> courses = (List<Course>) courseService.getListOfAllCourses();
pageContext.setAttribute("errors",errors);
%>
<!DOCTYPE html >
<html>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<body>
<jsp:include page="../../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
				<div class="container">
	<div id="signupbox" style="margin-top: 50px"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">add new Lesson</div>
				</div>
			<div class="panel-body">
			<c:if test="${errors.size() > 0}">
			  <ul>
			  <c:forEach   items="${errors}"   var="err" >
			       <li class="alert-danger"> <c:out value="${err}"/><p>  </li>   
			  </c:forEach> 
			  </ul>
			</c:if>
				<form id="signupform" class="form-horizontal" role="form"
					action="../controller/doRegisterLesson.jsp" method="post">
					<div id="signupalert" style="display: none"
						class="alert alert-danger">
						<p>Error:</p>
						<span></span>
					</div>
					<div class="form-group">
						<label for="name" class="col-md-3 control-label">Lesson Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="lessonName"
								placeholder="Lesson Name">
						</div>
					</div>
					<div class="form-group">
						<label for="credit" class="col-md-3 control-label">Lesson Credit</label>
						<div class="col-md-9">
							<input type="number" class="form-control" name="credit"
								id="credit" placeholder="credit">
						</div>
					</div>
					<div class="form-group">
						<label for="course" class="col-md-3 control-label">CourseName</label>
						<div class="col-md-9">
							<select class="form-control" name="courseId">
								<option>select a valid course</option>
								<%
									for (Course c : courses) {
								%>
								<option value="<%=c.getCourseId()%>"><%=c.getCourseName()%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="btn-signup" type="submit"
								class="btn btn-info btn-block">
								<i class="icon-hand-right"></i> Insert new Lesson
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>

