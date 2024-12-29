<%@page import="java.sql.*"%>
<%@page import="conexion.AccesoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Issac Newton::Comunidad</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" target="_blank" href="../assets/css/comunidad.css" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
    <body>

        <!-- Cabecera de página -->  
        <nav>
            <div class="logo">
                <img src="../assets/img/logo.png" alt="logo" />
                <h1>Colegio Isaac Newton</h1>
            </div>
            <ul>
                <li>
                    <a href="../index.jsp" data-page="index.jsp">Inicio</a>
                </li>
                <li>
                    <a href="nosotros.jsp">Nosotros</a>
                </li>
                <li>
                    <a href="comunidad.jsp">Comunidad</a>
                </li>
                <li>
                    <a href="ubicanos.jsp">Ubícanos</a>
                </li>
                <% if (session.getAttribute("name") != null) {%>
                <li class="dropdown">
                    <a href="#" class="dropbtn">Hola, <%= session.getAttribute("name")%><span class="material-icons">arrow_drop_down</span></a>
                    <div class="dropdown-content">
                        <!-- <a href="categorias/perfil.jsp" style="font-size: 16px;">Ver perfil</a>-->  
                        <%
                            int id_rol = (int) session.getAttribute("id_rol");
                            if (id_rol == 2) {
                        %>
                        <a href="administrador/adminUsuarios.jsp" style="font-size: 14px;">Administrar</a>
                        <% } %>
                        <a href="../SvCerrar" style="font-size: 14px;">Cerrar sesión</a>
                    </div>
                </li>
                <% } else { %>
                <li>
                    <a href="login.jsp">Únete</a>
                </li>
                <% } %>
            </ul>
            <!-- Hamburger al achicar la pantalla --> 
            <div class="hamburger">
                <span class="line"></span>
                <span class="line"></span>
                <span class="line"></span>
            </div>
        </nav>
        <div class="menubar">
            <ul>
                <li>
                    <a href="../index.jsp" data-page="index.jsp">Inicio</a>
                </li>
                <li>
                    <a href="nosotros.jsp">Nosotros</a>
                </li>
                <li>
                    <a href="comunidad.jsp">Comunidad</a>
                </li>
                <li>
                    <a href="ubicanos.jsp">Ubícanos</a>
                </li>
                <% if (session.getAttribute("name") != null) {%>
                <li>
                    <a href="#">Hola, <%= session.getAttribute("name")%></a>
                </li>
                <%
                    int id_rol = (int) session.getAttribute("id_rol");
                    if (id_rol == 2) { // Mostrar opción de administrar solo si id_rol es 2
                %>
                <li>
                    <a href="administrador/adminUsuarios.jsp">Administrar</a>
                </li>
                <% } %>
                <li>
                    <a href="SvCerrar">Salir</a>
                </li>
                <% } else { %>
                <li>
                    <a href="categorias/login.jsp">Únete</a>
                </li>
                <% } %>
            </ul>
        </div>

        <!-- Imagen inicial -->  
        <section class="hero-section">
            <div class="content-hero">
                <h2>Disfruta de nuestras actividades</h2>
                <p>
                    Experiencias que enriquecen la vida educativa de nuestros estudiantes.
                </p>
                <a href="#"><button>Ubícanos</button></a>
            </div>
        </section>

        <!-- Sección comunidad -->  
        <div class="container">
            <div class="row filter-buttons" id="filter-buttons">
                <div class="col-12">
                    <button class="btn active" data-filter="all">Mostrar todo</button>
                    <button class="btn" data-filter="festividad">Festividades</button>
                    <button class="btn" data-filter="noticia">Noticias</button>
                    <button class="btn" data-filter="evento">Eventos</button>
                </div>
            </div>
            <div class="row filterable-cards" id="filterable-cards">
                <%
                    Connection con = AccesoBD.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM actividades ORDER BY fecha_publicacion DESC");

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                %>
                <div class="card show" data-name="<%=rs.getString(2)%>">
                    <img src="<%=rs.getString(3)%>" alt="img">
                    <div class="card-body">
                        <h6 class="card-title"><%=rs.getString(4)%></h6>
                        <p class="card-text"><%=rs.getString(5)%></p>
                        <span class="span-card">Publicado: <%=rs.getString(6)%></span>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <!-- Pie de página --> 
        <div class="container-footer">	
            <footer>
                <div class="logo-footer">
                    <img src="img/logo.png" alt="">
                </div>
                <div class="descripcion">
                    <p>En nuestra comunidad educativa seguiremos en nuestro proceso de consolidación y
                        responsabilizarnos en la tarea de caminar juntos en la trilogía educativa (Docente – Padre de Familia – Alumno) 
                        en un proyecto educativo teniendo en cuenta el objetivo principal.</p>
                </div>
                <div class="redes-footer">
                    <a href="https://www.facebook.com/isaacnewtonpiura" style="text-decoration: none;"><i class="fab fa-facebook-f icon-redes-footer"></i></a>
                    <a href="tel:+51938108776" style="text-decoration: none;"><i class="fa-solid fa-phone icon-redes-footer"></i></a>
                    <a href="mailto:iepisaacnewton2007@gmail.com" style="text-decoration: none;"><i class="fa-solid fa-envelope icon-redes-footer"></i></a>
                </div>
                <hr>
                <h4>© 2024 Colegio Isaac Newton - Todos los Derechos Reservados</h4>
            </footer>
        </div>
        <script src="../assets/js/link.js"></script>
        <script src="../assets/js/script.js"></script>
        <script src="../assets/js/comunidad.js"></script>
    </body>
</html>

