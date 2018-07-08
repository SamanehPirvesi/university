<%@page import="com.example.model.Department"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>

<%
	    List<Department> departments= departmentService.getListAllDepartments();
	pageContext.setAttribute("departments", departments);
	
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
					<div class="col-lg-9">
						<h1 class="page-header">Deaprtment list</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-9">
						<div class="panel panel-default">
							<div class="panel-heading">List Of Departments</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Department Name</th>
												<th>List of Courses</th>
												<th>list of Teachers </th>
												<th>list of Students</th>
												<th>action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="i" value="1" scope="page"></c:set>
											<c:forEach items="${departments}" var="d">
												<tr>

													<td><c:out value="${i}" /></td>
													<td><c:out value="${d.departmentName}" /></td>
													<td>
													 <button id="courselist" type="submit" onclick="submitRequest(${d.departmentId},'courselist');">list of Courses</button>
											         </td>
											         <td>
													 <button id="departmentlist" type="submit" onclick="submitRequest(${d.departmentId},'teacherlist');">list of Teachers</button>
											         </td>
											          <td>
													 <button id="departmentlist" type="submit" onclick="submitRequest(${d.departmentId},'studentlist');">list of Students</button>
											         </td>
 													<td>
													 <button id="editBtn" type="submit" class="fa fa-edit" onclick="submitRequest(${d.departmentId},'edit');"></button>
													 <button type="submit" class="fa fa-trash-o" onclick="submitRequest(${d.departmentId},'delete');"></button>														
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
	 
		  function submitRequest(departmentId,action) {
			  var form = prepareForm(departmentId,"departmentId");
			   switch(action){
			   case "delete":
				      form.action="../controller/doDeleteDepartment.jsp"
				   break;
			   case "edit":
				   form.action="./editDepartment.jsp"
				   break;
			   case "courselist":
				   form.action="./listOfCourseForDepartment.jsp"
				   break;
			   case "teacherlist":
				   form.action="./listOfTeacherForDepartment.jsp"
				   break;
	           case "studentlist":
				   form.action="./listOfStudentForDepartment.jsp"
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