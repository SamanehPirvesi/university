<%@page import="com.example.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Course"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService"	class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Set<String> errors = (Set<String>) request.getAttribute("errors");
	List<Course> courses = (List<Course>) courseService.getListOfAllCourses();
	List<Department> departments = (List<Department>)departmentService.getListAllDepartments();
	pageContext.setAttribute("errors", errors);
%>


<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../layout/header.jsp"></jsp:include>
<body>
	<div id="wrapper">
		<jsp:include page="../../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
				<div class="container">
	<div id="signupbox" style="margin-top: 50px"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">Add new teacher</div>

			</div>
			<div class="panel-body">
				<c:if test="${errors.size() > 0}">
					<ul>
						<c:forEach items="${errors}" var="err">
							<li class="alert-danger"><c:out value="${err}" />
								<p></li>
						</c:forEach>
					</ul>
				</c:if>
				<form id="signupform" class="form-horizontal" role="form"
					action="../controller/doRegisterTeacher.jsp" method="post">
					<div id="signupalert" style="display: none"
						class="alert alert-danger">
						<p>Error:</p>
						<span></span>
					</div>
					<div class="form-group">
						<label for="username" class="col-md-3 control-label">UserName</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="userName"
								placeholder="UserName">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-3 control-label">Password</label>
						<div class="col-md-9">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="Password">
						</div>
					</div>
										<div class="form-group">
						<label for="firstname" class="col-md-3 control-label">Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="name" id="name"
								placeholder="Name">
						</div>
					</div>
					<div class="form-group">
						<label for="SurNmae" class="col-md-3 control-label">SurName</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="surName"
								id="surName" placeholder="SurName">
						</div>
					</div>
						<div class="form-group">
						<label for="department" class="col-md-3 control-label">DepartmentId</label>
						<div class="col-md-9">
							<select class="form-control" name="departmentId">
								<option>select a valid departments</option>
								<%
									for (Department d : departments) {
								%>
								<option value="<%=d.getDepartmentId()%>"><%=d.getDepartmentName()%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="course" class="col-md-3 control-label">CourseId</label>
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
						<label for="salary" class="col-md-3 control-label">Salary</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="salary" id="salary">
						</div>
					</div>
 					<div class="form-group">
					<label for="birthDay" class="col-md-3 control-label">BirthDay</label> 
					 <div class="col-md-9"> 
					 <input type="date" class="form-control" name="birthday_Costum"  
					id="birthday_Costum" placeholder="Birthday"> 
					</div>
					</div>
					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="btn-signup" type="submit"
								class="btn btn-info btn-block">
								<i class="icon-hand-right"></i> Insert new teacher
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
				
	</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>


