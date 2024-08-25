<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile</title>
<link rel="icon" type="images/jpg"
	href="https://cdn.pixabay.com/photo/2016/10/10/01/49/leave-1727488_1280.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Update Profile</div>
			<div class="card-body">
				<form action="update-profile" name="update-user-profile"
					method="post">
					<input type="hidden" name="id" value="${loginuser.id}">
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							placeholder="Enter name" required="required" name="name"
							value="${loginuser.name}">
					</div>
					<div class="form-group">
						<label>Gender</label> <input type="text" name="gender"
							class="form-control" value="${loginuser.gender}" readonly>
					</div>

					<div class="form-group">
						<label>Email address</label> <input type="email"
							class="form-control" placeholder="Enter email"
							required="required" name="email" value="${loginuser.email}">
					</div>
					<div class="form-group">
						<label>Mobile Number</label> <input type="tel"
							class="form-control" placeholder="Enter Mobile Number"
							required="required" name="mobileNum"
							value="${loginuser.mobileNum}">
					</div>
					<div class="form-group">
						<label>City</label> <input type="text" class="form-control"
							placeholder="Enter city" required="required" name="city"
							value="${loginuser.city}">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Password" required="required"
							name="userPassword" value="${loginuser.userPassword}">
					</div>

					<center>
						<button type="submit" class="btn btn-primary">Update</button>
					</center>
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