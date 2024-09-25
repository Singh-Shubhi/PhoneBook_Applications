<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp" %>


</head>
<body>
	<%@include file="component/navbar.jsp" %>
	<%
	if(user==null){
		session.setAttribute("invalidMsg", "Login Please.....");
		response.sendRedirect("login.jsp");
	}
	%>
	
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center">Add Contact Page</h1>
						<%
						String succMsg = (String) session.getAttribute("succMsg");
						String failedMsg = (String) session.getAttribute("failedMsg");
						
						if(succMsg!= null){
						%>
						<p class="text-success text-center"><%= succMsg %></p>
						<%
						session.removeAttribute("sucssMsg");
						}
						if(failedMsg!=null){
						%>
						<p class="text-danger text-center"><%=failedMsg%></p>
						<% 
						session.removeAttribute("failedMsg");
						}
						%>
						<form action="addContact" method="post">
							<%
							if(user!=null){
							%>
								<input type="hidden" value="<%= user.getId()%>" name="userid">
							<%
							}
							%>
							<div class="form-group">
								<label for="exampleInputName">Enter Name</label> <input name="name"
									type="text" class="form-control" id="exampleInputName"
									aria-describedby="emailHelp">	
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputNumber">Email Phone Number</label> <input name="phonNo"
									type="number" class="form-control" id="exampleInputNumber"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputAbout">Enter About</label> <input name="about"
									type="text" class="form-control" id="exampleInputAbout"
									aria-describedby="emailHelp">	
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Save Contact</button>
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