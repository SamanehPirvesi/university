<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Set<String> errors =(Set<String>)request.getAttribute("errors");
pageContext.setAttribute("errors",errors);
%>
<!DOCTYPE html >
<html>
<jsp:include page="../../layout/header.jsp"></jsp:include>
<body>
<jsp:include page="../../layout/adminSidebar.jsp"></jsp:include>
		<!-- Page Content -->
				<div class="container">
	<div id="signupbox" style="margin-top: 50px"
		class="mainbox col-md-8 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">add new Department</div>
				</div>
			<div class="panel-body">
			<c:if test="${errors.size() > 0}">
			  <ul>
			  <c:forEach   items="${errors}"   var="err" >
			       <li class="alert-danger"> <c:out value="${err}"/><p>  </li>   
			  </c:forEach> 
			  </ul>
			</c:if>
				<form id="signupform" class="form-horizontal" role="form"
					action="../controller/doRegisterDepartment.jsp" method="post">
					<div id="signupalert" style="display: none"
						class="alert alert-danger">
						<p>Error:</p>
						<span></span>
					</div>
					<div class="form-group">
						<label for="departmentname" class="col-md-3 control-label">Department Name</label>
						<div class="col-md-6">
							<input type="text" class="form-control" name="departmentName"
								placeholder="Department Name">
						</div>
						</div>
						<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-4 col-md-5">
								
							<button id="btn-signup" type="submit"
								class="btn btn-info btn-block">
								<i class="icon-hand-right"></i> Insert new Department
							</button>
						</div>
					</div>
				
				</form>
			</div>
		</div>
	</div>
	</div>
<jsp:include page="../../layout/footer.jsp"></jsp:include>
</body>
</html>

