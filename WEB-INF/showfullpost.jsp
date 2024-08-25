<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${blog.title}</title>
<link rel="icon" type="images/jpg"
	href="https://cdn.pixabay.com/photo/2016/10/10/01/49/leave-1727488_1280.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>
	<nav class="navbar-expand-lg navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="#"><img
			src="https://cdn.pixabay.com/photo/2016/10/10/01/49/leave-1727488_1280.png"
			width="50" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<%=request.getContextPath()%>/welcome">Home</a></li>
				<%
				if (session.getAttribute("loginuser") != null) {
				%>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"
					style="text-transform: capitalize;"> Hi ${loginuser.name} </a>
					<div class="dropdown-menu dropdownlink"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item"
							href="<%=request.getContextPath()%>/viewprofile/${loginuser.id}">My
							Profile</a> <a class="dropdown-item"
							href="<%=request.getContextPath()%>/userblogs/${loginuser.id}">Your
							Blogs</a> <a class="dropdown-item"
							href="<%=request.getContextPath()%>/logout">Log Out</a>
					</div></li>
				<%
				} else {
				%>
				<li class="nav-item active"><a class="nav-link" href="signup">Sign
						Up</a></li>

				<%
				}
				%>

			</ul>

		</div>
	</nav>
	<br>
	<div class="col-md-4 col-sm-6 col-xs-12 mx-auto">
					<div class="card" style="width: 30rem;height: 40rem;">
						<img class="card-img-top" src="${blog.link}" width="200px"
							height="200px" alt="Card image cap">
						<div class="card-body">
						<c:if test="${loginuser.id eq blog.userid}">
						<i>Posted By - You</i>
						</c:if>
						<c:if test="${loginuser.id ne blog.userid}">
						<i>Posted By - ${blog.postedBy}</i>
						</c:if>
									<h5 class="card-title text-capitalize text-center">${blog.title}</h5></b>
							<center>
								<span class="badge badge-info text-capitalize text-center">${blog.topic}</span>
							<p class="card-text">${blog.content}</p>
							</center>
						</div>
					</div>
							<br>
				</div>
			
				



	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>