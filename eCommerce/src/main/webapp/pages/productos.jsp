<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="productos" class="container my-5 pt-5">
	<h2 class="text-center mb-5">PRODUCTOS</h2>
	<div class="row card">
		<div class="d-flex p-2 gap-2">
			<c:if test="${param.cat == null}">
				<a href="ServletProducto" type="button" class="btn btn-dark flex-fill">Todas</a>
			</c:if>
			<c:if test="${param.cat != null}">
				<a href="ServletProducto" type="button" class="btn btn-outline-dark flex-fill">Todas</a>
			</c:if>
			<c:forEach var="cate" items="${categorias}">
				<c:if test="${param.cat == cate}">
					<a href="ServletProducto?cat=${cate}" type="button" class="btn btn-dark flex-fill">${cate}</a>
				</c:if>
				<c:if test="${param.cat != cate}">
					<a href="ServletProducto?cat=${cate}" type="button" class="btn btn-outline-dark flex-fill">${cate}</a>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<c:forEach var="p" items="${productos}">
			<div class="col-3 p-2">
		  		<div class="card" style="height: 335px">
					<img src="/eCommerce/img/${p.imagen}.webp" class="card-img-top p-2" alt="${p.imagen}">
				  	<div class="card-body row align-items-end">
				    	<div>
				    		<h5 class="card-title">${p.nombre}</h5>
					    	<small>${p.precio} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></small>
					    	<div class="d-flex mt-2">
							    <a href="ServletProducto?comprar&id=${p.id}" type="button" class="btn btn-outline-success flex-fill me-2">Comprar</a>
							    <a href="ServletProducto?info&id=${p.id}" type="button" class="btn btn-outline-secondary"><i class="bi bi-info-circle-fill"></i></a>
							</div>
				    	</div>
					</div>
				</div>
		  	</div>
		</c:forEach>
	</div>
</div>