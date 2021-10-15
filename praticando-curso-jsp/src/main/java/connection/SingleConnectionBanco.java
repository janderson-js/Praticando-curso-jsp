package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	private static String banco = "jdbc:postgresql://ec2-34-193-101-0.compute-1.amazonaws.com:5432/d6rvkkbtqho0ng?sslmode=require&autoreconnect=true";
	private static String user = "adflfjrkkrhcqd";
	private static String senha = "719bd77d17fea91ea978609b43466c94851acd05a3f6af832204cc76d3366790";
	private static Connection connection = null;
	
	
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

			if (connection == null) {

				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
