<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Blog</title>
<link rel="icon" type="images/jpg"
	href="https://cdn.pixabay.com/photo/2016/10/10/01/49/leave-1727488_1280.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
body {
	background-image:
		url('https://cdn.pixabay.com/photo/2014/12/15/14/38/coffee-569178_960_720.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	
	width: 100%;
	height: 100%;
	overflow-y:hidden;
}
</style>
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
							href="<%=request.getContextPath()%>/logout">Log Out <i
							class="fa-solid fa-right-from-bracket"></i></a>
					</div></li>
				<%
				} else {
				%>
				<li class="nav-item active"><a class="nav-link" href="signup">Sign
						in</a></li>

				<%
				}
				%>

			</ul>

		</div>
	</nav>
	<div class="container">
		<div class="card w-50 mx-auto my-3">
			<div class="card-header text-center">Write your Blog</div>
			<div class="card-body">
				<form action="add-blog" name="addblog" method="post">

					<input type="hidden" name="userid" value="${loginuser.id}">
					<input type="hidden" name="postedBy" value="${loginuser.name}">
					<input type="hidden" name="like" value="0">
					<div class="form-group">
						<label>Blog Title</label> <input type="text" class="form-control"
							placeholder="Enter blog title" required="required" name="title">
					</div>
					<div class="form-group">
						<label>Blog Topic</label> <input type="text" class="form-control"
							placeholder="Enter blog title" required="required" name="topic">
					</div>
					<div class="form-group">
						<label>Image Link</label> <input type="text" class="form-control"
							placeholder="Link of image" required="required" name="link">
					</div>

					<div class="form-group">
						<label>Write Your Blog Content</label>
						<textarea class="form-control" rows="8"
							placeholder="Your Content..." name="content"></textarea>
					</div>
					<button type="submit" class="btn btn-success">Publish &nbsp;<i class="fa-solid fa-upload"></i></button>
				</form>
			</div>
		</div>
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