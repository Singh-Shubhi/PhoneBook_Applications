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
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center">Login Page</h1>
						<%
						String invalidMsg = (String) session.getAttribute("invalidMsg");
						if(invalidMsg != null){
						%>
							<p class="text-danger text-center"><%=invalidMsg %></p>
						<%
						session.removeAttribute("invalidMsg");
						}
						%>
						
						<%
						String logMsg = (String) session.getAttribute("logMsg");
						if(logMsg != null){
						%>
							<p class="text-success text-center"><%=logMsg %></p>
						<%
						session.removeAttribute("logMsg");
						}
						%>
						<form action="login" method="post">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1" name="email"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1" 
									>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top:236px;">
	<%@include file="component/footer.jsp" %>
</div>
</body>
</html>