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
        <style>
            .crearActividad {
                position: absolute;
                top: 20px; /* Ajusta la posición verticalmente según necesites */
                right: 20px; /* Ajusta la posición horizontalmente según necesites */
                padding: 10px 20px;
                background-color: #E67E22;
                color: white;
                text-decoration: none; /* Quita la decoración de subrayado del enlace */
                border: none;
                border-radius: 4px;
            }
            @media screen and (max-width: 768px) {
                .crearActividad {
                    font-size: 14px;
                    position: relative; /* Cambia a posición relativa en pantallas más pequeñas */
                    top: auto;
                    right: auto;
                    margin-top: 10px; /* Añade margen arriba para separarlo */
                    margin-right: auto; /* Centra horizontalmente */
                    display: block;
                    text-align: center;
                }
            }
            .boton-eliminar {
                background-color: #E67E22;
                color: white;
                border: none;
                padding: 8px 12px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 13px;
                margin: 2px;
                cursor: pointer;
                border-radius: 4px;
            }

            .boton-editar {
                background-color: gray;
                color: white;
                border: none;
                padding: 8px 12px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 13px;
                margin: 2px;
                cursor: pointer;
                border-radius: 4px;
            }
        </style>
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
                        <i class="uil uil-balance-scale"></i>
                        <span class="text">Administrar Actividades</span>
                        <a href="crearActividad.jsp" class="crearActividad" style="float: right;"> + Crear Actividad</a>
                    </div>

                    <div class="activity-data">
                        <%
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;

                            try {
                                con = AccesoBD.getConnection();
                                ps = con.prepareStatement("SELECT * FROM actividades ORDER BY fecha_publicacion DESC");
                                rs = ps.executeQuery();

                                // Comienza la tabla
                        %>
                        <table>
                            <thead>
                                <tr>
                                    <th>Fecha de publicación</th>
                                    <th>Tipo de actividad</th>
                                    <th>Imagen</th>
                                    <th>Titulo</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%        boolean hayActividades = false; 
                                    while (rs.next()) {
                                        hayActividades = true;
                                %>
                                <tr>
                                    <td><%= rs.getString(6)%></td>
                                    <td><%= rs.getString(2)%></td>
                                    <td><img src="<%= rs.getString(3)%>"></td>
                                    <td><%= rs.getString(4)%></td>
                                    <td>
                                        <button onclick="editarActividad(<%= rs.getInt(1)%>)" type="button" class="boton-editar">Editar</button>
                                        <button onclick="eliminarActividad(<%= rs.getInt(1)%>)" class="boton-eliminar">Eliminar</button>
                                    </td>
                                </tr>
                                <% } %>

                                <% if (!hayActividades) { %>
                                <tr>
                                    <td colspan="5" style="text-align: center;">No se encontraron actividades</td>
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
                function editarActividad(actividadId) {
                    window.location.href = 'editarActividad.jsp?id=' + actividadId;
                }

                function eliminarActividad(id) {
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
                            window.location.href = 'eliminarActividad.jsp?id=' + id;
                        }
                    })
                }
        </script>

    </body>
</html>