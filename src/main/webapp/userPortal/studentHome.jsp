<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="user" class="com.example.model.User" scope="session"></jsp:useBean>
    
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../layout/header.jsp"></jsp:include>
<body>
<div id="wrapper">
<jsp:include page="../layout/studentSidebar.jsp"></jsp:include>
<!-- Page Content -->
<div id="page-wrapper">
<div class="container-fluid">
welcome ${user.userName}
</div>
<!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
    