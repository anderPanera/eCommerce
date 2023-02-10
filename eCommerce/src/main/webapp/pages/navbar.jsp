<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar fixed-top bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <span class="navbar-brand">Skins</span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/eCommerce/.">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href=""></a>
        </li>
      </ul>
      <c:if test="${usuario == null }">
      	<div class="" role="group">
		  <a href="/eCommerce/login.jsp" type="button" class="btn btn-primary me-1">Login</a>
		  <a href="/eCommerce/register.jsp" type="button" class="btn btn-outline-light">Register</a>
		</div>
      </c:if>
      <c:if test="${usuario != null }">
      	<c:if test="${usuario.rol == 'admin'}">
      		<button type="button" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Crear Producto</button>
      	</c:if>
      	  <a href="/eCommerce/pages/perfil.jsp" class="btn btn-outline-light me-2"><i class="bi bi-person-fill me-1"></i><c:out value="${usuario.nombre}"></c:out></a>
      	  <a class="btn btn-outline-light me-2" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  				<i class="bi bi-cart"></i> ${carro.length()}
		  </a>
		  <a href="/eCommerce/ServletLogin?logout" type="button" class="btn btn-light">Logout</a>
      </c:if>
    </div>
  </div>
</nav>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Crear nuevo producto</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="ServletProducto" method="post">
	      <div class="modal-body">
	        <div class="mb-3">
			    <label for="nombre" class="form-label">Nombre producto</label>
			    <input type="text" class="form-control" id="nombre" name="nombre">
			  </div>
			  <div class="mb-3">
			    <label for="desc" class="form-label">Descripcion</label>
			    <input type="text" class="form-control" id="desc" name="desc">
			  </div>
			  <div class="mb-3">
			    <label for="precio" class="form-label">Precio</label>
			    <input type="text" class="form-control" id="precio" name="precio">
			  </div>
			  <div class="mb-3">
			    <label for="imagen" class="form-label">Imagen (sin extensiones)</label>
			    <input type="text" class="form-control" id="imagen" name="imagen">
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
	        <button type="submit" name="modo" value="crear" class="btn btn-primary">Crear</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="carronav.jsp" />