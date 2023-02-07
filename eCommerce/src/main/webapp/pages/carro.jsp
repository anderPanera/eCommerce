<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/conf/conf.jsp"/>
	<title>Carro</title>
</head>
<body>
	<jsp:include page="/pages/navbar.jsp" />
	<div class="container my-5 py-5">
		<c:if test="${carro.length() == 0}">
			El carro esta vacio
		</c:if>
		<c:if test="${carro.length() > 0}">
			<table class="table table-striped mb-5">
			  <thead>
			    <tr>
			      <th scope="col">Nombre producto</th>
			      <th scope="col">Cantidad</th>
			      <th scope="col">Precio</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="carro" items="${carro.carro}">
			  		<tr>
			      		<td>${carro.value.producto.nombre} - ${carro.value.id}</td>
			      		<td>
			      			<form action="/eCommerce/ServletCarro" method="post">
			      				<input type="hidden" name="id" value="${carro.key}">
				      			<div class="btn-group" role="group" aria-label="Basic example">
								  <c:if test="${carro.value.cantidad > 1}">
								  	<button type="submit" name="modo" value="restar" class="btn btn-secondary">-</button>
								  </c:if>
								  <c:if test="${carro.value.cantidad == 1}">
								  	<button type="submit" name="modo" value="eliminar" class="btn btn-danger"><i class="bi bi-trash3"></i></button>
								  </c:if>
								  <span class="btn btn-outline-secondary">${carro.value.cantidad}</span>
								  <button type="submit" name="modo" value="sumar" class="btn btn-secondary">+</button>
								</div>
							</form>
			      		</td>
			      		<td>${carro.value.totalLinea()} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></td>
			  		</tr>
			  	</c:forEach>
			  		<tr class="bg-success-subtle">
			  			<td></td>
			  			<th>TOTAL:</th>
			  			<th>${carro.totalPrecio()} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></th>
			  		</tr>
			  	
			  </tbody>
			</table>
			<nav class="navbar fixed-bottom bg-dark">
			  	<div class="container-fluid text-white justify-content-center">
			      	<a class="btn btn-success col-2" href="/eCommerce/ServletCarro?modo=comprar">Hacer pedido</a>
			  	</div>
			</nav>
		</c:if>
	</div>
	
	
</body>
</html>