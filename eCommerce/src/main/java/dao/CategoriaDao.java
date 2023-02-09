package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import conex.BDConex;

public class CategoriaDao {
	
	private static BDConex conex = new BDConex();
	
	public static ArrayList<String> getCategorias() {
		
		String sql = "SELECT distinct(categoria) cat FROM categoria";
		
		ArrayList<String> listaCat = new ArrayList<String>();
		
		try (Connection con = conex.getConnection()) {
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				listaCat.add(rs.getString("cat"));
			}
			
			rs.close();
			st.close();
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return listaCat;
	}
	
	public static ArrayList<Integer> getIdsCategoria(String cat) {
		
		String sql = "select idproducto from categoria where categoria like ?";
		
		ArrayList<Integer> listaIds = new ArrayList<Integer>();
		
		try (Connection con = conex.getConnection()) {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, cat);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				listaIds.add(rs.getInt("idproducto"));
			}
			
			rs.close();
			ps.close();
			
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		return listaIds;
		
	}
	
	
	
	
	
}
