<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../conf/conf.jsp" />
	<title>Ventana</title>
	<style>
		body {
		  background-image: url("/eCommerce/img/fondoNegro.webp");  
		}
		.margen{
			margin-top: 9em;
		}
	</style>
</head>
<body>
	<c:remove var="categorias" scope="session"/>
	<c:remove var="productos" scope="session"/>
	<!-- Incluimos el navbar -->
	<jsp:include page="../pages/navbar.jsp" />
	<div id="productos" class="container margen">
		<!-- Si se le pasa un producto: -->
		<c:if test="${producto != null && accion == 'info'}">
			<div class="card mb-3">
			  <div class="row g-0">
			    <!-- Imagen del producto: -->
			    <div class="col-md-4 position-relative">
			      <img src='/eCommerce/img/${producto.imagen}.webp' class="img-fluid rounded-start position-absolute top-50 start-50 translate-middle" alt="${producto.nombre}">
			    </div>
			    <div class="col-md-8">
			      <!-- Datos del producto: -->
			      <div class="card-body">
			        <h5 class="card-title display-1">${producto.nombre}</h5>
			        <p class="card-text display-6">${producto.descripcion}</p>
			        <p class="card-text display-6">${producto.precio} <img style="filter: invert(1);" height="35" src="/eCommerce/img/coin.webp"></p>
			      </div>
			      	<!-- Boton para ir atras -->
					<div class="d-flex justify-content-end mb-2 me-2">
						<a href=".." class="btn btn-danger">Atras</a>
					</div>
			    </div>
			  </div>
			</div>
		</c:if>
		<c:if test="${producto != null && accion == 'editar'}">
			<div class="card mb-3">
			  <div class="row g-0">
			    <!-- Imagen del producto: -->
			    <div class="col-md-4 position-relative">
			      <img src='/eCommerce/img/${producto.imagen}.webp' class="img-fluid rounded-start position-absolute top-50 start-50 translate-middle" alt="${producto.nombre}">
			    </div>
			    <form class="col-md-8" method="post" action="/eCommerce/ServletProducto">
			      <!-- Datos del producto: -->
			      <div class="card-body">
			        <label class="card-title display-1" for="titulo">Titulo</label>
			        <input id="titulo" name="titulo" type="text" value="${producto.nombre}"><br>
			        <label class="card-text display-6" for="descripcion">Descripcion</label>
			        <input type="text" id="descripcion" name="descripcion" value="${producto.descripcion}"><br>
			        <label class="card-text display-6" for="precio">Precio</label>
			        <input type="text" name="precio" value="${ producto.precio }"> <img style="filter: invert(1);" height="35" src="/eCommerce/img/coin.webp"><br>
			      </div>
			      	<!-- Boton para ir atras -->
					<div class="d-flex justify-content-end mb-2 me-2">
						<input class="btn btn-success" name="modo" type="submit" value="cambiar" />
						<input class="btn btn-danger" name="modo" type="submit" value="eliminar" />
						<a href=".." class="btn btn-info">Atras</a>
					</div>
			    </form>
			  </div>
			</div>
		</c:if>
	</div>
</body>
</html>