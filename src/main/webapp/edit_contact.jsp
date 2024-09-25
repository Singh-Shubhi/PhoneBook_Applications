<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please.....");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center">Edit Contact Page</h1>
						<%
						
						String failedMsg = (String) session.getAttribute("failedMsg");

						
						if (failedMsg != null) {
						%>
						<p class="text-danger text-center"><%=failedMsg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						<form action="update" method="post">
							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDao dao = new ContactDao(DbConnect.getConn());
							Contact c = dao.getContactById(cid);
							%>
							<input type="hidden"  name="cid"  value="<%=cid%>">
							<div class="form-group">
								<label for="exampleInputName">Enter Name</label> <input value="<%= c.getName() %>"
									name="name" type="text" class="form-control"
									id="exampleInputName" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input value="<%= c.getEmail() %>"
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputNumber">Email Phone Number</label> <input value="<%= c.getPhonNo() %>"
									name="phonNo" type="number" class="form-control"
									id="exampleInputNumber" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<textarea rows="3" cols="" placeholder="Enter About" name="about" class="form-control"><%=c.getAbout() %></textarea>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update
									Contact</button>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 236px;">
		<%@include file="component/footer.jsp"%>
	</div>


</body>
</html>