<%-- <%@page import="ecommerce.Entity.User" %>

<%
	User user=(User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message","You are not logged in!!! Login first");
		response.sendRedirect("login.jsp");
		return;
	}else{
		if(user.getUserType().equals("normal")){
			session.setAttribute("message", "You are not an admin!! Login First!");
			response.sendRedirect("login.jsp");
		}
	}
%> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	<div class="container admin">
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px;" class="img-fluid rounded-circle" alt="user_image" src="img/man.png">
						</div>
						<h1></h1>
						<h2 class="text-uppercase text-muted">Users</h2>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px;" class="img-fluid rounded-circle" alt="user_image" src="img/menu.png">
						</div>
						<h1></h1>
						<h2 class="text-uppercase text-muted">Categories</h2>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px;" class="img-fluid rounded-circle" alt="user_image" src="img/delivery-box.png">
						</div>
						<h1></h1>
						<h2 class="text-uppercase text-muted">Products</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px;" class="img-fluid rounded-circle" alt="user_image" src="img/add.png">
						</div>
						<p class="mt-2">Click here to add new category</p>
						<h2 class="text-uppercase text-muted">Add Category</h2>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px;" class="img-fluid rounded-circle" alt="user_image" src="img/plus.png">
						</div>
						<p class="mt-2">Click here to add new product</p>
						<h2 class="text-uppercase text-muted">Add Product</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Button trigger modal -->
		<!-- Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog model-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Fill Category details</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form>
		        	<div class="form-group">
		        		<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
		        	</div>
		        	<div class="form-group">
		        		<textarea style="height:350px;" class="form-control" name="catDescription" placeholder="Enter category description" required></textarea>
		        	</div>
		        	<div class="container text-center">
		        		<button class="btn btn-outline-success">Add Category</button>
		        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        	</div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>