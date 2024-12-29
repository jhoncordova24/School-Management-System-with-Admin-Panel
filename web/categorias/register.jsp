<%@page import="controller.UsuarioController"%>
<%@page import="modelo.Usuario"%>
<%@page import="conexion.AccesoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Issac Newton::Register</title>
        <link rel="stylesheet" href="../assets/css/register.css">
    </head>
    <body>
        <div class="wrapper">
            <form action="../SvUsuario" method="post">
                <h2>Regístrate</h2>
                <div class="input-field">
                    <input type="text" required name="txtnombre" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" title="Ingresa solo letras y espacios">
                    <label>Ingresa tu nombre</label>
                </div>
                <div class="input-field">
                    <input type="text" required name="txtapellido" pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" title="Ingresa solo letras y espacios">
                    <label>Ingresa tus apellidos</label>
                </div>
                <div class="input-field">
                    <input type="tel" required name="txtcelu" pattern="[0-9]+" title="Ingresa solo números">
                    <label>Ingresa tu número telefónico</label>
                </div>
                <div class="input-field">
                    <input type="email" required name="txtcorreo">
                    <label>Ingresa tu correo electrónico</label>
                </div>
                <div class="input-field">
                    <input type="password" required name="txtclave" minlength="6">
                    <label>Ingresa tu contraseña (mínimo 6 caracteres)</label>
                </div>
                <button type="submit" name="enviar">Registrarse</button>
                <div class="register">
                    <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia Sesión</a></p>
                </div>
            </form>

        </div>
    </body>
</html>

