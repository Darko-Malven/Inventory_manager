<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="d-flex grid gap-4 square"> 
			<div class="g-col-6 p-4 register">
				<h1>Create a new user</h1>
				<form:form action="/create" method="post" modelAttribute="newUser">
					<div>
						<form:label path="name" class="mt-2">Name</form:label>
						<form:input path="name" class="form-control"/>
						<form:errors path="name" class="text-danger"/>
					</div>
					<div>
						<form:label path="password" class="mt-2">Password</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					<div>
						<form:label path="confirm" class="mt-2">Confirm</form:label>
						<form:password path="confirm" class="form-control"/>
						<form:errors path="confirm" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-primary mt-3" value="Create">
				</form:form>
				</div>
				<div class="g-col-6 p-4 login ">
				<h2 class="negrita header">Login</h2>
				<p class="text-danger">${error_login}</p>
					<form action="/login" method="post">
						<div>
							<label class="mt-3">User ID</label>
							<input type="text" class="form-control" name="userNum"/>
						</div>
						
						<div>
							<label class="mt-3">Contraseña</label>
							<input type="password" class="form-control" name="password"/>
						</div>
						<input type="submit" class="btn btn-primary mt-3" value="Ingresar">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>