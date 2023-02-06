<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
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
		  <a href="ServletRegister" type="button" class="btn btn-outline-light">Register</a>
		</div>
      </c:if>
      <c:if test="${usuario != null }">
      	  <span class="btn btn-outline-light me-2"><i class="bi bi-person-fill me-1"></i><c:out value="${usuario.nombre}"></c:out></span>
      	  <a class="btn btn-outline-light me-2" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  				<i class="bi bi-cart"></i> ${carro.length()}
		  </a>
		  <a href="ServletLogin?logout" type="button" class="btn btn-light">Logout</a>
      </c:if>
    </div>
  </div>
</nav>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Carro</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <c:if test="${carro.length() == 0}">
    	<div>Actualmente no hay ningun item en tu carro</div>
    </c:if>
    
    
    <c:forEach var="item" items="${carro.carro}">
    	<div class="card mb-3">
		  <div class="card-body">
		    <h5 class="card-title">${item.value.producto.nombre}</h5>
		    <div class="btn-group me-1" role="group" aria-label="Basic example">
			  <button type="button" class="btn btn-secondary">-</button>
			  <span class="btn btn-outline-secondary">${item.value.cantidad}</span>
			  <button type="button" class="btn btn-secondary">+</button>
			</div>
			<button type="button" class="btn btn-outline-danger"><i class="bi bi-trash3"></i></button>
		  </div>
		</div>
    </c:forEach>
  </div>
</div>