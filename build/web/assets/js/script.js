const mobileNav = document.querySelector(".hamburger");
const navbar = document.querySelector(".menubar");

const toggleNav = () => {
  navbar.classList.toggle("active");
  mobileNav.classList.toggle("hamburger-active");
};

// Agregamos un evento de clic al ícono del hamburguesa para abrir y cerrar el menú
mobileNav.addEventListener("click", toggleNav);

// Agregamos un evento de cambio de tamaño de la ventana para cerrar el menú si la pantalla se agranda más allá de 790px
window.addEventListener("resize", () => {
  if (window.innerWidth > 790) {
    navbar.classList.remove("active");
    mobileNav.classList.remove("hamburger-active");
  }
});




