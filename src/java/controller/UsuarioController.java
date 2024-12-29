package controller;

import conexion.AccesoBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Usuario;

public class UsuarioController {

    public static int registrarUsuario(Usuario u) {

        int estatus = 0;

        try {

            Connection con = AccesoBD.getConnection();
            String query = "insert into usuario (nombre, apellidos, telefono, correo, clave, id_rol) values(?,?,?,?,?,1)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido());
            ps.setString(3, u.getTelefono());
            ps.setString(4, u.getCorreo());
            ps.setString(5, u.getClave());

            estatus = ps.executeUpdate();

        } catch (Exception e) {

        }

        return estatus;

    }

    public static Usuario login(String correo, String clave) {
        Usuario us = null;

        try {
            Connection con
                    = AccesoBD.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM usuario WHERE correo =? AND clave =?");
            ps.setString(1, correo);
            ps.setString(2, clave);
            ResultSet rs
                    = ps.executeQuery();
            if (rs.next()) {
                us = new Usuario();
                us.setId(rs.getInt(1));
                us.setNombre(rs.getString(2));
                us.setApellido(rs.getString(3));
                us.setCorreo(rs.getString(4));
                us.setClave(rs.getString(5));
                us.setTelefono(rs.getString(6));
                us.setRol(rs.getInt(7));

            }
        } catch (Exception e) {
        }
        return us;

    }

    public static int eliminarUsuario(int idUsuario) {
        int estatus = 0;
        try {
            Connection con = AccesoBD.getConnection();
            String query = "DELETE FROM usuario WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idUsuario);

            estatus = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return estatus;
    }

}