<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Iniciar Sesion</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<c:if test="${ usuario != null }">
	<c:redirect url="."></c:redirect>
</c:if>
<body style="background-color: #9A616D;">
	<section>
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col col-xl-7">
	      <c:if test="${error_login != null}">
	      		<div class="alert alert-danger" role="alert">
					<c:out value="${error_login}"></c:out>
				</div>
	      	</c:if>
	        <div class="card" style="border-radius: 1rem;">
	          <div class="row g-0">
		        <div class="d-flex justify-content-end mt-2 pe-2">
		        	<a type="button" class="btn-close" aria-label="Close" href="index.jsp"></a>
		        </div>
	            <div class="col-md-6 col-md-12 d-flex align-items-center">
	              <div class="card-body pb-5 pe-5 ps-5 pt-2 text-black">
	              	<h1 class="card-title">Login</h1>
					<form class="container" method="post" action="ServletLogin">
					  <div class="mb-3">
					    <label for="usuario" class="form-label">Usuario</label>
					    <input type="text" class="form-control" id="usuario" name="usuario">
					  </div>
					  <div class="mb-3">
					    <label for="password" class="form-label">Contraseña</label>
					    <input type="password" class="form-control" id="password" name="password">
					  </div>
					  <div>
					  	<button type="submit" class="btn btn-primary col">Iniciar sesion</button>
					  	<a href="register.jsp" class="link col">¿No tienes una cuenta?</a>
					  </div>
					</form>
					
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</html>