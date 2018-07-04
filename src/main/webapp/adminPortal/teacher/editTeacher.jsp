
<%@page import="com.example.model.Department"%>
<%@page import="com.example.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Teacher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService"	class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService" class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>
<%
	long id = Long.parseLong(request.getParameter("teacherId"));
	List<Course> courses = (List<Course>) courseService.getListOfAllCourses();
	List<Department> departments = (List<Department>) departmentService.getListAllDepartments();
	List<Course> listOfCoursesForTeacher = (List<Course>) teacherService.getListOfCoursesForTeacher(id);
	List<Department> listOfDepartmentForTeacher = (List<Department>) teacherService.getListOfDepartmentForTeacher(id);
	Teacher teacher = teacherService.getTeacherById(id);
	request.setAttribute("teacher", teacher);
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
						<h1 class="page-header">Edit Teacher</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Change Teacher Information</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" action="../controller/doEditTeacher.jsp"
											 class="form-horizontal" method="post">
											<div class="form-group">
												<label>Teacher SurName</label> <input class="form-control"
													name="name" value="${teacher.surName}">
											</div>
											<input type="hidden" class="form-control" name="teacherId"
												value="${teacher.userId}">
											<div class="form-group">
												<label>Teacher Salary</label> <input class="form-control"
													name="salary" value="${teacher.salary}">
											</div>
											
											<div class="form-group">
												<label for="department" class="col-md-5 control-label">Department Selected</label>
												<div class="col-md-7">
													<select class="form-control" name="olddepartmentId">
														<option>select an old department</option>
														<%
															for (Department d : listOfDepartmentForTeacher) {
														%>
														<option ><%=d.getDepartmentName()%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="department" class="col-md-6 control-label">Department select for update</label>
												<div class="col-md-6">
													<select class="form-control" name="departmentId">
														<option>select a new department</option>
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
												<label for="course" class="col-md-5 control-label">Course selected</label>
												<div class="col-md-7">
													<select class="form-control" name="oldcourseId">
														<option> select an old course</option>
														<%
															for (Course c : listOfCoursesForTeacher) {
														%>
														<option><%=c.getCourseName()%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="course" class="col-md-5 control-label">Course select for update</label>
												<div class="col-md-7">
													<select class="form-control" name="courseId">
														<option>select a new course</option>
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
											<button type="submit" class="btn btn-default">Update
												Teacher</button>
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