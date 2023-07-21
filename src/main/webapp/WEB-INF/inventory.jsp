<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventory page</title>
<link rel="stylesheet" type="text/css" href="css/inventoryStyle.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet">
</head>
 <body>
    <div class="d-flex">
		<div class="sidebar">
			<nav class="nav flex-column bg-body-tertiary ">
		    		<div class="collapse navbar-collapse d-flex justify-content-start" id="navbarNav">
		    			<ul class="navbar-nav menu">
		    				<li class="nav-item">
		    					<a class="nav-link" href="/mainpage"  style="color:white; margin-left: 14px;
								margin-top: 10px;">Dashboard</a>
							</li>

		        			<li class="nav-item nav_click">
								<div class="nav_button">
									<a href="/inventory" class="nav-link" style="color:white; margin-left: 14px;
									margin-top: 10px;">Inventory</a>
								</div>
							</li>
							
		        			<li class="nav-item">
		          				<a class="nav-link" href="#" style="color:white; margin-left: 14px;
								  margin-top: 10px;">Sales</a>
		        			</li>
		        			<li class="nav-item">
		          				<a class="nav-link" href="#" style="color:white; margin-left: 14px;
								  margin-top: 10px;">Purchases</a>
		        			</li>
		        			<li class="nav-item" style="margin-top:50px;">
		        				<a class="nav-link" href="/logout" style="color:white; margin-left: 14px;
								margin-top: 10px;">Logout</a>
		        			</li>
		      			</ul>		
		      		</div>
		  	</nav>
		</div>
		<main>
			<div style="background-color:#cdcccc;">
				<nav class="navbar navbar-expand-lg bg-body-tertiary " style="border-bottom: 1px solid #dde5e8;">
					<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
						<ul class="navbar-nav menu2">
						<li class="nav-item">
							<a class="nav-link" href="#" style="color:black; margin-right: 40px;">Perfil</a>
						</li>
						<li class="nav-item">
							<div class="nav-button">
								<a href="#" class="nav-link" style="color:black; margin-right: 40px;">Help</a>
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#" style="color:black; margin-right: 40px;">Account</a>
						</li>
						</ul>						
					</div>
				</nav>
			</div>
			<div class="inventory">
				
					
				<div class="inventory-section">
					<div class="d-flex justify-content-between align-items-end sub-inventory-section">
						<div style="padding: 20px;" class="sub_title">
							<h1 >Inventory</h1>
							<h3>All items</h3>
						</div>
						<button class="btn btn-primary" style="margin-right: 40px;">
							<a style="color: white;" href="/new-product">New +</a>
						</button>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Name</th>
								<th>Product number</th>
								<th>Amount</th>
								<th>User</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="users">
								<tr>
									<c:if test="${not empty users.manager.numProduct}">
										<td>
											${users.manager.product}
										</td>
										<td>
											${users.manager.numProduct}
										</td>
										<td>
											${users.manager.quantity}
										</td>
										<td>
											${users.name} ${users.numUser}
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</main>
	</div>
 </body>
</html>