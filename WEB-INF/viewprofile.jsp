<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
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
.card-img-top{
width: 250px;
padding-top: 15px;
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
		<div class="card mx-auto mt-2 text-center" style="width: 25rem;">
			<c:choose>
				<c:when test="${loginuser.gender=='Female'}">
				<center>
					<img class="card-img-top"
						src="https://st2.depositphotos.com/47577860/47713/v/450/depositphotos_477139938-stock-illustration-employee-female-lady-icon-filled.jpg"
						alt="female">
						</center>
				</c:when>
				<c:otherwise>
				<center>
					<img class="card-img-top"
						src="https://www.svgrepo.com/show/384674/account-avatar-profile-user-11.svg"
						alt="male">
						</center>
				</c:otherwise>
			</c:choose>
			<div class="card-body">
				<h5 class="card-title">Personal Details</h5>
				<div class="card-text">
					<h5>Name: ${loginuser.name}</h5>
					<h5><i class="fa-solid fa-phone"></i> ${loginuser.mobileNum}</h5>
					<h5><i class="fa-solid fa-city"></i> ${loginuser.city}</h5>
					<h5>Gender: ${loginuser.gender}</h5>
					<h5><i class="fa-regular fa-envelope"></i> ${loginuser.email}</h5>
					<h5><i class="fa-solid fa-lock"></i> ${loginuser.userPassword}</h5>
				</div>
				<a href="<%=request.getContextPath()%>/update-profile"
					class="btn btn-primary">Update Profile</a>
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