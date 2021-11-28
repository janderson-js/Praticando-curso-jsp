package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelTelefone;

public class DAOTelefoneRepository {
	
	private static Connection connection;
	
	private static ModelTelefone modelTelefone;
	private static List<ModelTelefone> telefones;
	
	public DAOTelefoneRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public ModelTelefone gravarTelefoneUsuario(ModelTelefone telefone) throws Exception {
		
		String slq = "INSERT INTO model_telefone(numero, id_user) VALUES (?, ?)";
		PreparedStatement pstm = connection.prepareStatement(slq,PreparedStatement.RETURN_GENERATED_KEYS);
		pstm.setString(1, telefone.getNumero());
		pstm.setLong(2, telefone.getIdUser());
		ResultSet rs = pstm.getGeneratedKeys();
		if(rs.next()) {
			telefone.setId(rs.getLong("id"));
		}
		
		pstm.execute();
		connection.commit();
		
		return telefone;
	}
	
	public boolean existeNumero(String numero, Long idUser) throws Exception {
		
		String sql = "Select * from model_telefone where numero=? and id_user=?";
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, numero);
		pstm.setLong(2, idUser);
		ResultSet rs = pstm.executeQuery();
		if(rs.next()) {
			return true;
		}
		
		return false;
	}
	
	public List<ModelTelefone> ListarTelefoneUsuario(Long id) throws Exception {
		
		telefones = new ArrayList<ModelTelefone>();
		
		String slq = "Select * from model_telefone where id_user = ?";
		PreparedStatement pstm = connection.prepareStatement(slq);
		pstm.setLong(1, id);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()) {
			modelTelefone = new ModelTelefone();
			
			modelTelefone.setId(rs.getLong("id"));
			modelTelefone.setIdUser(rs.getLong("id_user"));
			modelTelefone.setNumero(rs.getString("numero"));
			
			telefones.add(modelTelefone);
		}
		
		pstm.execute();
		
		return telefones;
	}
	
	public void deletarNumero(Long id, Long id_user) throws Exception {
		
		String sql = "delete from model_telefone where id=? and id_user=?";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setLong(1, id);
		pstm.setLong(2, id_user);
		
		pstm.execute();
		connection.commit();
		
	}
}
