
<%@page import="com.example.model.Lesson"%>
<%@page import="com.example.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="courseService"	class="com.example.service.CourseService" scope="page"></jsp:useBean>
<jsp:useBean id="lessonService"	class="com.example.service.LessonService" scope="page"></jsp:useBean>
<%
	long id = Long.parseLong(request.getParameter("lessonId"));
	List<Course> courses = (List<Course>) courseService.getListOfAllCourses();
	List<Course> listOfCoursesForLesson = (List<Course>)lessonService.getListOfCoursesForLesson(id);
	Lesson lesson =lessonService.getLessonById(id);
	request.setAttribute("lesson", lesson);
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
						<h1 class="page-header">Edit Lesson</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Change Lesson Information</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" action="../controller/doEditLesson.jsp"
											 class="form-horizontal" method="post">
											<div class="form-group">
											<label class="col-md-3 control-label">Lesson Name</label> 
											<div class="col-md-9">
											<input class="form-control"	name="lessonName" value="${lesson.lessonName}">
											</div>
											</div>
											<input type="hidden" class="form-control" name="lessonId" value="${lesson.lessonId}">
										
											<div class="form-group">
												<label  class= "col-md-3 control-label">Course selected</label>
												<div class="col-md-9">
													<select class="form-control"  name="OID">
														<option class="form-control"> select an old course</option>
														<%
															for (Course c : listOfCoursesForLesson) {
														%>
														<option class="form-control"><%=c.getCourseName()%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="course" class="col-md-3 control-label">Course select for update</label>
												<div class="col-md-9">
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
												lesson</button>
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