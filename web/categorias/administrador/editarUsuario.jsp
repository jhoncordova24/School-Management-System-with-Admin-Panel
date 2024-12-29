<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="conexion.AccesoBD" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Usuario</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap");
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
                width: 450px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .form label {
                margin-bottom: 8px;
                font-weight: bold;
            }

            .form input[type="email"],
            .form input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 25px;
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
                background-color:  gray;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Editar Usuario</h1>
            <%
                String usuarioIdStr = request.getParameter("id");

                // Obtener datos actuales del usuario para pre-cargar el formulario
                String actualCorreo = "";
                String actualTelefono = "";

                if (usuarioIdStr != null && !usuarioIdStr.isEmpty()) {
                    int usuarioId = Integer.parseInt(usuarioIdStr);
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        con = AccesoBD.getConnection();
                        ps = con.prepareStatement("SELECT correo, telefono FROM usuario WHERE id = ?");
                        ps.setInt(1, usuarioId);
                        rs = ps.executeQuery();

                        if (rs.next()) {
                            actualCorreo = rs.getString("correo");
                            actualTelefono = rs.getString("telefono");
                        } else {
                            out.println("El usuario con ID " + usuarioId + " no existe.");
                            // Aquí podrías redirigir o manejar el error según necesites
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error SQL al obtener datos del usuario: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
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
                } else {
                    out.println("ID de usuario no proporcionado.");
                }
            %>
            <div class="form">
                <%-- Mostrar formulario para editar el correo electrónico y teléfono --%>
                <form action="editarUsuario.jsp" method="post">
                    <input type="hidden" name="id" value="<%= usuarioIdStr%>">
                    <label for="txtcorreo">Nuevo Correo Electrónico:</label>
                    <input type="email" id="txtcorreo" name="txtcorreo" value="<%= actualCorreo%>">
                    <br>
                    <label for="txttelefono">Nuevo Teléfono:</label>
                    <input type="text" id="txttelefono" name="txttelefono" value="<%= actualTelefono%>">
                    <br>
                    <button type="submit">Guardar cambios</button>
                    <button type="button" onclick="location.href = 'adminUsuarios.jsp';" class="btn-back" style="background-color: gray; margin-left: 5px;">Regresar</button>
                </form>
            </div>

            <%
                // Procesar la actualización si se ha enviado el formulario
                if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("id") != null) {
                    int usuarioId = Integer.parseInt(request.getParameter("id"));
                    String nuevoCorreo = request.getParameter("txtcorreo");
                    String nuevoTelefono = request.getParameter("txttelefono");

                    Connection con = null;
                    PreparedStatement ps = null;

                    try {
                        con = AccesoBD.getConnection();
                        ps = con.prepareStatement("UPDATE usuario SET correo = ?, telefono = ? WHERE id = ?");
                        ps.setString(1, nuevoCorreo);
                        ps.setString(2, nuevoTelefono);
                        ps.setInt(3, usuarioId);

                        int filasActualizadas = ps.executeUpdate();

                        if (filasActualizadas > 0) {
                            response.sendRedirect("adminUsuarios.jsp");
                        } else {
                            out.println("Error al actualizar el usuario.");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("Error SQL al actualizar el usuario: " + e.getMessage());
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
    </body>
</html>
