
<%@page import="com.example.model.User"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.utility.PasswordCodification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="user" class="com.example.model.User" scope="session"></jsp:useBean>
<jsp:useBean id="uservice" class="com.example.service.UserService" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="user" />
 <% 
User readedUser = uservice.getUserByUserName(user.getUserName());
Set<String> errors=new HashSet<String>(); 

if (readedUser != null && user.getPassword()!=null&& readedUser.getPassword().equals(PasswordCodification.codificatePass(user.getPassword()))) { 
readedUser.setLoggedIn(true); 
user.setLoggedIn(true); 
uservice.updateUser( readedUser);
uservice.fillUserBean(readedUser,user);	
String type=user.getType();
switch (type){
case "admin" : 
	response.sendRedirect("./userPortal/adminHome.jsp");
	break;
case "student" :
	response.sendRedirect("./userPortal/studentHome.jsp");
	break;
case"teacher" :
	response.sendRedirect("./userPortal/teacherHome.jsp");
	break;
}
 
} else {
String error="Username or password are not correct "; 
request.setAttribute("error",error); 
	
%>
<jsp:forward page="./login.jsp"></jsp:forward>
<%
 } 
 %> 