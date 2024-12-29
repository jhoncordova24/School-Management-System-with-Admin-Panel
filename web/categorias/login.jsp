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
        <title>Issac Newton::Login</title>
        <link rel="stylesheet" href="../assets/css/login.css">
    </head>
    <body>
        <div class="wrapper">
            <form action="../SvLogin" method="post">
                <h2>Inicia Sesión</h2>  
                <div class="input-field">
                    <input type="text" required name="txtcorreo">
                    <label>Ingresa tu correo electrónico</label>
                </div>
                <div class="input-field">
                    <input type="password" required name="txtclave">
                    <label>Ingresa tu contraseña</label>
                </div>
                <button type="submit" name="enviar">Iniciar Sesión</button>
                <div class="register">
                    <p>¿No tienes una cuenta? <a href="register.jsp">Registrate</a></p>
                </div>
            </form>
        </div>
    </body>
</html>

