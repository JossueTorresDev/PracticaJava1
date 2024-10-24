<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login - AkiExpress</title>

    <!-- Bootstrap CSS (Versión actualizada a 5.3) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f4f9;
        }
        .login-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-box {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 800px;
            max-width: 100%;
        }
        .left-box {
            background-color: #3b3ac6;
            padding: 40px;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .left-box img {
            max-width: 200px;
            margin-bottom: 20px;
        }
        .left-box h2 {
            font-size: 24px;
            text-align: center;
        }
        .right-box {
            padding: 40px;
        }
        .right-box h1 {
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: bold;
        }
        .form-input {
            margin-bottom: 20px;
        }
        .form-input label {
            font-weight: bold;
        }
        .form-btn {
            width: 100%;
            padding: 10px;
            background-color: #7b2cff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-btn:hover {
            background-color: #4b1aff;
        }
    </style>
</head>
<body>

<div class="container login-container">
    <div class="login-box row">
        <!-- Columna izquierda con logo -->
        <div class="left-box col-md-5">
            <img src="images/AkiExpress.png" alt="Aki Express Logo">
            <h2>MULTISERVICIOS AKI EXPRESS</h2>
        </div>

        <!-- Columna derecha con formulario -->
        <div class="right-box col-md-7">
            <h1>Inicio de Sesión</h1>
            <form action="listadoProductos.jsp" method="post" class="needs-validation" novalidate>
                <div class="form-input mb-3">
                    <label for="username" class="form-label">Usuario *</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Ingresa tu usuario" required>
                    <div class="invalid-feedback">
                        Por favor ingresa un usuario.
                    </div>
                </div>
                <div class="form-input mb-3">
                    <label for="password" class="form-label">Contraseña *</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Ingresa tu contraseña" required>
                    <div class="invalid-feedback">
                        Por favor ingresa tu contraseña.
                    </div>
                </div>
                <button type="submit" class="form-btn">Ingresar</button>

                <!-- Mostrar error si existe -->
                <div class="form-footer mt-3">
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <div class="alert alert-danger">
                        <%= error %>
                    </div>
                    <% } %>
                </div>
            </form>

            <!-- Enlaces adicionales -->
            <div class="form-footer mt-3">
                <p>¿No tienes cuenta? <a href="register.jsp">Regístrate</a></p>
                <p><a href="forgotPassword.jsp">¿Olvidaste tu contraseña?</a></p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validación de Bootstrap -->
<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>

</body>
</html>