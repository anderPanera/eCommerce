<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrarse</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<c:if test="${ usuario != null }">
	<c:redirect url="."></c:redirect>
</c:if>
<body style="background-color: #9A616D;">
	<section>
	  <div class="container py-5 h-100">
	    <div class="row d-flex justify-content-center align-items-center h-100">
	      <div class="col col-xl-10">
	      	<c:if test="${error_register != null}">
	      		<div class="alert alert-danger" role="alert">
					<c:out value="${error_register}"></c:out>
				</div>
	      	</c:if>
	        <div class="card" style="border-radius: 1rem;">
	          <div class="row g-0">
	          	<div class="d-flex justify-content-end mt-2 pe-2">
		        	<a type="button" class="btn-close" aria-label="Close" href="index.jsp"></a>
		        </div>
	            <div class=" col-md-12 d-flex align-items-center">
	              <div class="card-body pb-5 pe-5 ps-5 pt-2 text-black">
	              	<h1 class="card-title">Registrarse</h1>
					<form class="container" method="post" action="ServletRegistro">
					  <div class="row">
						  <div class="mb-3 col-6">
						    <label for="nombre" class="form-label">Nombre</label>
						    <input type="text" class="form-control" id="nombre" name="nombre">
						  </div>
						  <div class="mb-3 col-6">
						    <label for="apellidos" class="form-label">Apellidos</label>
						    <input type="text" class="form-control" id="apellidos" name="apellidos">
						  </div>
						  <div class="mb-3 col-6">
						    <label for="usuario" class="form-label">Usuario</label>
						    <input type="text" class="form-control" id="usuario" name="usuario">
						  </div>
						  <div class="mb-3 col-6">
						    <label for="email" class="form-label">Email</label>
						    <input type="email" class="form-control" id="email" name="email">
						  </div>
						  <div class="mb-3">
						    <label for="password" class="form-label">Contrase?a</label>
						    <input type="password" class="form-control" id="password" name="password">
						  </div>
						  <div class="mb-3 col-7">
						    <label for="domicilio" class="form-label">Domicilio</label>
						    <input type="text" class="form-control" id="domicilio" name="domicilio">
						  </div>
						  <div class="mb-3 col-2">
						    <label for="cp" class="form-label">Codigo Postal</label>
						    <input type="text" class="form-control" id="cp" name="cp">
						  </div>
						  <div class="mb-3 col-3">
						    <label for="telefono" class="form-label">Telefono</label>
						    <input type="tel" class="form-control" id="telefono" name="telefono">
						  </div>
					  </div>
					  <div>
					  	<button type="submit" class="btn btn-primary">Registrarse</button>
					  	<a href="login.jsp" class="link col">?Tienes una cuenta?</a>
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