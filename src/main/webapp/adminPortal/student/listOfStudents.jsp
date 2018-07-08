<%@page import="com.example.model.Department"%>
<%@page import="com.example.model.Student"%>
<%@page import="com.example.model.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:useBean id="studentService" class="com.example.service.StudentService" scope="page"></jsp:useBean>
<%
	List<Student> students = studentService.getListOfAllStudents();
    List<Department> departments= departmentService.getListAllDepartments();
	pageContext.setAttribute("students", students);
	
%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../layout//header.jsp"></jsp:include>
<body>

	<div id="wrapper">

		<jsp:include page="../../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Student list</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">List Of Students</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Student Name</th>
												<th>Student Surname</th>
												<th>BirthDay</th>
												<th>Student Department</th>
												<th>Student Course</th>
												<th>action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="i" value="1" scope="page"></c:set>
											<c:forEach items="${students}" var="u">
												<tr>

													<td><c:out value="${i}" /></td>
													<td><c:out value="${u.name}" /></td>
													<td><c:out value="${u.surName}" /></td>
													<td><c:out value="${u.birthday}"/></td>
												
											    	<td><c:out value="${u.department.departmentName}" /></td>
											    	
 													<td><c:out value="${u.course.courseName}" /></td>
 													<td>
													 <button id="editBtn" type="submit" class="fa fa-edit" onclick="submitRequest(${u.userId},'edit');"></button>
													 <button type="submit" class="fa fa-trash-o" onclick="submitRequest(${u.userId},'delete');"></button>														
													</td>
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
	 
		  function submitRequest(studentId,action) {
			  var form = prepareForm(studentId,"studentId");
			   switch(action){
			   case "delete":
				      form.action="../controller/doDeleteStudent.jsp"
				   break;
			   case "edit":
				   form.action="./editStudent.jsp"
				   break;
			   }
			    form.submit();
		   }
	  
	 function prepareForm(inputValue_1,inputName_1){
		 var form = document.createElement("form");
		    var element1 = document.createElement("input"); 
		    form.method = "POST";
		    element1.value=inputValue_1;
		    element1.name=inputName_1;
		    form.appendChild(element1);
		    document.body.appendChild(form);
             return form;
	  }
	</script>
</body>
</html>