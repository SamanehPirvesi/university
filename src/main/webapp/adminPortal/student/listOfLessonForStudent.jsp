<%@page import="com.example.model.Student"%>
<%@page import="com.example.model.Lesson"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="studentService"
	class="com.example.service.StudentService" scope="page"></jsp:useBean>
<%
	long id = Long.parseLong(request.getParameter("studentId"));
	Student studentReaded = studentService.getStudentById(id);
	String studentName = studentReaded.getSurName();
	List<Lesson> lessons = (List<Lesson>) studentService.getListOfLessonForStudent(id);
	pageContext.setAttribute("lessons", lessons);
	pageContext.setAttribute("studentName", studentName);
	pageContext.setAttribute("studentId", id);
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
						<h1 class="page-header">Lesson list of Student</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">lesson list Of Student (
								${studentName} )</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<form id="signupform" class="form-horizontal" role="form"
										action="../controller/doRemoveLessonForStudent.jsp" method="post">
										<input type="hidden" name="studentId" value="${studentId}">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>#</th>
													<th>lesson name</th>
													<th>lesson credit</th>

												</tr>
											</thead>
											<tbody>
												<c:set var="i" value="1" scope="page"></c:set>
												<c:forEach items="${lessons}" var="l">
													<tr>

														<td><c:out value="${i}" /></td>
														<td><input type="checkbox" name="lessons"
															value="${l.lessonId }">${l.lessonName }<br></td>
														<td><c:out value="${l.credit}" /></td>

													</tr>
													<c:set var="i" value="${i + 1}" scope="page" />
												</c:forEach>
											</tbody>
										</table>
										<div class="col-md-offset-3 col-md-6">
											<button id="btn-signup" type="submit"
												class="btn btn-info btn-block">
												<i class="icon-hand-right"></i> Remove lesson's
											</button>
										</div>
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