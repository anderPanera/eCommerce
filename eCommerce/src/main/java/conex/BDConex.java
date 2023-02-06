package conex;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BDConex {
	
	private static DataSource dataSource;
	
	public BDConex() {
		try {
			InitialContext ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:comp/env");
			dataSource = (DataSource) env.lookup("jdbc/ecommerce");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
}
