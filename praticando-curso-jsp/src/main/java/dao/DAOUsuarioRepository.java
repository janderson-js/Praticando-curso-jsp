package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	public ModelUsuario carregaUsuarioLogin(String login) throws Exception {
		
		ModelUsuario modelUsuario = new ModelUsuario();
		
		String sql = "Select * from model_usuario where upper(login) = upper(?)";
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, login);
		ResultSet rs = pstm.executeQuery();
		
		if(rs.next()) {
			modelUsuario.setId(rs.getLong("id"));
			modelUsuario.setNome(rs.getString("nome"));
			modelUsuario.setPerfil(rs.getString("perfil"));
			modelUsuario.setLogin(rs.getString("login"));
		}
		
		return modelUsuario;
	}
}
