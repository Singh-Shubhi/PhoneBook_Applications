
<%@page import="com.entity.User"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>
<style type="text/css">

	.back-img{
		background: url("img/img1.jpg");
		width: 100%;
		height: 80vh;
		background-repeat:no-repeat;
		background-size: cover;
	}
</style>

</head>
<body>
	
	<%@include file="component/navbar.jsp" %>
	
	
	<div class="conatiner-fluid back-img text-center text-danger">
		<h1>Welcome To PhoneBook App</h1> 
	</div>
	<%@include file="component/footer.jsp" %>

</body>
</html>