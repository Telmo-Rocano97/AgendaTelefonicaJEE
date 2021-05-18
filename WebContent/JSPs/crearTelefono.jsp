<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%>
<%@page import="ec.edu.ups.modelo.Usuario"%>
<%
	HttpSession sesion = request.getSession();
Usuario usuario = new Usuario();
usuario = (Usuario) sesion.getAttribute("usuario");
%>

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
<meta charset="UTF-8">
<title>Agregar telefono</title>
</head>
<body>

	<div>

		<header id="main-header" class="py-2 bg-success text-white">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
					<a class="btn btn-primary" href="/AgendaTelefonicaJEE/JSPs/inicio_usuario.jsp">Volver</a>
						<h1>
						
							</div>
							
							<i class="fas fa-phone-square-alt"></i> Agregar Telefono
							<h5>
								Usuario:
								<%
								out.print(usuario.getNombre() + " " + usuario.getApellido());
							%>
							</h5>
						</h1>
					</div>
				</div>
			</div>
		</header>

		<form id="form-1" style="margin-left: 100px; margin-top: 50px;"
			action="/AgendaTelefonicaJEE/CrearTelefonoController" method="POST">
			<section id="details" >
				<div class="container" >
					<div class="row" >
						<div class="col">
							<div class="card" >
								<div class="card-header" >
									<h4>Ingrese su nuevo numero</h4>
								</div>

								<div class="card-body">
									<div class="modal-body">
										<div class="form-group">
											<input id="input-1" name="usuario" type="text" hidden="true"
												value="${usuario.getCedula()}" /> <br> <label
												for="lblnumero">Numero </label> <input
												id="numero" name="numero" placeholder="Nuevo numero" type="text"
												class="form-control" required>
										</div>
										<div class="form-group">
											<label for="lbltipo">Tipo</label> <select
												name="tipo" id="tipo" class="form-select" required>
												<option value="movil">Fijo</option>
												<option value="fijo">Movil</option>
											</select>
										</div>
										<div class="form-group">
											<label for="lbloperadora">Operadora</label> <input
												id="operadora" name="operadora" placeholder="Operadora"
												type="text" class="form-control" required> <br>
											<input  class="btn btn-primary"type="submit" value="Guardar" id="button-1" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</section>
		</form>
	</div>
</body>

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
</html>