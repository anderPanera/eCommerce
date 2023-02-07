<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="conf/conf.jsp" />
	<title>Valorant</title>
</head>
<body>
	<jsp:include page="pages/navbar.jsp" />
	<c:if test="${productos == null || productos.size() == 0}">
		<jsp:forward page="Productos"></jsp:forward>
	</c:if>
	<jsp:include page="pages/productos.jsp" />
</body>
</html>