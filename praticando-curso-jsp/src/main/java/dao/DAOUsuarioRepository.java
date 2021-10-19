package dao;

import java.io.Serializable;
import java.sql.Connection;

import connection.SingleConnectionBanco;
import model.ModelUsuario;

public class DAOUsuarioRepository implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private static Connection connection;
	private ModelUsuario modelUsuario;
	
	public DAOUsuarioRepository() throws Exception{
		connection = SingleConnectionBanco.getConnection();
	}
	
	public void gravarUsuario(ModelUsuario modelUsuario) {
		
		String sql = "";
		
	}
}
