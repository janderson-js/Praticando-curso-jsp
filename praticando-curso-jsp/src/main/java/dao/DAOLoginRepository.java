package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnectionBanco;
import model.ModelUsuario;

public class DAOLoginRepository {

	private Connection connection;

	public DAOLoginRepository() {

		connection = SingleConnectionBanco.getConnection();

	}

	public boolean validarLogin(ModelUsuario modelUsuario) throws Exception {

		String sql = "Select id from model_usuario where upper(login) = upper(?)";

		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, modelUsuario.getLogin());		

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			Long id =  rs.getLong("id");
			
			String slqSenha = " Select * from model_usuario where upper(senha) = upper(?) and id=?";
			
			PreparedStatement pstmLogin = connection.prepareStatement(slqSenha);
			pstmLogin.setString(1, slqSenha);
			pstmLogin.setLong(2, id);
			
			ResultSet rsLogin = pstmLogin.executeQuery();
			
			if(rsLogin.next()) {
				return true;
			}
		}

		return false;
	}
}
