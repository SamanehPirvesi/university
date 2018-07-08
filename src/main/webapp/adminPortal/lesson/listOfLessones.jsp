<%@page import="com.example.model.Lesson"%>
<%@page import="com.example.model.Department"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="departmentService"	class="com.example.service.DepartmentService" scope="page"></jsp:useBean>
<jsp:useBean id="lessonService" class="com.example.service.LessonService" scope="page"></jsp:useBean>
<%
	List<Lesson> lessons = lessonService.getAllLessons();
    List<Department> departments= departmentService.getListAllDepartments();
	pageContext.setAttribute("lessons", lessons);
	
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
						<h1 class="page-header">lesson list</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">List Of Lessons</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">

									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>Lesson Name</th>
												<th>Lesson Credit</th>
												<th> list of course</th>
												<th>action</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="i" value="1" scope="page"></c:set>
											<c:forEach items="${lessons}" var="l">
												<tr>

													<td><c:out value="${i}" /></td>
													<td><c:out value="${l.lessonName}" /></td>
													<td><c:out value="${l.credit}" /></td>
													<td>
													 <button id="courselist" type="submit" onclick="submitRequest(${l.lessonId},'courselist');">list of Course</button>
											         </td>
													<td>
													 <button id="editBtn" type="submit" class="fa fa-edit" onclick="submitRequest(${l.lessonId},'edit');"></button>
													 <button type="submit" class="fa fa-trash-o" onclick="submitRequest(${l.lessonId},'delete');"></button>														
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
	 
		  function submitRequest(lessonId,action) {
			  var form = prepareForm(lessonId,"lessonId");
			   switch(action){
			   case "delete":
				      form.action="../controller/doDeleteLesson.jsp"
				   break;
			   case "edit":
				   form.action="./editLesson.jsp"
				   break;
			   case "courselist":
				   form.action="./listOfCourseForLesson.jsp"
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