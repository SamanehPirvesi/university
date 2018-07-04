

<%@page import="com.example.model.Course"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService" class="com.example.service.CourseService" scope="page"></jsp:useBean>
<%
	List<Course> course = courseService.getListOfAllCourses();
	pageContext.setAttribute("course", course);
	
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
						<h1 class="page-header">Course list</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">List Of Courses</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Course Name</th>
												<th>Course Credit</th>
												<th>Course Department</th>
												<th>action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="i" value="1" scope="page"></c:set>
											<c:forEach items="${course}" var="c">
												<tr>

													<td><c:out value="${i}" /></td>
													<td><c:out value="${c.courseName}" /></td>
													<td><c:out value="${c.credit}" /></td>
													
													<td><c:out value="${c.department.departmentId}" /></td>
													<td>
													 <button id="editBtn" type="submit" class="fa fa-edit" onclick="submitRequest(${c.courseId},'edit');"></button>
													 <button type="submit" class="fa fa-trash-o" onclick="submitRequest(${c.courseId},'delete');"></button>														
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
	 
		  function submitRequest(courseId,action) {
			  var form = prepareForm(courseId,"courseId");
			   switch(action){
			   case "delete":
				      form.action="../controller/doDeleteCourse.jsp"
				   break;
			   case "edit":
				   form.action="./editCourse.jsp"
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