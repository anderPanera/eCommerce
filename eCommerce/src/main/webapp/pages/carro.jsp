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
	<div class="container mt-5 pt-5">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">id</th>
		      <th scope="col">Nombre producto</th>
		      <th scope="col">Cantidad</th>
		      <th scope="col">Precio</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="carro" items="${carro.carro}">
		  		<tr>
		  			<th scope="row">${carro.key}</th>
		      		<td>${carro.value.producto.nombre}</td>
		      		<td>${carro.value.cantidad}</td>
		      		<td>${carro.value.totalLinea()}</td>
		  		</tr>
		  	</c:forEach>
		  </tbody>
		</table>
	</div>
</body>
</html>