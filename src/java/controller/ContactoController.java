package controller;

import conexion.AccesoBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import modelo.Contacto;

public class ContactoController {

    public static int registrarMensaje(Contacto c) {
        int estatus = 0;
        try {
            Connection con = AccesoBD.getConnection();
            String query = "INSERT INTO contacto (fecha, nombre_apellido, email, mensaje) VALUES (CURRENT_DATE,?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, c.getNombre_apellido());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getMensaje());

            estatus = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return estatus;
    }

    public static int eliminarContacto(int idContacto) {
        int estatus = 0;
        try {
            Connection con = AccesoBD.getConnection();
            String query = "DELETE FROM contacto WHERE id_contacto = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idContacto);

            estatus = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return estatus;
    }
}
