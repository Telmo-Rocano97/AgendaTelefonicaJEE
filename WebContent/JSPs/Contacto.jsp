<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Elementos de Bootstrap CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/72ad08e112.js"
	crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Contacto</title>
</head>
<body class = "bg-">
	<header id="main-header" class="py-2 bg-success text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>
						<a class="btn btn-primary"
							href="/AgendaTelefonicaJEE/JSPs/inicio_usuario.jsp">Volver</a> <br>
						<c:set var="u" scope="request" value="${contacto}" />
						<label id="label-1">Usuario: ${u.getNombre()}
							${u.getApellido()}</label> <br> <label id="label-2">Correo:
							${u.getCorreo() }</label> <a class="btn btn-primary"
							href="mailto: ${u.getCorreo()}">Enviar correo</a>
					</h1>
				</div>
			</div>
		</div>
	</header>



	<table class="table table-active table-hover" id="table-1">
		<br>
		<c:set var="telfns" scope="request" value="${u.getTelefonos()}" />
		<caption>Teléfonos</caption>
		<thead>
			<tr>
				<th>N°</th>
				<th>Número</th>
				<th>Tipo</th>
				<th>Operadora</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tel" items="${telfns}">
				<tr>
					<td>${tel.codigo}</td>
					<td><a href="tel:+593 ${tel.numero}">${tel.numero}</a></td>
					<td>${tel.tipo}</td>
					<td>${tel.operadora}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ"
		crossorigin="anonymous"></script>
</body>
</html>