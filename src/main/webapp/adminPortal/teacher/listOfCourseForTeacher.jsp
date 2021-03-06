<%@page import="com.example.model.Teacher"%>
<%@page import="com.example.model.Course"%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="teacherService"
	class="com.example.service.TeacherService" scope="page"></jsp:useBean>
<%
	long id = Long.parseLong(request.getParameter("teacherId"));
	Teacher teacher = teacherService.getTeacherById(id);
	String surname = teacher.getSurName();
	List<Course> courses = (List<Course>) teacherService.getListOfCoursesForTeacher(id);
	pageContext.setAttribute("courses", courses);
	pageContext.setAttribute("surname", surname);
	pageContext.setAttribute("teacherId", id);
	
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
						<h1 class="page-header">Course list of teacher</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">courses list Of teacher (
								${surname} )</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<form id="signupform" class="form-horizontal" role="form"
										action="../controller/deleteCourseFromCoursesListForTeacher.jsp" method="post">
										<input type="hidden" name="teacherId" value="${teacherId}" />	
										<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>#</th>
														<th>Course name</th>
														<th>action</th>
													</tr>
												</thead>
												<tbody>
												<c:set var="i" value="1" scope="page"></c:set>
													<c:forEach items="${courses}" var="c">
														<tr>

															<td><c:out value="${i}" /></td>
															<td><c:out value="${c.courseName}" /></td>
															<td>
																									
																<button type="submit" class="fa fa-trash-o"
																	value="${c.courseId}" name="courseId"></button>
															</td>

														</tr>
														<c:set var="i" value="${i + 1}" scope="page" />
													</c:forEach>
												</tbody>
											</table>
</form>
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
</body>
</html>