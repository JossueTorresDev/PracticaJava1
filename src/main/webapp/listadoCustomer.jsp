<%@ page import="pe.edu.vallegrande.dto.Customer" %>
<%@ page import="pe.edu.vallegrande.Controller.CustomerController" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Listado de Pedidos</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


    <!-- Custom CSS -->
    <style>
        /* General Styles */
        body, html {
            height: 100%;
        }

        #wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background-color: #1e2125;
            padding-top: 20px;
            position: fixed;
            height: 100%;
        }

        #sidebar-wrapper .list-group-item {
            background-color: #1e2125;
            color: #c9c9c9;
            border: none;
            padding: 15px;
            font-size: 1.1em;
        }

        #sidebar-wrapper .list-group-item:hover {
            background-color: #343a40;
            color: #fff;
        }

        #sidebar-wrapper .list-group-item.active {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        /* Page Content */
        #page-content-wrapper {
            width: 100%;
            padding: 20px;
            margin-left: 250px;
        }

        /* Navbar */
        .navbar {
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Table Styles */
        .table {
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .table td, .table th {
            padding: 12px;
            vertical-align: middle;
        }

        .table thead th {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .table tbody tr {
            background-color: #f8f9fa;
            border-radius: 12px;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

        .table tbody td {
            border-top: none;
            border-bottom: none;
        }

        /* Card Shadows */
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div id="wrapper">
    <div id="sidebar-wrapper" class="bg-dark">
        <div class="sidebar-heading text-center py-4 text-light fs-4 fw-bold">
            <i class="fas fa-shopping-cart me-2"></i>AkiExpress
        </div>
        <div class="list-group list-group-flush">
            <a href="#" class="list-group-item list-group-item-action active">Inicio</a>
            <a href="listadoProductos.jsp" class="list-group-item list-group-item-action">Productos</a>
            <a href="ventas.jsp" class="list-group-item list-group-item-action">Ventas</a>
            <a href="listadoCustomer.jsp" class="list-group-item list-group-item-action">Orden</a>
        </div>
    </div>

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand ms-3" href="#">AkiExpress</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Content -->
        <div class="container-fluid px-4">
            <h1 class="mt-4">Listado de Pedidos</h1>

            <!-- Card para agregar un nuevo pedido -->
            <div class="card mb-4">
                <div class="card-header">
                    Registrar Pedido
                </div>
                <div class="card-body">
                    <form action="OrderServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="first_name">Nombre</label>
                                <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Nombre" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="last_name">Apellido</label>
                                <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Teléfono" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="document_type">Tipo de Documento</label>
                                <input type="text" class="form-control" id="document_type" name="document_type" placeholder="Tipo de Documento" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="document_number">Numero_Documento</label>
                                <input type="text" class="form-control" id="document_number" name="document_number" placeholder="Numero de Documento" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label for="mobile">Telefono</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Telefono" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="email">Correo Electrónico</label>
                                <input type="text" step="0.01" class="form-control" id="email" name="email" placeholder="Correo Electrónico" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="state">Estado</label>
                                <input type="date" step="0.01" class="form-control" id="state" name="state" placeholder="Estado" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Agregar Pedido</button>
                    </form>
                </div>
            </div>

            <!-- Card para listado de pedidos -->
            <div class="card mb-4">
                <div class="card-header">
                    Pedidos
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Tipo de Documento</th>
                                <th>Numero de Documento</th>
                                <th>Celular</th>
                                <th>Correo Electrónico</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                CustomerController customerController = new CustomerController();
                                List<Customer> customers = customerController.listarTodos();

                                if (customers.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="9" class="text-center">No hay pedidos disponibles por el momento.</td>
                            </tr>
                            <%
                            } else {
                                for (Customer customer : customers) {
                            %>
                            <tr>
                                <td><%= customer.getId() %></td>
                                <td><%= customer.getFirst_name() %></td>
                                <td><%= customer.getLast_name() %></td>
                                <td><%= customer.getDocument_type() %></td>
                                <td><%= customer.getDocument_number() %></td>
                                <td><%= customer.getMobile() %></td>
                                <td><%= customer.getEmail() %></td>
                                <td><%= customer.getState() %></td>
                                <td>
                                    <!-- Botón Editar -->
                                    <a href="editarCustomer.jsp?id=<%= customer.getId() %>" class="btn btn-primary btn-sm">Editar</a>
                                    <!-- Botón Eliminar -->
                                    <a href="OrderServlet?action=delete&id=<%= customer.getId() %>" class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>