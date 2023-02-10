<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Perfil</title>
	<jsp:include page="../conf/conf.jsp" />
</head>
<body>
	<jsp:include page="../pages/navbar.jsp" />
	<div class="container my-5 pt-3">
		<h1 class="text-black">Mi Cuenta</h1>
		<div class="card mb-3">
		  <div class="card-body">
		 
		  <c:if test='<%= request.getParameter("editar") == null%>'>
			  	<div class="row fs-5 justify-content-around">
			    	<span class="col-6"><b>Nombre</b>: ${usuario.nombre}</span>
			    	<span class="col-6"><b>Apellidos</b>: ${usuario.apellidos}</span>
			    	<span class="col-6"><b>Domicilio</b>: ${usuario.domicilio}</span>
			   		<span class="col-6"><b>Codigo Postal</b>: ${usuario.codigopostal}</span>
			    	<span class="col-6"><b>Telefono</b>: ${usuario.telefono}</span>
			    	<span class="col-6"><b>Email</b>: ${usuario.email}</span>
			    </div>
			    <div class="row justify-content-center">
			    	<a class=" col-2 mt-2 btn bg-info" href="perfil.jsp?editar=true">Editar</a>
			    </div>
		    </c:if>
		    <c:if test='<%= request.getParameter("editar") != null%>'>
		    	<form class="row fs-5 justify-content-around">
			    	<label class="col-6"><b>Nombre</b>:</label><input type="text" value="${usuario.nombre}"> 
			    	<label class="col-6"><b>Apellidos</b>:</label> <input type="text" value="${usuario.apellidos}">
			    	<label class="col-6"><b>Domicilio</b>:</label> ${usuario.domicilio}
			   		<label class="col-6"><b>Codigo Postal</b>:</label> ${usuario.codigopostal}
			    	<label class="col-6"><b>Telefono</b>:</label> ${usuario.telefono}
			    	<label class="col-6"><b>Email</b>:</label> ${usuario.email}
			    </form>
		    </c:if>
		  </div>
		</div>
		<h2>Mis pedidos</h2>
		<c:if test="${pedidoslineas == null}">
			<jsp:forward page="/ServletPedidos"></jsp:forward>
		</c:if>
		<div class="accordion" id="accordionExample">
			<c:forEach var="pedido" items="${pedidoslineas}">
				<div class="accordion-item">
				    <h2 class="accordion-header" id="heading${pedido.key.id}">
				      	<button class="accordion-button bg-primary-subtle" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${pedido.key.id}" aria-expanded="true" aria-controls="collapseOne">
				        	Pedido con ID: ${pedido.key.id} - ${pedido.key.fecha}
				      	</button>
				    </h2>
				    <div id="collapse${pedido.key.id}" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      	<div class="accordion-body">
				      		<table class="table table-striped">
								<thead>
									<tr>
								      	<th scope="col">Nombre producto</th>
								      	<th scope="col">Cantidad</th>
								      	<th scope="col">Precio</th>
								   	</tr>
								</thead>
								<tbody>
				        			<c:forEach var="linea" items="${pedido.value}">
										<tr>
											<td>${linea.producto.nombre}</td>
											<td>${linea.cantidad}</td>
											<td>${linea.getPrecioLineaTotal()}</td>
										</tr>
								  	</c:forEach>
								  	<tr class="bg-success-subtle">
			  							<td></td>
			  							<th>TOTAL:</th>
			  							<th>${pedido.key.total} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></th>
			  						</tr>
								</tbody>
							</table>
							
				        </div>
				    </div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>