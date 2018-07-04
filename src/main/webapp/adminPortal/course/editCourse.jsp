<%@page import="com.example.model.Department"%>
<%@page import="com.example.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService"
	class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService"
	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<%
	List<Department> departments = departmentService.getListAllDepartments();
	long id = Long.parseLong(request.getParameter("courseId"));
	Course course = courseService.getCourseById(id);
	request.setAttribute("course", course);
	Department department = departmentService.getDepartmentById(course.getDepartment().getDepartmentId());
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../layout/header.jsp"></jsp:include>
<body>

	<div id="wrapper">

		<jsp:include page="../../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
		<div class="container-fluid">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">

						<h1 class="page-header">Edit Course</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Change Course Information</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" class="form-horizontal"
											action="../controller/doEditCourse.jsp" method="post">
											<div class="form-group">
												<label class="col-md-3 control-label">Course Name</label>
												<div class="col-md-9">
													<input class="form-control" name="coursename"
														value="${course.courseName}">
												</div>
											</div>
											<input type="hidden" class="form-control" name="courseId"
												value="${course.courseId}">
											<div class="form-group">
												<label for="department" class="col-md-3 control-label">DepartmentName</label>
												<div class="col-md-9">
													<select class="form-control" name="departmentId">
														<option class="form-control"><%=department.getDepartmentName()%></option>
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
											<button type="submit" class="btn btn-default">Update
												Course</button>
											<button type="reset" class="btn btn-default">Reset
												page</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>

</html>