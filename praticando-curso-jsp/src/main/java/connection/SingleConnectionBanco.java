package connection;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private static Connection connection = null;
	
	private static String user = "postgres";
	private static String senha = "admin";
	private static String url = "jdbc:postgresql://localhost:5433/pratica-curso-jsp?autoreconnect=true";
	
	public static Connection getConnection() {
		return connection;
	}
	
	static {
		conectar();
	}

	public SingleConnectionBanco() {
		conectar();
	}
	
	public static void conectar() {
		try {
			if(connection == null) {
				
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(url, user, senha);
				connection.setAutoCommit(false);
			}
		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
			e.printStackTrace();
		}
	}
}
