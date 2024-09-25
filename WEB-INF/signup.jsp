<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="icon" type="images/jpg"
	href="https://cdn.pixabay.com/photo/2016/10/10/01/49/leave-1727488_1280.png" />
</head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<body>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Sign Up</div>
			<div class="card-body">
				<form action="signup" name="register" method="post">
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control"
							placeholder="Enter name" required="required" name="name">
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">Bio</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="2" placeholder="Bio" name="bio"></textarea>
					</div>
					<label>Gender</label>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio1" name="gender"
							class="custom-control-input" value="Male"> <label
							class="custom-control-label" for="customRadio1">Male</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio2" name="gender"
							class="custom-control-input" value="Female"> <label
							class="custom-control-label" for="customRadio2">Female</label>
					</div>
					<div class="form-group">
						<label>Email address</label> <input type="email"
							class="form-control" placeholder="Enter email"
							required="required" name="email">
					</div>
					<div class="form-group">
						<label>Mobile Number</label> <input type="tel"
							class="form-control" placeholder="Enter Mobile Number"
							required="required" name="mobileNum">
					</div>
					<div class="form-group">
						<label>City</label> <input type="text" class="form-control"
							placeholder="Enter city" required="required" name="city">
					</div>
					<div class="form-group">
						<label>Country</label> <input type="text" class="form-control"
							placeholder="Enter Country" required="required" name="country">
					</div>
					<div class="form-group">
						<label>Userid</label> <input type="text" class="form-control"
							placeholder="Enter Userid" required="required" name="uid">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Password" required="required"
							name="userPassword">
					</div>

					<center>
						<button type="submit" class="btn btn-primary">Sign Up</button>
						<a href="loginuser" class="btn btn-danger">Already have an
							account</a>
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