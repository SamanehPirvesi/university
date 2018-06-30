<%@page import="com.example.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>
<%
	long id = Long.parseLong(request.getParameter("studentId"));
    Student student= studentService.getStudentById(id);
	request.setAttribute("student",student);
	
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../layout/header.jsp"></jsp:include>
<body>

	<div id="wrapper">

		<jsp:include page="../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
		<div class="container-fluid">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Edit Contact</h1>
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
										<form role="form" action="../controller/doEditStudent.jsp"
											method="post">
											<div class="form-group">
												<label>Student Name</label>
												 <input class="form-control" name="name" value="${student.surName}">
												<p>Enter the Contact Name</p>
											</div>
											<input type="hidden" class="form-control" name="studentId" value="${student.userId}">
											<div class="form-group">
												<label>DepartmentId</label> 
												<input class="form-control"type="number" name="departmentId" value="${student.department.departmentId}">
											</div>
											<div class="form-group">
												<label>CourseId</label> 
												<input class="form-control"type="number" name="courseId" value="${student.course.courseId}">
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
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

</html>