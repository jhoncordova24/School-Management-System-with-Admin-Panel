<%-- 
    Document   : nosotros
    Created on : 23 may 2024, 10:48:58
--%>
<%@page import="java.sql.*"%>
<%@page import="conexion.AccesoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Issac Newton::Nosotros</title>
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" target="_blank" href="../assets/css/nosotros.css" />
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
                        <a href="categorias/perfil.jsp" style="font-size: 16px;">Ver perfil</a>
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
                    <a href="../SvCerrar">Salir</a>
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
                <h2>Explora nuestra historia</h2>
                <p>
                    Bienvenido a nuestro espacio. Descubre quiénes somos y cómo hemos llegado hasta aquí.
                </p>
                <a href="ubicanos.jsp"><button>Ubicanos</button></a>
            </div>
        </section>

        <!-- Seccion Quienes Somos -->  
        <div class="nosotros-section">
            <h1 class="title-about">¿Quienes somos?</h1>
            <p class="tex-about">Bienvenidos a nuestro colegio Isaac Newton, una institución educativa dedicada a la formación integral de niños 
                y niñas en sus primeros años de aprendizaje.Nuestro colegio, aunque joven en su trayectoria, se ha establecido con la firme convicción 
                de ofrecer una educación de calidad que fomente el desarrollo académico, emocional y social de nuestros estudiantes.</p>
            <div class="container-cards">
                <div class="card">
                    <div class="content">
                        <p class="heading">Nuestra misión</p>

                        <p class="para">
                            La Institución Educativa Particular Isaac Newton tiene como misión brindar una educación integral de calidad, 
                            basada en valores éticos y morales, promoviendo el desarrollo intelectual, 
                            emocional y social de nuestros estudiantes, con el compromiso de formar ciudadanos responsables, 
                            críticos y comprometidos con su entorno.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <div class="content">
                        <p class="heading">Nuestra visión</p>
                        <p class="para">
                            Aspiramos a ser reconocidos como una institución líder en la educación inicial y primaria, destacándonos por nuestro enfoque innovador y 
                            nuestras prácticas pedagógicas centradas en el estudiante. 
                            Queremos preparar a nuestros alumnos para que sean ciudadanos comprometidos y preparados para enfrentar los desafíos del futuro.
                        </p>
                    </div>
                </div>

            </div>
        </div>

        <!-- Historia del colegio -->  
        <div class="historia-container">
            <div class="historia-img">
                <img src="../assets/img/img_nosotros/cole.jpg" alt="Nuestra historia">
            </div>
            <div class="historia-texto">
                <h2>Conoce nuestra historia</h2>
                <p>La Institución Educativa Particular “Isaac Newton”, ubicado en la Av. San Martín N° 233 del A.H. San Martín, se constituyó el 25 de Enero de 2007, 
                    mediante Resolución Directoral Regional N° 0179 en los Niveles de Inicial y Primaria de menores.
                    Se inicia las actividades educativas, siendo Director el Prof. Edgar Luis Vargas Aguirre, conjuntamente con una plana docente capacitada y 
                    con experiencia suficiente como para enfrentar este nuevo reto, con diferentes alternativas de enseñanza para los educandos de nuestro sector.
                    Nuestro desempeño no debe aminorar, todo lo contrario debemos continuar dándole calidad y la efectividad educativa en nuestros educandos. 
                    Por ello he creído conveniente tomar en cuenta el siguiente objetivo, lema y eslogan respectivamente:
                </p>
            </div>
        </div>

        <!-- Objetivo, lema y slogan -->  
        <div class="lemas">
            <div class="notification">
                <div class="notiglow"></div>
                <div class="notiborderglow"></div>
                <div class="notititle">Objetivo</div>
                <div class="notibody">Crecer en la calidad y efectividad educativa.</div>
            </div>
            <div class="notification">
                <div class="notiglow"></div>
                <div class="notiborderglow"></div>
                <div class="notititle">Lema</div>
                <div class="notibody">Esfuerzo, Seguridad y Futuro.</div>
            </div>
            <div class="notification">
                <div class="notiglow"></div>
                <div class="notiborderglow"></div>
                <div class="notititle">Slogan</div>
                <div class="notibody">Tu nueva alternativa.</div>
            </div>
        </div>

        <!-- Slider con imagenes de las ceremonias -->  
        <div class="container">
            <h1 class="title-slider">¡Te invitamos a dar un vistazo a nuestras ceremonias escolares! </h1>
            <div class="wrapper">
                <input type="radio" name="slide" id="one" checked>
                <input type="radio" name="slide" id="two">
                <input type="radio" name="slide" id="three">
                <input type="radio" name="slide" id="four">
                <input type="radio" name="slide" id="five">
                <div class="img img-1">
                    <img src="../assets/img/img_nosotros/about1.jpg" alt="">
                </div>
                <div class="img img-2">
                    <img src="../assets/img/img_nosotros/about2.jpg" alt="">
                </div>
                <div class="img img-3">
                    <img src="../assets/img/img_nosotros/about3.jpg" alt="">
                </div>
                <div class="img img-4">
                    <img src="../assets/img/img_nosotros/about4.jpg" alt="">
                </div>
                <div class="img img-5">
                    <img src="../assets/img/img_nosotros/about5.jpg" alt="">
                </div>
                <div class="sliders">
                    <label for="one" class="one"></label>
                    <label for="two" class="two"></label>
                    <label for="three" class="three"></label>
                    <label for="four" class="four"></label>
                    <label for="five" class="five"></label>
                </div>
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

