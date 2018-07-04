<%@page import="com.example.model.Department"%>
<%@page import="com.example.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>
<jsp:useBean id="courseService"	class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<%
List<Course> courses = (List<Course>) courseService.getListOfAllCourses();
List<Department> departments= departmentService.getListAllDepartments();
	long id = Long.parseLong(request.getParameter("studentId"));
    Student student= studentService.getStudentById(id);
	request.setAttribute("student",student);
	Course course=courseService.getCourseById(student.getCourse().getCourseId());
	Department department=departmentService.getDepartmentById(student.getDepartment().getDepartmentId());

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
					
						<h1 class="page-header">Edit Student</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Change Student Information</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" class="form-horizontal" action="../controller/doEditStudent.jsp"
											method="post">
											<div class="form-group">
								 				<label class="col-md-3 control-label">Student Name</label>
								 				<div class="col-md-9">
												 <input class="form-control" name="name" value="${student.surName}">
											</div>
											</div>
											<input type="hidden" class="form-control" name="studentId" value="${student.userId}">
											<div class="form-group">
						                    <label for="department" class="col-md-3 control-label">DepartmentName</label>
						                    <div class="col-md-9">
								<select class="form-control" name="departmentId">
								<option class="form-control"><%= department.getDepartmentName()%></option>
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
						                    <label for="course" class="col-md-3 control-label">CourseName</label>
						                    <div class="col-md-9">
								<select class="form-control" name="courseId">
								<option ><%= course.getCourseName()%></option>
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
												student</button>
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