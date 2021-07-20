<%@page import="ecommerce.Entity.User" %>

<%
	User user=(User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","You are not logged in!!! Login first");
		response.sendRedirect("login.jsp");
		return;
	}else{
		if(user.getUserType().equals("admin")){
			session.setAttribute("message", "You are an admin!! Login First!");
			response.sendRedirect("admin.jsp");
		}
	}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Panel</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	<h1>This is normal user panel</h1>
</body>
</html>