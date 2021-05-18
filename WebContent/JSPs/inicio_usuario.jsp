
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- Elementos de Bootstrap CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/72ad08e112.js"
	crossorigin="anonymous"></script>


<title>Persona Encontrada</title>
</head>
<body class="bg-Info">


	<header id="main-header" class="py-2 bg-success text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>
						<a class="btn btn-primary"
							href="/AgendaTelefonicaJEE/LoginUsuarioController?logout">Cerrar
							sesion</a>
						<c:set var="u" scope="request" value="${usuario}" />
						<h1>
							<i class="fas fa-door-open"></i> Bienvenido
						</h1>
						<p>Nombre: ${u.nombre}</p>
					</h1>
				</div>
			</div>
		</div>
	</header>



	<div>
		<section id="details">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="card">
							<div class="card-header">
								<h4>Informacion</h4>
							</div>
							<form id="form-1"
								action="/AgendaTelefonicaJEE/BuscarUsuarioContactoController"
								method="get">
								<label for="input-1">Buscar contacto:</label> <input
									id="identificacion" name="identificacion"
									placeholder="Correo/cedula" type="text" /> <input id="cedula"
									name="cedula" placeholder="Text" type="text" hidden="true"
									value="${u.cedula}" /> <input type="submit" value="Buscar"
									id="button-1" /> <label id="label-1">Usuario:
									${u.getNombre()} ${u.getApellido()}</label> <br>
								<label id="label-2">Correo: ${u.getCorreo() }
									<td><a href="mailto:${u.getCorreo()}"
										class="btn btn-success"> <i
											class="fas fa-envelope-open-text"></i>
									</a></td>
								</label> <a class="btn btn-primary"
									href="/AgendaTelefonicaJEE/JSPs/crearTelefono.jsp">Agregar
									nuevo telefono</a>

							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
	</div>
	</section>




	<div>
		<c:set var="telfns" scope="request" value="${telefonos}" />
		<h5>Mis telefonos</h5>
		<table class="table table-active table-hover" id="table-1">
			<thead>
				<tr>
					<th>N°</th>
					<th>Número</th>
					<th>Tipo</th>
					<th>Operadora</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="t" items="${telfns}">
					<tr>
						<td>${t.codigo}</td>
						<td>${t.numero}</td>
						<td>${t.tipo}</td>
						<td>${t.operadora}</td>
						<td><a href="JSPs/actualizar.jsp" class="btn btn-danger">
								<i class="fas fa-pencil-alt"></i> Editar
						</a></td>

						<td><a href="tel:${t.numero}" class="btn btn-danger"> <i
								class="fas fa-phone-volume"></i> Llamar
						</a></td>

						<td><a href="EliminarTelefonoController"
							class="btn btn-danger"> <i class="fas fa-trash-alt"></i>
						</a></td>
					</tr>
				</c:forEach>
				</div>
			</tbody>
		</table>
	</div>



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

<footer id="pie-pagina" class="bg-secondary text-white mt-5 p-5">
	<div class="container">
		<div class="col">
			<p class="lead text-center">Angel Jadan- Telmo Rocano</p>
		</div>
	</div>
</footer>
</html>