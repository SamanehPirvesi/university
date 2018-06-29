
<%@page import="com.example.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="user" class="com.example.model.User" scope="session"></jsp:useBean>
    <jsp:useBean id="udao" class="com.example.dao.UserDao" scope="page"></jsp:useBean>
<%-- <% --%>
<!-- // request.getSession().invalidate(); -->
<!-- // User readedUser = udao.getUserByUserName(user.getUsername()); -->
<!-- // readedUser.setLoggedIn(false); -->
<!-- // udao.updateUser( readedUser); -->
<!-- // response.sendRedirect(request.getContextPath()+"/login.jsp"); -->
<%-- %> --%>