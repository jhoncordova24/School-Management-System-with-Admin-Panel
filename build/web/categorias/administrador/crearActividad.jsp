<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="conexion.AccesoBD" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>
        <title>Crear Actividad</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700&display=swap");
            body {
                font-family: "Poppins", sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                width: 80%;
                max-width: 900px; /* Ajusta el ancho máximo según tus necesidades */
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: 0 auto; /* Centra horizontalmente el contenedor */
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form {
                width: 100%; /* Ocupa todo el ancho disponible dentro del contenedor */
                max-width: 850px; /* Ajusta el ancho máximo según tus necesidades */
                margin: 0 auto; /* Centra horizontalmente el formulario dentro del contenedor */
            }

            .form label {
                margin-bottom: 8px;
                font-weight: bold;
            }

            .form input, .form textarea, .form select {
                font-family: "Poppins", sans-serif;
                width: 100%;
                max-width: 100%; /* Ocupa todo el ancho disponible del formulario */
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            #txtdescripcion-label {
                display: block; /* Asegura que el label ocupe una línea completa */
                margin-bottom: 8px;
                font-weight: bold;
            }

            #txtdescripcion {
                font-family: "Poppins", sans-serif;
                width: 100%;
                max-width: 100%; /* Ocupa todo el ancho disponible */
                height: 120px; /* Altura ajustada para mostrar varias líneas de texto */
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .form button {
                background-color: #E67E22;
                color: #fff;
                font-weight: bold;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 16px;
                margin-top: 10px;
            }

            .form button:hover {
                background-color: gray;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>Crear Nueva Actividad</h1>
            <div class="form">
                <%-- Mostrar formulario para crear una nueva actividad --%>
                <form action="crearActividad.jsp" method="post">
                    <label for="txtfecha">Fecha de Publicación:</label>
                    <input type="date" id="txtfecha" name="txtfecha">
                    <br>
                    <label for="txtcategoria">Categoría:</label>
                    <select id="txtcategoria" name="txtcategoria">
                        <option value="Festividad">Festividad</option>
                        <option value="Evento">Evento</option>
                        <option value="Noticia">Noticia</option>
                    </select>
                    <br>
                    <label for="txtimg">Imagen:</label>
                    <input type="text" id="txtimg" name="txtimg">
                    <br>
                    <label for="txttitulo">Título:</label>
                    <input type="text" id="txttitulo" name="txttitulo">
                    <br>
                    <label id="txtdescripcion-label" for="txtdescripcion">Descripción:</label>
                    <textarea id="txtdescripcion" name="txtdescripcion"></textarea>
                    <br>

                    <button type="submit">Crear Actividad</button>
                    <button type="button" onclick="location.href = 'adminComunidad.jsp';" class="btn-back" style="background-color: gray; margin-left: 5px;">Regresar</button>
                </form>

            </div>

            <%
                // Procesar la creación si se ha enviado el formulario
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String nuevaFecha = request.getParameter("txtfecha");
                    String nuevaCategoria = request.getParameter("txtcategoria");
                    String nuevaImg = request.getParameter("txtimg");
                    String nuevoTitulo = request.getParameter("txttitulo");
                    String nuevaDescripcion = request.getParameter("txtdescripcion");

                    Connection con = null;
                    PreparedStatement ps = null;

                    try {
                        con = AccesoBD.getConnection();
                        ps = con.prepareStatement("INSERT INTO actividades (fecha_publicacion, categoria, img_actividad, titulo, descripcion) VALUES (?, ?, ?, ?, ?)");
                        ps.setString(1, nuevaFecha);
                        ps.setString(2, nuevaCategoria);
                        ps.setString(3, nuevaImg);
                        ps.setString(4, nuevoTitulo);
                        ps.setString(5, nuevaDescripcion);

                        int filasInsertadas = ps.executeUpdate();

                        if (filasInsertadas > 0) {
                            response.sendRedirect("adminComunidad.jsp");
                        } else {
                            out.println("Error al crear la actividad.");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error SQL al crear la actividad: " + e.getMessage());
                    } finally {
                        try {
                            if (ps != null) {
                                ps.close();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        try {
                            if (con != null) {
                                con.close();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </div>
        <script>
            // Establecer la fecha actual en el campo de fecha
            window.onload = function () {
                var today = new Date();
                var day = ("0" + today.getDate()).slice(-2);
                var month = ("0" + (today.getMonth() + 1)).slice(-2);
                var todayFormatted = today.getFullYear() + "-" + month + "-" + day;
                document.getElementById('txtfecha').value = todayFormatted;
            };
        </script>
    </body>
</html>
