document.addEventListener("DOMContentLoaded", function () {
    const currentLocation = window.location.pathname;

    // Ruta base del proyecto
    const basePath = "/ColegioIsaacNewton/";

    // Selecciona todos los enlaces dentro de la navegación
    const links = document.querySelectorAll("nav ul li a");

    links.forEach((link) => {
        const linkPath = new URL(link.href).pathname;
        if (linkPath === currentLocation || (currentLocation === basePath && linkPath.endsWith("index.jsp"))) {
            link.classList.add("active");
        }
    });
});