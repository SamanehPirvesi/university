
<%@page import="com.example.model.Teacher"%>
<%@page import="com.example.model.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="teacherService" class="com.example.service.TeacherService" scope="page"></jsp:useBean>
<%
	List<Teacher> teachers = teacherService.getListOfAllTeachers();
	pageContext.setAttribute("teachers", teachers);
	
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
						<h1 class="page-header">Teacher list</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">List Of teachers</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Teacher Name</th>
												<th>Teacher Surname</th>
												<th>birthday</th>
												<th>Teacher Salary</th>
												<th>Teacher Department</th>
												<th>Teacher Course</th>
												
												<th>action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="i" value="1" scope="page"></c:set>
											<c:forEach items="${teachers}" var="t">
												<tr>

													<td><c:out value="${i}" /></td>
													<td><c:out value="${t.name}" /></td>
													<td><c:out value="${t.surName}" /></td>
													<td><c:out value="${t.birthday}" /></td>
 													<td><c:out value="${t.salary}" /></td>
 													<td>
													 <button id="courselist" type="submit" onclick="submitRequest2(${t.userId},'courselist');">list of Course</button>
											         </td>
											         <td>
													 <button id="departmentlist" type="submit" onclick="submitRequest2(${t.userId},'departmentlist');">list of Department</button>
											         </td>
													<td>
													 <button id="editBtn" type="submit" class="fa fa-edit" onclick="submitRequest2(${t.userId},'edit');"></button>
													 <button type="submit" class="fa fa-trash-o" onclick="submitRequest2(${t.userId},'delete');"></button>														
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
	 
		  function submitRequest2(teacherId,action) {
			  var form = prepareForm2(teacherId,"teacherId");
			   switch(action){
			   case "delete":
				      form.action="../controller/doDeleteTeacher.jsp"
				   break;
			   case "edit":
				   form.action="./editTeacher.jsp"
				   break;
			   case "courselist":
				   form.action="./listOfCourseForTeacher.jsp"
				   break;
				 
			   case "departmentlist" :
				   form.action="./listOfDepartmentForTeacher.jsp"
				   break;
  }
			   
			    form.submit();
		   }
	  
	 function prepareForm2(inputValue_1,inputName_1){
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