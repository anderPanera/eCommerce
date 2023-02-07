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
	</style>
</head>
<body>
	<jsp:include page="../pages/navbar.jsp" />
	<div id="productos" class="container my-5">
		<c:if test="${producto != null}">
			<div class="card mb-3">
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src='/img.webp' class="img-fluid rounded-start" alt="${item.nombre}">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">${producto.nombre}</h5>
			        <p class="card-text">${producto.descripcion}</p>
			        <p class="card-text">${producto.precio} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></p>
			      </div>
			    </div>
			  </div>
			</div>
		</c:if>
		<form action="../Productos">
			<div class="d-flex justify-content-end">
				<button type="submit">Atras</button>
			</div>
		</form>
	</div>
</body>
</html>