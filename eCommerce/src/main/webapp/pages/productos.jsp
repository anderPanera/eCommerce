<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="productos" class="container my-5 pt-5">
	<h2 class="text-center">PRODUCTOS</h2>
	<div class="row mt-5">
		<c:forEach var="p" items="${productos}">
			<div class="col-3 p-2">
		  		<div class="card" style="height: 335px">
					<img src="/eCommerce/img/${p.imagen}.webp" class="card-img-top p-2" alt="${p.imagen}">
				  	<div class="card-body row align-items-end">
				    	<div>
				    		<h5 class="card-title">${p.nombre}</h5>
					    	<small>${p.precio} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></small>
					    	<div class="d-flex mt-2">
							    <a href="Productos?comprar&id=${p.id}" type="button" class="btn btn-outline-success flex-fill me-2">Comprar</a>
							    <a href="Productos?info&id=${p.id}" type="button" class="btn btn-outline-secondary"><i class="bi bi-info-circle-fill"></i></a>
							</div>
				    	</div>
					</div>
				</div>
		  	</div>
		</c:forEach>
	</div>
</div>