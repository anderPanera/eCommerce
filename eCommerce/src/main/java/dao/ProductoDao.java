package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Producto;
import conex.BDConex;

public class ProductoDao {
	
	private static BDConex conex = new BDConex();
	
	public static ArrayList<Producto> getProductos() {
		
		String sql = "select * from producto";
		
		ArrayList<Producto> listaProductos = new ArrayList<Producto>();
		
		try (Connection con = conex.getConnection()) {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String nombre = rs.getString("nombre");
				String descripcion = rs.getString("descripcion");
				String imagen = rs.getString("imagen");
				int precio = rs.getInt("precio");
				
				Producto producto = new Producto(id, nombre, descripcion, imagen, precio);
				
				listaProductos.add(producto);
			}
			
			rs.close();
			st.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listaProductos;
	}
	
	public static Producto getProducto(Integer id) {
		
		String sql = "select * from producto where id = ?";
		
		Producto producto = null;
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int idP = rs.getInt("id");
			String nombre = rs.getString("nombre");
			String descripcion = rs.getString("descripcion");
			String imagen = rs.getString("imagen");
			int precio = rs.getInt("precio");
			
			producto = new Producto(idP, nombre, descripcion, imagen, precio);
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return producto;
	}
	
	public static boolean insertarProducto(Producto producto) {
		
		String sql = "INSERT INTO producto (nombre, descripcion, imagen, precio) VALUES (?,?,?,?)";
		
		boolean insertado = false;
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, producto.getNombre());
			ps.setString(2, producto.getDescripcion());
			ps.setString(3, producto.getImagen());
			ps.setInt(4, producto.getPrecio());
			
			insertado = ps.execute();
			
			ps.close();

		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return insertado;
		
	}
	
	
	
}
