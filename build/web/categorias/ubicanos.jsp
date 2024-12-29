<%@page import="java.sql.*"%>
<%@page import="conexion.AccesoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Issac Newton::Ubicanos</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" target="_blank" href="../assets/css/ubicanos.css" />
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
                <% }%>
            </ul>
        </div>

        <!-- Imagen inicial -->  
        <section class="hero-section">
            <div class="content-hero">
                <h2>Descubre donde encontrarnos</h2>
                <p>
                    ¡Te esperamos con los brazos abiertos!
                </p>
                <a href="nosotros.jsp"><button>Conocenos</button></a>
            </div>
        </section>
        <h1 class="title-ubicanos">Infórmate sobre como llegar hasta nosotros</h1>
        <div class="container">
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3973.4866263451167!2d-80.66876372536701!3d-5.185909594791589!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x904a1bf2a3ed2261%3A0xfcdd36cc8b15c37b!2sI.E.P.%20Isaac%20Newton%20%22La%20Alternativa%22!5e0!3m2!1ses!2ses!4v1719030136038!5m2!1ses!2ses"
                        allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

            </div>
            <div class="contact-form">
                <h2>Contáctanos</h2>
                <form action="../SvContacto" method="post">
                    <label for="name">Nombre y Apellidos</label>
                    <input type="text" id="name" name="txtnombre_apellido" required>

                    <label for="email">Correo Electrónico</label>
                    <input type="email" id="email" name="txtemail" required>

                    <label for="message">Mensaje</label>
                    <textarea id="message" name="txtmsj" rows="4" required></textarea>

                    <button type="submit" name="txtenviar">Enviar</button>
                </form>
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
    </body>
</html>
