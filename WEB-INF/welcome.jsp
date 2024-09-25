<%@page import="com.blog.model.User"%>
<%@page import="com.blog.model.Likes"%>
<%@page import="com.blog.model.Blog"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page isELIgnored="false"%>
<%
Blog b = new Blog();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BlogNest: Read and write stories.</title>
<link rel="icon" type="images/jpg"
	href="https://cdn.pixabay.com/photo/2016/10/10/01/49/leave-1727488_1280.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=DM+Serif+Text:ital@0;1&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Oswald:wght@200..700&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap"
	rel="stylesheet">
</head>
<style>
body {
	overflow-x: hidden;
}

.isDisabled {
	pointer-events: none;
}

.content {
	background-image:
		url('https://cdn.pixabay.com/photo/2014/06/19/21/36/blog-372771_960_720.jpg');
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	background-color: white;
	opacity: 0.93;
}

h1 {
	font-family: "Abril Fatface", serif;
	font-weight: 400;
	font-style: normal;
	padding-top: 10px;
}

h5 {
	color: black;
}

a:hover {
	color: black;
	text-decoration: none;
}

p {
	color: black;
}

footer {
	color: white;
}

.view {
	color: black;
}

.view:hover {
	color: black;
	text-decoration: underline;
}

a {
	color: #0e59ed;
}

.readmore:hover {
	color: blue;
	text-decoration: underline;
}

.card-text a {
	color: black;
}
</style>
<body>
	<nav class="navbar-expand-lg navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/welcome"><img
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
			<%
			if (session.getAttribute("loginuser") != null) {
			%>
			<form class="form-inline my-2 my-lg-0" action="search" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search blog" aria-label="Search" name="searchtext"
					required="required">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<%
			}
			%>
		</div>
	</nav>
	<div class="content">
		<div class="container">

			<h1 class="text-center">Welcome To BlogNest</h1>
			<br>
			<p class="text-center">It's a Blogging web application for
				businesses, authors, and readers to connect through blogging. It's a
				space where creativity thrives and knowledge is shared, all while
				maintaining a user-friendly and secure environment. With features
				like content drafting, collaboration, and version control, we're
				making it easier than ever for authors to bring their ideas to life.</p>
			<br>
			<center>
				<a href="add-blog" class="btn btn-primary">Create Your blog</a>
			</center>
			<br>
		</div>
	</div>
	<br>
	<%
	if (session.getAttribute("loginuser") == null) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<figure class="figure">
					<img
						src="https://cdn.pixabay.com/photo/2021/11/21/06/28/quality-6813293_1280.jpg"
						class="figure-img img-fluid rounded"
						alt="A generic square placeholder image with rounded corners in a figure."
						width="500px">
					<figcaption class="figure-caption text-center">A
						Delivering high-quality, insightful content you can trust.</figcaption>
				</figure>
			</div>
			<div class="col-md-6">
				<figure class="figure">
					<img
						src="https://cdn.pixabay.com/photo/2017/03/09/09/15/learn-2128978_1280.jpg"
						class="figure-img img-fluid rounded"
						alt="A generic square placeholder image with rounded corners in a figure."
						width="500px">
					<figcaption class="figure-caption text-center">A
						Fueling your growth with top-notch, actionable content</figcaption>
				</figure>
			</div>

		</div>
	</div>
	<%
	}
	%>
	<div class="container mx-auto">
		<div class="row">
			<c:forEach var='b' items='${blogs}'>
				<div class="card-group">
					<div class="col-md-4 col-sm-6 col-xs-12 mx-auto">
						<div class="card" style="width: 25rem";>
							<img class="card-img-top" src="${b.link}" width="200px"
								height="200px" alt="Card image cap">
							<div class="card-body">
								<c:if test="${loginuser.id eq b.userid}">
									<i>Posted By - You</i>
								</c:if>
								<c:if test="${loginuser.id ne b.userid}">
									<i>Posted By -<a
										href="<%=request.getContextPath()%>/userblogs/${b.userid}"
										class="view">${b.postedBy}</i>
									</a>
								</c:if>
								<a href="<%=request.getContextPath()%>/readmore/${b.blogid}"
									class="link">
									<h5 class="card-title text-capitalize text-center">${b.title}</h5>
								</a>
								<center>
									<span class="badge badge-info text-capitalize text-center">${b.topic}</span>
								</center>
								<a href="<%=request.getContextPath()%>/readmore/${b.blogid}"
									class="link"> <c:choose>


										<c:when test="${fn:length(b.content)>100}">

											<p class="card-text">${fn:substring(b.content,0,150)}...<a
													href="<%=request.getContextPath()%>/readmore/${b.blogid}"
													style="color: blue" class="readmore">Read More</a>
											</p>
										</c:when>
										<c:otherwise>
											<p class="card-text readmore">${b.content}</p>
										</c:otherwise>
									</c:choose>
								</a>

								<c:if test="${b.userid ne loginuser.id}">
									<a href="<%=request.getContextPath()%>/like/${b.blogid}"><i
										class="fa-solid fa-thumbs-up"></i></a>&nbsp;${b.likes}
								</c:if>
								<c:if test="${b.userid eq loginuser.id}">
									<a href="" class="isDisabled"><i
										class="fa-solid fa-thumbs-up"></i></a>&nbsp;${b.likes}
								</c:if>
							
							</div>
						</div>
						<br>

					</div>

				</div>
			</c:forEach>

		</div>


	</div>
	<footer class="bg-light text-center text-lg-start ">
		<!-- Copyright -->
		<div class="text-center p-3 bg-dark">&copy; 2024 Copyright:
			developed by - Pratyush Nishchal</div>
		<!-- Copyright -->
	</footer>

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