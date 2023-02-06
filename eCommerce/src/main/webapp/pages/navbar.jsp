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
          <a class="nav-link active" aria-current="page" href=".">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href=""></a>
        </li>
      </ul>
      <c:if test="${usuario == null }">
      	<div class="" role="group">
		  <a href="login.jsp" type="button" class="btn btn-primary">Login</a>
		  <a href="ServletRegister" type="button" class="btn btn-outline-light">Register</a>
		</div>
      </c:if>
      <c:if test="${usuario != null }">
      	  <span class="btn btn-outline-light me-2"><i class="bi bi-person-fill me-1"></i><c:out value="${usuario.nombre}"></c:out></span>
		  <a href="ServletLogin?logout" type="button" class="btn btn-light">Logout</a>
      </c:if>
    </div>
  </div>
</nav>