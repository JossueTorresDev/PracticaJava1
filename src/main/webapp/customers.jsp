<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/app.css">
</head>
<body>
	<div class="wrapper">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main">
			<jsp:include page="navbar.jsp"></jsp:include>
			<div class="container my-3">
				<div class="row gap-3">
					<h1>Clientes</h1>
					<div class="d-flex justify-content-between">
						<div class="input-group">
							<div class="form-outline">
								<input type="search" id="txtBuscar" class="form-control"
									placeholder="Buscar" />
							</div>
							<button type="button" class="btn btn-primary" id="btnBuscar">
								<i class="fas fa-search"></i>
							</button>
						</div>
						<div class="d-flex gap-3 align-items-center">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="chkEstado"> <label class="form-check-label"
									for="chkEstado">Inactivos</label>
							</div>
							<button class="btn btn-success" data-bs-toggle="modal"
								data-bs-target="#formModal" id="btnNuevo">Nuevo</button>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Nombre</th>
										<th scope="col">Apellidos</th>
										<th scope="col">Tipo Doc.</th>
										<th scope="col">Nº Doc.</th>
										<th scope="col">Correo Electronico</th>
										<th scope="col">Nº Celular</th>
										<th scope="col">Acciones</th>
									</tr>
								</thead>
								<tbody id="resultRegistro">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal fade modal-lg" id="formModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Nuevo -
									Editar</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form class="row g-4 needs-validation" novalidate>
									<input type="hidden" id="accion" name="accion">
									<div class="col-md-12 d-none">
										<label for="frmId" class="form-label">ID</label> <input
											type="text" class="form-control" id="frmId">
									</div>
									<div class="col-md-6">
										<label for="frmNom" class="form-label">Nombre<span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="frmNom" required>
										<div class="valid-feedback">Looks good!</div>
									</div>
									<div class="col-md-6">
										<label for="frmApe" class="form-label">Apellidos<span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="frmApe" required>
										<div class="valid-feedback">Looks good!</div>
									</div>
									<div class="col-md-6">
										<label for="frmTipDoc" class="form-label">Tipo Doc.<span
											class="text-danger">*</span></label> <select class="form-select"
											id="frmTipDoc" required>
											<option selected disabled value="">Elegir...</option>
											<option>DNI</option>
											<option value="CEX">CNE</option>
										</select>
										<div class="invalid-feedback">Please select a valid
											state.</div>
									</div>
									<div class="col-md-6">
										<label for="frmNumDoc" class="form-label">Nº Doc.<span
											class="text-danger">*</span></label> <input type="number"
											class="form-control" id="frmNumDoc" required>
										<div class="valid-feedback">Looks good!</div>
									</div>
									<div class="col-md-7">
										<label for="frmEma" class="form-label">Email</label> <input
											type="email" class="form-control" id="frmEma">
										<div class="invalid-feedback">Please provide a valid
											city.</div>
									</div>
									<div class="col-md-5">
										<label for="frmCell" class="form-label">Nº Celular</label>
										<div class="input-group has-validation">
											<span class="input-group-text" id="inputGroupPrepend">+51</span>
											<input type="number" class="form-control" id="frmCell"
												aria-describedby="inputGroupPrepend">
											<div class="invalid-feedback">Please choose a username.</div>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success"
									data-bs-dismiss="modal" id="btnAgregar">Agregar</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script>
		const CRUD_NUEVO = "NUEVO";
		const CRUD_EDITAR = "EDITAR";
		const CRUD_ELIMINADO = "ELIMINADO";
		const CRUD_RESTAURAR = "RESTAURAR";
		const CRUD_ELIMINAR = "ELIMINAR";

		let arreglo = [];

		let btnBuscar = document.getElementById('btnBuscar');
		let btnAgregar = document.getElementById('btnAgregar');
		let btnNuevo = document.getElementById('btnNuevo');
		let checkbox = document.getElementById("chkEstado");

		let accion = document.getElementById('accion');
		let frmId = document.getElementById('frmId');
		let frmNom = document.getElementById('frmNom');
		let frmApe = document.getElementById('frmApe');
		let frmTipDoc = document.getElementById('frmTipDoc');
		let frmNumDoc = document.getElementById('frmNumDoc');
		let frmEma = document.getElementById('frmEma');
		let frmCell = document.getElementById('frmCell');

		btnBuscar.addEventListener("click", fnBuscar);
		btnAgregar.addEventListener("click", fnAgregar);
		btnNuevo.addEventListener("click", fnNuevo);

		function fnNuevo() {
			document.getElementById("accion").value = CRUD_NUEVO;
			btnAgregar.innerHTML = "Agregar";
			fnEstadoFormulario(CRUD_NUEVO);
		}

		function fnEditar(id) {
			document.getElementById("accion").value = CRUD_EDITAR;
			fnCargarForm(id);
		}

		function fnEliminado(id) {
			document.getElementById("accion").value = CRUD_ELIMINADO;
			fnCargarForm(id);
			fnAgregar(CRUD_EDITAR);
		}

		function fnRestaurar(id) {
			document.getElementById("accion").value = CRUD_RESTAURAR;
			fnCargarForm(id);
			fnAgregar();
		}

		function fnEliminar(id) {
			document.getElementById("accion").value = CRUD_ELIMINAR;
			fnCargarForm(id);
			fnAgregar();
		}

		checkbox.addEventListener("change", function() {
			if (this.checked) {
				fnInactivos();
			} else {
				fnActivos();
			}
		});

		function fnAgregar() {
			if (!fnValidar()) {
				return;
			}
			let datos = "accion=" + document.getElementById("accion").value;
			datos += "&id=" + document.getElementById("frmId").value;
			datos += "&nom=" + document.getElementById("frmNom").value;
			datos += "&ape=" + document.getElementById("frmApe").value;
			datos += "&tipDoc=" + document.getElementById("frmTipDoc").value;
			datos += "&numDoc=" + document.getElementById("frmNumDoc").value;
			datos += "&ema=" + document.getElementById("frmEma").value;
			datos += "&cell=" + document.getElementById("frmCell").value;
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "CustomerProcesar", true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded; charset=utf-8');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					console.log(xhr.responseText);
					if (document.getElementById("accion").value == CRUD_RESTAURAR
							|| document.getElementById("accion").value == CRUD_ELIMINAR) {
						fnInactivos();
					} else {
						fnActivos();
					}
				}
			};
			xhr.send(datos);
		}

		function fnBuscar() {
			let buscar = document.getElementById("txtBuscar").value;
			let url = "CustomerBuscar?buscador=" + buscar;
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", url, true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultRegistro = "";
					arreglo
							.forEach(function(item) {
								resultRegistro += "<tr>";
								resultRegistro += "<td>" + item.id + "</td>";
								resultRegistro += "<td>" + item.names + "</td>";
								resultRegistro += "<td>" + item.lastName
										+ "</td>";
								resultRegistro += "<td>" + item.docType
										+ "</td>";
								resultRegistro += "<td>" + item.docNum
										+ "</td>";
								resultRegistro += "<td>" + item.email + "</td>";
								resultRegistro += "<td>" + item.cell + "</td>";
								resultRegistro += "<td>";
								resultRegistro += "<a class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#formModal' href='javascript:fnEditar("
										+ item.id
										+ ");'><i class='fa-solid fa-pen'></i></a>";
								resultRegistro += "<a class='btn btn-danger' href='javascript:fnEliminado("
										+ item.id
										+ ");'><i class='fa-solid fa-trash'></i></a>";
								resultRegistro += "</td>";
								resultRegistro += "</tr>";
							});
					document.getElementById("resultRegistro").innerHTML = resultRegistro;
				}
			};
			xhttp.send();
		}

		function fnInactivos() {
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "CustomerInactivos", true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultRegistro = "";
					arreglo
							.forEach(function(item) {
								resultRegistro += "<tr>";
								resultRegistro += "<td>" + item.id + "</td>";
								resultRegistro += "<td>" + item.names + "</td>";
								resultRegistro += "<td>" + item.lastName
										+ "</td>";
								resultRegistro += "<td>" + item.docType
										+ "</td>";
								resultRegistro += "<td>" + item.docNum
										+ "</td>";
								resultRegistro += "<td>" + item.email + "</td>";
								resultRegistro += "<td>" + item.cell + "</td>";
								resultRegistro += "<td>";
								resultRegistro += "<a class='btn btn-success' href='javascript:fnRestaurar("
										+ item.id
										+ ");'><i class='fa-solid fa-trash-can-arrow-up'></i></a> ";
								resultRegistro += "<a class='btn btn-danger' href='javascript:fnEliminar("
										+ item.id
										+ ");'><i class='fa-solid fa-trash'></i></a>";
								resultRegistro += "</td>";
								resultRegistro += "</tr>";
							});
					document.getElementById("resultRegistro").innerHTML = resultRegistro;
				}
			};
			xhttp.send();
		}

		function fnActivos() {
			let xhttp = new XMLHttpRequest();
			xhttp.open("GET", "CustomerActivos", true);
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let respuesta = xhttp.responseText;
					arreglo = JSON.parse(respuesta);
					let resultRegistro = "";
					arreglo
							.forEach(function(item) {
								resultRegistro += "<tr>";
								resultRegistro += "<td>" + item.id + "</td>";
								resultRegistro += "<td>" + item.names + "</td>";
								resultRegistro += "<td>" + item.lastName
										+ "</td>";
								resultRegistro += "<td>" + item.docType
										+ "</td>";
								resultRegistro += "<td>" + item.docNum
										+ "</td>";
								resultRegistro += "<td>" + item.email + "</td>";
								resultRegistro += "<td>" + item.cell + "</td>";
								resultRegistro += "<td>";
								resultRegistro += "<a class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#formModal' onclick='fnEditar("
										+ item.id
										+ ")'><i class='fa-solid fa-pen'></i></a>";
								resultRegistro += "<a class='btn btn-danger' onclick='fnEliminado("
										+ item.id
										+ ")'><i class='fa-solid fa-trash'></i></a>";
								resultRegistro += "</td>";
								resultRegistro += "</tr>";
							});
					document.getElementById("resultRegistro").innerHTML = resultRegistro;
				}
			};
			xhttp.send();
		}

		fnActivos();

		function fnValidar() {
			return true;
		}

		function fnCargarForm(id) {
			arreglo.forEach(function(item) {
				if (item.id == id) {
					frmId.value = item.id;
					frmNom.value = item.names;
					frmApe.value = item.lastName;
					frmTipDoc.value = item.docType;
					frmNumDoc.value = item.docNum;
					frmEma.value = item.email;
					frmCell.value = item.cell;
					return true;
				}
			});
		}

		function fnEstadoFormulario(estado) {
			frmNom.disabled = (estado == CRUD_ELIMINAR)
			frmApe.disabled = (estado == CRUD_ELIMINAR)
			frmTipDoc.disabled = (estado == CRUD_ELIMINAR)
			frmNumDoc.disabled = (estado == CRUD_ELIMINAR)
			frmEma.disabled = (estado == CRUD_ELIMINAR)
			frmCell.disabled = (estado == CRUD_ELIMINAR)
			if (estado == CRUD_NUEVO) {
				frmId.value = "0";
				frmNom.value = "";
				frmApe.value = "";
				frmTipDoc.value = "";
				frmNumDoc.value = "";
				frmEma.value = "";
				frmCell.value = "";
			} else if (estado == CRUD_ELIMINADO) {
				frmNom.disabled = (estado == CRUD_ELIMINADO)
				frmApe.disabled = (estado == CRUD_ELIMINADO)
				frmTipDoc.disabled = (estado == CRUD_ELIMINADO)
				frmNumDoc.disabled = (estado == CRUD_ELIMINADO)
				frmEma.disabled = (estado == CRUD_ELIMINADO)
				frmCell.disabled = (estado == CRUD_ELIMINADO)
			} else if (estado == CRUD_RESTAURAR) {
				frmNom.disabled = (estado == CRUD_RESTAURAR)
				frmApe.disabled = (estado == CRUD_RESTAURAR)
				frmTipDoc.disabled = (estado == CRUD_RESTAURAR)
				frmNumDoc.disabled = (estado == CRUD_RESTAURAR)
				frmEma.disabled = (estado == CRUD_RESTAURAR)
				frmCell.disabled = (estado == CRUD_RESTAURAR)
			}
		}
	</script>
</body>
</html>