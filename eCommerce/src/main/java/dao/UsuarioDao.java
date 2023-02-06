package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Usuario;
import conex.BDConex;

public class UsuarioDao {
	
	private static BDConex conex = new BDConex();
	
	public static Usuario validarUsuario(String usuario, String password) {
		
		String sql = "select * from usuario where usuario = ? and password = ?";
		
		Usuario usuarioO = null;
		
		try (Connection con = conex.getConnection()) {
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, usuario);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				String usuarioC = rs.getString("usuario");
				String nombre = rs.getString("nombre");
				String apellidos = rs.getString("apellidos");
				String passwordC = rs.getString("password");
				String domicilio = rs.getString("domicilio");
				String codigopostal = rs.getString("codigopostal");
				String telefono = rs.getString("telefono");
				String email = rs.getString("email");
				
				usuarioO = new Usuario(usuarioC, nombre, apellidos, passwordC, domicilio, codigopostal, telefono, email);
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return usuarioO;
		
	}
	
	
	//REGISTER
	
	public static boolean existeUsuario(String usuario) {
		
		String sql = "select count(*) c from usuario where usuario = ?";
		
		boolean existe = false;
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, usuario);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			if (rs.getInt("c") > 0) {
				existe = true;
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return existe;
	}
	
	public void insertarUsuario(Usuario usuario) {
		
	}

}
