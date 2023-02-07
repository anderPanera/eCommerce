package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.LineaPedido;
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
	
}
