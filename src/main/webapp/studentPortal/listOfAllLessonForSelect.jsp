<%@page import="com.example.model.Lesson"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lessonService"
	class="com.example.service.LessonService" scope="page"></jsp:useBean>

<%
	List<Lesson> lessons = (List<Lesson>) lessonService.getAllLessons();
	pageContext.setAttribute("lessons", lessons);
%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../layout/header.jsp"></jsp:include>
<body>

	<div id="wrapper">

		<jsp:include page="../layout/studentSidebar.jsp"></jsp:include>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Lesson list</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Lesson list for select</div>
							<!-- /.panel-heading -->

							<div class="panel-body">
								<div class="table-responsive">
									<form id="signupform" class="form-horizontal" role="form"
										action="./controller/doRegisterLesson.jsp" method="post">

										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>Lesson name</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="i" value="1" scope="page"></c:set>
												<c:forEach items="${lessons}" var="lesson">
													<tr>
														<td><c:out value="${i}" /></td>
														<td><input type="checkbox" name="lessons"
															value="${lesson.lessonId }">${lesson.lessonName }<br>

														</td>

													</tr>
													<c:set var="i" value="${i + 1}" scope="page" />
												</c:forEach>
											</tbody>
										</table>

										<!-- Button -->
										<div class="col-md-offset-3 col-md-6">
											<button id="btn-signup" type="submit"
												class="btn btn-info btn-block">
												<i class="icon-hand-right"></i> Insert lesson's
											</button>
										</div>

									</form>
								</div>
							</div>

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
	
	<!-- /#page-wrapper -->
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>



</body>
</html>