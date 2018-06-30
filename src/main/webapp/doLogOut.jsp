
<%@page import="com.example.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="user" class="com.example.model.User" scope="session"></jsp:useBean>
   <jsp:useBean id="uservice" class="com.example.service.UserService" scope="page"></jsp:useBean>
 <% 
 request.getSession().invalidate(); 
 User readedUser = uservice.getUserByUserName(user.getUserName());
 readedUser.setLoggedIn(false); 
 uservice.updateUser( readedUser); 
 response.sendRedirect(request.getContextPath()+"/login.jsp"); 
 %> 