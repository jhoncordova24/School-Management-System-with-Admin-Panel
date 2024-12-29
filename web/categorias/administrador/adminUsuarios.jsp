<%@page import="java.sql.*"%>
<%@page import="conexion.AccesoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!----======== CSS ======== -->
        <link rel="stylesheet" href="../../assets/css/admin.css">

        <!----===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <title>Panel de administrador</title>

    </head>
    <body>
        <nav>
            <div class="logo-name">
                <div class="logo-image">
                    <img src="../../assets/img/logo.png" alt="">
                </div>

                <span class="logo_name">Isaac Newton</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    <li><a href="adminUsuarios.jsp">
                            <i class="uil uil-users-alt"></i>
                            <span class="link-name">Usuarios</span>
                        </a></li>
                    <li><a href="adminComunidad.jsp">
                            <i class="uil uil-balance-scale"></i>
                            <span class="link-name">Actividades</span>
                        </a></li>
                    <li><a href="adminContacto.jsp">
                            <i class="uil uil-comment-alt-medical"></i>
                            <span class="link-name">Contáctanos</span>
                        </a></li>
                </ul>

                <ul class="logout-mode">
                    <li><a href="../../index.jsp">
                            <i class="uil uil-signout"></i>
                            <span class="link-name">Regresar</span>
                        </a></li>


                </ul>
            </div>
        </nav>

        <section class="dashboard">
            <div class="dash-content">
                <div class="activity">
                    <div class="title">
                        <i class="uil uil-users-alt"></i>
                        <span class="text">Administrar Usuarios</span>
                    </div>

                    <div class="activity-data">
                        <%
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;

                            try {
                                con = AccesoBD.getConnection();
                                ps = con.prepareStatement("SELECT * FROM usuario WHERE id_rol = 1");
                                rs = ps.executeQuery();

                                // Comienza la tabla
                        %>
                        <table>
                            <thead>
                                <tr>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Teléfono</th>
                                    <th>Correo Electrónico</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%        boolean hayUsuarios = false;
                                    while (rs.next()) {
                                        hayUsuarios = true;
                                %>
                                <tr>
                                    <td><%= rs.getString(2)%></td>
                                    <td><%= rs.getString(3)%></td>
                                    <td><%= rs.getString(4)%></td>
                                    <td><%= rs.getString(5)%></td>
                                    <td>
                                        <button onclick="editarUsuario(<%= rs.getInt(1)%>)" type="button" style="background-color: gray; color: white; border: none; padding: 8px 12px; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin: 2px; cursor: pointer; border-radius: 4px;">Editar</button>
                                        <button onclick="eliminarUsuario(<%= rs.getInt(1)%>)" style="background-color: #E67E22; color: white; border: none; padding: 8px 12px; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin: 2px; cursor: pointer; border-radius: 4px;">Eliminar</button>
                                    </td>
                                </tr>
                                <% } %>

                                <% if (!hayUsuarios) { %>
                                <tr>
                                    <td colspan="5" style="text-align: center;">No se encontraron usuarios</td>
                                </tr>
                                <% } %>
                            </tbody>

                        </table>
                        <%
                            } catch (SQLException e) {
                                e.printStackTrace(); // Manejo de errores SQL
                            } finally {
                                // Cerrar ResultSet, PreparedStatement y Connection
                                if (rs != null) {
                                    try {
                                        rs.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                                if (ps != null) {
                                    try {
                                        ps.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                                if (con != null) {
                                    try {
                                        con.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>             
        <script>
                                            function eliminarUsuario(id) {
                                                Swal.fire({
                                                    backdrop: false,
                                                    title: '¿Estás seguro?',
                                                    text: "¡No podrás revertir esto!",
                                                    icon: 'warning',
                                                    showCancelButton: true,
                                                    confirmButtonColor: '#E67E22',
                                                    cancelButtonColor: 'gray',
                                                    confirmButtonText: 'Sí, eliminarlo!'

                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        window.location.href = 'eliminarUsuario.jsp?id=' + id;
                                                    }
                                                })
                                            }
        </script>
        <script>
            function editarUsuario(usuarioId) {
                window.location.href = 'editarUsuario.jsp?id=' + usuarioId;
            }
        </script>

    </body>
</html>