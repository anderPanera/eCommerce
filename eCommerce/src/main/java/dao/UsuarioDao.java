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
				String rol = rs.getString("rol");
				String nombre = rs.getString("nombre");
				String apellidos = rs.getString("apellidos");
				String passwordC = rs.getString("password");
				String domicilio = rs.getString("domicilio");
				String codigopostal = rs.getString("codigopostal");
				String telefono = rs.getString("telefono");
				String email = rs.getString("email");
				
				usuarioO = new Usuario(usuarioC, rol, nombre, apellidos, passwordC, domicilio, codigopostal, telefono, email);
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
	
	public static boolean insertarUsuario(Usuario usuario) {
		String sql = "INSERT usuario (`usuario`, `rol`, `nombre`, `apellidos`, `password`, `domicilio`, `codigopostal`,"
				+ " `telefono`, `email`) VALUES ( ?, 'usuario', ? , ?, ?, ?, ?, ?, ?)";
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, usuario.getUsuario());
			ps.setString(2, usuario.getNombre());
			ps.setString(3, usuario.getApellidos());
			ps.setString(4, usuario.getPassword());
			ps.setString(5, usuario.getDomicilio());
			ps.setString(6, usuario.getCodigopostal());
			ps.setString(7, usuario.getTelefono());
			ps.setString(8, usuario.getEmail());
			
			ps.executeUpdate();
						
			ps.close();			
			con.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public static boolean actualizarUsuario(Usuario usuario) {
		String sql = "UPDATE usuario SET nombre=?, apellidos=?, domicilio=?, codigopostal=?, telefono=?, email=? WHERE usuario = ?";
		
		boolean actualizado = false;
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, usuario.getNombre());
			ps.setString(2, usuario.getApellidos());
			ps.setString(3, usuario.getDomicilio());
			ps.setString(4, usuario.getCodigopostal());
			ps.setString(5, usuario.getTelefono());
			ps.setString(6, usuario.getEmail());
			ps.setString(7, usuario.getUsuario());
			
			actualizado = ps.execute();
			
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return actualizado;
	}
	
}
