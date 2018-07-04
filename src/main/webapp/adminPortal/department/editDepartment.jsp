<%@page import="com.example.model.Department"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<%
	long id = Long.parseLong(request.getParameter("departmentId"));
    Department deparatment= departmentService.getDepartmentById(id);
	request.setAttribute("department",deparatment);
	

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
					<div class="col-lg-9">
					
						<h1 class="page-header">Edit Department</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-9">
						<div class="panel panel-default">
							<div class="panel-heading">Change Department Information</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-11">
										<form role="form" class="form-horizontal" action="../controller/doEditDepartment.jsp"
											method="post">
											<div class="form-group">
								 				<label class="col-md-3 control-label">Department Name</label>
								 				<div class="col-md-8">
												 <input class="form-control" name="name" value="${department.departmentName}">
											</div>
											</div>
											<input type="hidden" class="form-control" name="departmentId" value="${department.departmentId}">
											
											
											<button type="submit" class="btn btn-default">Update
												Department</button>
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