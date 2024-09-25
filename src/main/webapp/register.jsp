<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color:#999ca1;">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center">Registration Form</h1>
						<%
						String sucssMsg = (String) session.getAttribute("sucssMsg");
						String errorMsg = (String) session.getAttribute("errorMsg");
						
						if(sucssMsg!= null){
						%>
						<p class="text-success text-center"><%= sucssMsg %></p>
						<%
						session.removeAttribute("sucssMsg");
						}
						if(errorMsg!=null){
						%>
						<p class="text-danger text-center"><%=errorMsg %></p>
						<% 
						session.removeAttribute("errorMsg");
						}
						%>
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									type="text" class="form-control" id="exampleInputName" name="name"
									aria-describedby="emailHelp">	
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1" name="email"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="password"
									>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top:150px;">
	<%@include file="component/footer.jsp" %>
</div>
</body>
</html>