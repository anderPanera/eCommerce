<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventana</title>
</head>
<body>

	<c:if test="${producto != null}">
	
		<div class="card mb-3" style="max-width: 540px;">
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="${producto.imagen}" class="img-fluid rounded-start" alt="${item.nombre}">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">${producto.nombre}</h5>
		        <p class="card-text">${producto.descripcion}</p>
		        <p class="card-text"><small class="text-muted">${producto.precio}€</small></p>
		      </div>
		    </div>
		  </div>
		</div>
		
	</c:if>

</body>
</html>