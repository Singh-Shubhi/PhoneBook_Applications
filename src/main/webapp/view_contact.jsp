<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
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
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please.....");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String succMsg = (String) session.getAttribute("succMsg");
	String failedMsg = (String) session.getAttribute("failedMsg");
	if (succMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=succMsg%></div>
	<%
	session.removeAttribute("succMsg");
	}
	if (failedMsg != null) {
	%>
	<p class="text-danger text-center"><%=failedMsg%></p>
	<%
	session.removeAttribute("failedMsg");
	}
	%>

	

	<div class="container">
		<div class="row p-4">

			<%
			if (user != null) {
				ContactDao dao = new ContactDao(DbConnect.getConn());
				List<Contact> contact = dao.getAllContact(user.getId());

				for (Contact c : contact) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body">
						<h3>
							Name:
							<%=c.getName()%></h3>
						<p>
							Phone No:
							<%=c.getPhonNo()%></p>
						<p>
							Email:
							<%=c.getEmail()%></p>
						<p>
							About:
							<%=c.getAbout()%></p>
						<div class="text-center">
							<a href="edit_contact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>

				</div>
			</div>
			<%
			}
			}
			%>


		</div>
	</div>
	<div style="margin-top: 236px;">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>