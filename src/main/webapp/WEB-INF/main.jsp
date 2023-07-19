<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
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
		    					<a class="nav-link" href="#"  style="color:white;">Dashboard</a>
							</li>

		        			<li class="nav-item nav_click">
								<div class="nav_button">
									<a href="#" class="nav-link" style="color:white;">Inventory</a>
									<img src="assets/arrow.svg" class="list__arrow">
								</div>
								<ul class="nav_list">
									<li class="nav_list-inside">
										<a class="nav-link nav_link-inside" href="#" style="color:white;">estoy dentro</a>
									</li>
									
								</ul>
							</li>
							
		        			<li class="nav-item">
		          				<a class="nav-link" href="#" style="color:white;">Sales</a>
		        			</li>
		        			<li class="nav-item">
		          				<a class="nav-link" href="#" style="color:white;">Purchases</a>
		        			</li>
		        			<li class="nav-item" style="margin-top:50px;">
		        				<a class="nav-link" href="#" style="color:white;">Logout</a>
		        			</li>
		      			</ul>		
		      		</div>
		  	</nav>
		</div>
	<!--
			<nav>
				<ul class="lista">
					<li class="lista_item">
						<div class="lista_button">
							<a href="#" class="nav_link">Dashboard</a>
						</div>
					</li>
					<li class="lista_item list_button-click">
						<a href="#" class="nav_link">Inventory</a>
						<img src="assets/arrow.svg" class="lista__arrow">
					</li>
					<ul class="lista_show">
						<li class="lista_inside">
							<a href="#" class="nav_link nav_link-inside" >Estoy dentro</a>
						</li>
						
					</ul>
					<li class="lista_button">
						<div class="lista_button">
							<a href="#" class="nav_link">Sales</a>
						</div>
					</li>
				</ul>
			</nav>
-->
		<main>
			<div style="background-color:#cdcccc;">
				<nav class="navbar navbar-expand-lg bg-body-tertiary " style="border-bottom: 1px solid #dde5e8;">
					<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
						<ul class="navbar-nav menu2">
						<li class="nav-item">
							<a class="nav-link" href="#" style="color:black;">Perfil</a>
						</li>
						<li class="nav-item">
							<div class="nav-button">
								<a href="#" class="nav-link" style="color:black;">Help</a>
							</div>
							<ul class="nav-list">
								<li class="nav-list-inside">
									<a href="#" class="nav-link nav-link-inside">estoy dentro</a>
								</li>
							</ul>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#" style="color:black;">Account</a>
						</li>
						</ul>						
					</div>
				</nav>
			</div>
			<div class="dashboard">
				
				<h1 style="padding: 20px;">Dashboard</h1>
				<div class="row dashboard_section-special">
					<div class="col-lg-8 col-md-8 col-sm-8 col-8 sales_info">
						<h2 style="font-family: 'Ubuntu', sans-serif; font-size: x-large;">Sales activity</h2>
								<div class="info text-center">
									<h3>100</h3>
									<p>To be packed</p>
								</div>
								<div class="info text-center">
									<h3>20</h3>
									<p>To be shipped</p>
								</div>
								<div class="info text-center">
									<h3>23</h3>
									<p>To be delivered</p>
								</div>
								<div class="info text-center">
									<h3>87</h3>
									<p>To be invoiced</p>
								</div>
					</div>
						<div class=" col-lg-4 col-md-4 col-sm-4 col-4 inventory">
						<!--<h2 style="font-family: 'Ubuntu', sans-serif; font-size: 25px;
						position: absolute; top: 171px;">Inventory summary</h2>-->
						<h2>Inventory summary</h2>
							<div class="quantity">
								<label class="text-void">Quantity in hand</label>
								<a>
									<label class="qty">${totalAmount}</label>
								</a>
							</div>
							<div class="quantity">
								<label class="text-void">Quantity to be received</label>
								<label class="qty">123</label>
							</div>
						</div>
				</div>
					<div class="row dashboard_section">
						<div class="col-lg-6 col-md-6 col-sm-6 col-6 sales">
							<div class="sub_square">
								<div class="tittle">
									<label class="">PRODUCT DETAILS</label>
								</div>
								<div class="item text-void" style="color: #d50000;">
									<label>Low stock items</label>
									<a href="#" class="qty_item">
										<label>10</label>
									</a>
								</div>
								<div class="item text-void">
									<label>All items</label>
									<c:if test="${totalProducts==null}">
										<a href="#" class="qty_item">
											<label>0</label>
										</a>
									</c:if>
									<a href="#" class="qty_item">
										<label>${totalProducts}</label>
									</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-6 sells">
							<div class="sub_square">
								<div class="tittle">
									<label class="">TOP SELLING ITEMS</label>
								</div>
								<div class="item">
									<label>No items yet</label>
								</div>
							</div>
						</div>
					</div>
					<div class="row dashboard_section" style="margin-top: 30px;">
						<div class="col-lg-4 col-md-4 col-sm-4 col-4 purchase_order">
							<div class="sub_square">
								<div class="tittle">
									<label >PURCHASE ORDER</label>
								</div>
								<div class="po-field text-center">
									<label class="text void" style="font-size: 14px;">Quatity Ordered</label>
									<p style="font-size: 24px;">400.000</p>
								</div>
								<div class="po-field text-center">
									<label class="text void" style="font-size: 14px;">Total cost</label>
									<p style="font-size: 24px;">$777,777</p>
								</div>
							</div>
						</div>
						<div class=" col-lg-8 col-md-8 col-sm-8 col-8 sales_order">
							<div class="sub_square">	
								<div class="tittle">SALES ORDER</div>	
								<table class="table table-borderless">
									<thead>
										<tr>
											<th>User</th>
											<th>Product</th>
											<th>Product number</th>
											<th>Amount</th>
											<th>User number</th>
											<!--<th>Date</th>
											<th>Confirmed</th>-->
											<th>Position</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userList}" var="users">
											<tr>
												<c:if test="${not empty users.manager.numProduct}">
													<td>${users.name}</td>
													<td>${users.manager.product}</td>
													<td>${users.manager.numProduct}</td>
													<td>${users.manager.quantity}</td>
													<td>${users.manager.numProduct}</td>
													<c:if test="${users.userType==2}">
														<td>Manipulador</td>
													</c:if>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				<div class="summary">

				</div>
				
			</div>
		</main>
	</div>
</body>
</html>