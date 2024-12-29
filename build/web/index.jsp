<%@page import="java.sql.*"%>
<%@page import="conexion.AccesoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Issac Newton::Inicio</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" target="_blank" href="assets/css/index.css" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>

        <!-- Cabecera de página -->  
        <nav>
            <div class="logo">
                <img src="assets/img/logo.png" alt="logo" />
                <h1>Colegio Isaac Newton</h1>
            </div>
            <ul>
                <li>
                    <a href="index.jsp" data-page="index.jsp">Inicio</a>
                </li>
                <li>
                    <a href="categorias/nosotros.jsp">Nosotros</a>
                </li>
                <li>
                    <a href="categorias/comunidad.jsp">Comunidad</a>
                </li>
                <li>
                    <a href="categorias/ubicanos.jsp">Ubícanos</a>
                </li>
                <% if (session.getAttribute("name") != null) {%>
                <li class="dropdown">
                    <a href="#" class="dropbtn">Hola, <%= session.getAttribute("name")%><span class="material-icons">arrow_drop_down</span></a>
                    <div class="dropdown-content">
                        <!--<a href="categorias/perfil.jsp" style="font-size: 16px;">Ver perfil</a> --> 
                        <%
                            int id_rol = (int) session.getAttribute("id_rol");
                            if (id_rol == 2) {
                        %>
                        <a href="categorias/administrador/adminUsuarios.jsp" style="font-size: 14px;">Administrar</a>
                        <% } %>
                        <a href="SvCerrar" style="font-size: 14px;">Cerrar sesión</a>
                    </div>
                </li>
                <% } else { %>
                <li>
                    <a href="categorias/login.jsp">Únete</a>
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
                    <a href="index.jsp" data-page="index.jsp">Inicio</a>
                </li>
                <li>
                    <a href="categorias/nosotros.jsp">Nosotros</a>
                </li>
                <li>
                    <a href="categorias/comunidad">Comunidad</a>
                </li>
                <li>
                    <a href="categorias/ubicanos.jsp">Ubícanos</a>
                </li>
                <% if (session.getAttribute("name") != null) {%>
                <li>
                    <a href="categorias/perfil.jsp">Hola, <%= session.getAttribute("name")%></a>
                </li>
                <%
                    int id_rol = (int) session.getAttribute("id_rol");
                    if (id_rol == 2) { // Mostrar opción de administrar solo si id_rol es 2
                %>
                <li>
                    <a href="admin.jsp">Administrar</a>
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

        <!-- Imagen Inicial y frase -->  
        <section class="hero-section">
            <div class="content">
                <h2>I. E. P - Issac Newton</h2>
                <p>
                    Bienvenido a la familia de la I.E.P Isaac Newton "La Nueva Alternativa" en Piura, donde el aprendizaje se fusiona con la innovación, 
                    la excelencia y el compromiso con el futuro de nuestros estudiantes. 
                </p>
                <a href="categorias/nosotros.jsp"><button>Conocenos</button></a>
            </div>
        </section>

        <!-- Apartado de comunidad con los eventos o noticias -->  
        <div class="comunidad">
            <div class="title-comunidad">
                <h1>Descubre nuestra comunidad</h1>
                <p> ¡Explora nuestras historias y únete a nosotros en este viaje educativo lleno de descubrimientos y oportunidades!</p>
            </div>
            <div class="container-cards-co">
                <%
                    Connection con = AccesoBD.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM actividades ORDER BY fecha_publicacion DESC LIMIT 3");

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                %>
                <div class="card-container">
                    <div class="card">
                        <div class="img-content">
                            <img src="<%=rs.getString(3)%>" alt="alt"/>
                        </div>
                        <div class="content">
                            <p class="heading"><%=rs.getString(4)%></p>
                            <p>
                                <%=rs.getString(5)%>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <a href="categorias/comunidad.jsp"<button class="fancy-button">Ver más</button></a>
        </div>


        <!--Acerca de nosotros -->  
        <div clas="nosotros">
            <h1 class="title-nosotros">¿Quienes somos?</h1>
            <p class="p-nosotros">Descubre nuestra historia y el compromiso con la excelencia educativa.</p>
            <section id="about-section">
                <!-- about left  -->
                <div class="about-left">
                    <img src="assets/img/acerca.jpg" alt="About Img"/>
                </div>
                <!-- about right  -->
                <div class="about-right">
                    <h1>Acerca de nosotros</h1>
                    <p>La Institución Educativa Particular "Isaac Newton", ubicada en la Av. San Martín N° 233 del A.H. San Martín,
                        fue fundada el 25 de Enero de 2007, autorizada para los niveles de Inicial y Primaria. Desde sus inicios, 
                        bajo la dirección del Prof. Edgar Luis Vargas Aguirre 
                        y un equipo docente altamente capacitado, se ha comprometido a brindar una educación de calidad a los estudiantes de la zona.
                    </p>
                    <div class="address">
                        <ul>
                            <li>
                                <span class="address-logo">
                                    <i class="fas fa-paper-plane"></i>
                                </span>
                                <p>Dirección</p>
                                <span class="saprater">:</span>
                                <p>Av. San Martín N° 233 del A.H. San Martín, Piura, Perú.</p>
                            </li>
                            <li>
                                <span class="address-logo">
                                    <i class="fas fa-phone-alt"></i>
                                </span>
                                <p>Teléfono</p>
                                <span class="saprater">:</span>
                                <p>938 108 776</p>
                            </li>
                            <li>
                                <span class="address-logo">
                                    <i class="far fa-envelope"></i>
                                </span>
                                <p>Gmail</p>
                                <span class="saprater">:</span>
                                <p>iepisaacnewton2007@gmail.com</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
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
        <script src="assets/js/link.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>
