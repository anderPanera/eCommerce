<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h4 class="offcanvas-title" id="offcanvasExampleLabel">Carro</h4>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  	
    <c:if test="${carro.length() == 0}">
    	<div>Actualmente no hay ningun item en tu carro</div>
    </c:if>
    <c:if test="${carro.length() > 0}">
    	<div class="mb-3"><a href="paginadecarro.jsp">Ver mi carro detalladamente</a></div>
    </c:if>
    <c:forEach var="item" items="${carro.carro}">
    	<div class="card mb-3">
		  <div class="card-body">
		    <h5 class="card-title">${item.value.producto.nombre} - ${item.value.totalLinea()} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp"></h5>
		    
		    <form action="ServletCarro" method="post">
		    	<input type="hidden" value="${item.key}" name="id">
			    <div class="btn-group me-1" role="group" aria-label="Basic example">
				  <input type="number" name="cant" min="0" style="width: 60px;" value="${item.value.cantidad}" class="btn-outline-secondary">
				  <button type="submit" name="modo" value="actualizar" class="btn btn-success"><i class="bi bi-check-lg"></i></button>
				</div>
				<button type="submit" name="modo" value="eliminar" class="btn btn-danger"><i class="bi bi-trash3"></i></button>
			</form>
		  </div>
		</div>
    </c:forEach>
    
  </div>
  <c:if test="${carro.length() > 0}">
	  <div class="offcanvas-header bg-body-tertiary">
	    	<div>
	    		<button type="button" class="btn btn-success">Comprar</button>
	    		Total: ${carro.totalPrecio()} <img style="filter: invert(1);" height="18" src="/eCommerce/img/coin.webp">
	    	</div>
			<a href="ServletCarro?modo=vaciar" class="btn btn-danger">Vaciar</a>
	  </div>
</c:if>
</div>