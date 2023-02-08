package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.LineaPedido;
import beans.Producto;
import conex.BDConex;

public class LineaPedidoDao {
	
	private static BDConex conex = new BDConex();
	
	public static boolean insertarLineaPedido(LineaPedido lp) {
		
		String sql = "INSERT INTO lineapedido(id, cantidad, idpedido, idproducto) VALUES (?,?,?,?)";
		
		boolean insertado = false;
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, lp.getId());
			ps.setInt(2, lp.getCantidad());
			ps.setInt(3, lp.getIdpedido());
			ps.setInt(4, lp.getProducto().getId());
			
			insertado = ps.execute();
			
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return insertado;
	}
	
	public static ArrayList<LineaPedido> dameLineaPedidosPedido(int idpedido) {
		
		String sql = "select * from lineapedido where idpedido = ?";
		
		ArrayList<LineaPedido> listaLineaPedidos = new ArrayList<LineaPedido>();
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, idpedido);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				int cantidad = rs.getInt("cantidad");
				int idproducto = rs.getInt("idproducto");
				
				Producto producto = ProductoDao.getProducto(idproducto);
				
				LineaPedido lp = new LineaPedido(id, cantidad, idpedido, producto);
				listaLineaPedidos.add(lp);
			}
			
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return listaLineaPedidos;
	}
	
}
