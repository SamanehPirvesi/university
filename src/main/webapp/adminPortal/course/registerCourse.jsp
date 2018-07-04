<%@page import="com.example.model.Department"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Set<String> errors = (Set<String>) request.getAttribute("errors");
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
				<div class="panel-title">Add new Course</div>

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
					action="../controller/doRegisterCourse.jsp" method="post">
					<div id="signupalert" style="display: none"
						class="alert alert-danger">
						<p>Error:</p>
						<span></span>
					</div>
					<div class="form-group">
						<label for="course name" class="col-md-3 control-label">Course Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="courseName"
								placeholder="Course Name">
						</div>
					</div>
					<div class="form-group">
						<label for="credit" class="col-md-3 control-label">Course Credit</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="credit"
								placeholder="Course Credit">
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
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<button id="btn-signup" type="submit"
								class="btn btn-info btn-block">
								<i class="icon-hand-right"></i> Insert new Course
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


