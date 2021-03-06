<%@page import="com.example.model.Course"%>
<%@page import="com.example.model.Department"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<%
long id = Long.parseLong(request.getParameter("departmentId"));
Department department=departmentService.getDepartmentById(id);
String departmentName=department.getDepartmentName();
List<Course> courses = (List<Course>) departmentService.getListOfCourseForDepartment(id);
	pageContext.setAttribute("courses",courses);
	pageContext.setAttribute("departmentName",departmentName);
	
%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../layout/header.jsp"></jsp:include>
<body>

	<div id="wrapper">

		<jsp:include page="../../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Courses list of Department </h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Courses list Of Department (  ${departmentName} )</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>course name</th>
									</tr>
										</thead>
										<tbody>
											<c:set var="i" value="1" scope="page"></c:set>
											<c:forEach items="${courses}" var="c">
												<tr>

													<td><c:out value="${i}" /></td>
													<td><c:out value="${c.courseName}" /></td>
																									 
												</tr>
												<c:set var="i" value="${i + 1}" scope="page" />
											</c:forEach>
										</tbody>
									</table>

								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
	<script type="text/javascript">
	 
		  
</body>
</html>