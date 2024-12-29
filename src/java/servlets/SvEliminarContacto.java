/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import controller.ContactoController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Contacto;

/**
 *
 * @author jhon cordova
 */
@WebServlet(name = "SvEliminarContacto", urlPatterns = {"/SvEliminarContacto"})
public class SvEliminarContacto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEliminarContacto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEliminarContacto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Verificar si se envió el formulario de eliminación
        if (request.getParameter("txteliminar") != null) {
            // Obtener el ID del contacto a eliminar desde el formulario
            int idContacto = Integer.parseInt(request.getParameter("contacto_id"));

            // Llamar al método del controlador para eliminar el contacto
            int estatus = ContactoController.eliminarContacto(idContacto);

            // Verificar si se eliminó correctamente
            if (estatus > 0) {
                // Contacto eliminado correctamente, podrías redirigir o mostrar un mensaje de éxito
                response.sendRedirect("categorias/administrador/adminContacto.jsp");
            } else {
                // Error al eliminar el contacto, podrías redirigir o mostrar un mensaje de error
                response.sendRedirect("pagina-de-error.jsp");
            }
        } else {
            // Manejar caso donde no se presionó el botón de eliminar
            response.sendRedirect("pagina-de-error.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
