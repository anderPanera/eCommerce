package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Pedido;
import conex.BDConex;

public class PedidoDao {
	
	private static BDConex conex = new BDConex();
	
	public static Integer dameUltimoId() {
		
		String sql = "select count(id) id from pedido ";
		
		Integer id = -1;
		
		try (Connection con = conex.getConnection()) {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			rs.next();
			
			id = rs.getInt("id");
			
			rs.close();
			st.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public static boolean insertarPedido(Pedido pedido) {
		
		String sql = "INSERT INTO pedido(id, usuario, total, fecha) VALUES (?,?,?,?)";
		
		boolean insertado = false;
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, pedido.getId());
			ps.setString(2, pedido.getUsuario().getUsuario());
			ps.setInt(3, pedido.getTotal());
			Date date = new Date(pedido.getFecha().getYear(), pedido.getFecha().getMonth(), pedido.getFecha().getDay());
			ps.setDate(4, date);
			
			insertado = ps.execute();
			
			ps.close();
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return insertado;
	}
	
}
