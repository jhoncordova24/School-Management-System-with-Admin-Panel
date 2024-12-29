<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<%@ page import="conexion.AccesoBD" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'>
        <title>Eliminar Actividad</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
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
                width: 80%;
                max-width: 600px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: 0 auto;
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form {
                width: 100%;
                max-width: 500px;
                margin: 0 auto;
            }

            .form label {
                margin-bottom: 8px;
                font-weight: bold;
            }

            .form button {
                background-color: #dc3545;
                color: #fff;
                font-weight: bold;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 16px;
                margin-top: 10px;
                display: block;
                width: 100%;
            }

            .form button:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Eliminar Actividad</h1>
            <div class="form">
                <%
                    String actividadIdStr = request.getParameter("id");
                    if (actividadIdStr != null && !actividadIdStr.isEmpty()) {
                        int actividadId = Integer.parseInt(actividadIdStr);
                        Connection con = null;
                        PreparedStatement ps = null;

                        try {
                            con = AccesoBD.getConnection();
                            ps = con.prepareStatement("DELETE FROM actividades WHERE id_actividad = ?");
                            ps.setInt(1, actividadId);
                            int filasEliminadas = ps.executeUpdate();

                            if (filasEliminadas > 0) {
                                response.sendRedirect("adminComunidad.jsp");
                            } else {
                                out.println("Error al eliminar la actividad.");
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("Error SQL al eliminar la actividad: " + e.getMessage());
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
                    } else {
                        out.println("ID de actividad no proporcionado.");
                    }
                %>
            </div>
        </div>
    </body>
</html>
