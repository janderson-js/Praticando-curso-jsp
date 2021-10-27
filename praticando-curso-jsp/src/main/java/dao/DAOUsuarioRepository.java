package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import connection.SingleConnectionBanco;
import model.ModelUsuario;

public class DAOUsuarioRepository implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private static Connection connection;
	private ModelUsuario modelUsuario;
	
	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public ModelUsuario gravarUsuario(ModelUsuario modelUsuario, Long idUser)throws Exception {
		
		String sql = "INSERT INTO public.model_usuario(nome, data_nascimento, cpf, email, perfil, sexo, renda_mensal, cep, cidade, bairro, logradouro, uf, numero, login, senha, data_cad, usuario_cad) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?,current_date, ?)";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, modelUsuario.getNome());
		pstm.setDate(2, modelUsuario.getDataNascimento());
		pstm.setString(3, modelUsuario.getCpf());
		pstm.setString(4, modelUsuario.getEmail());
		pstm.setString(5, modelUsuario.getPerfil());
		pstm.setString(6, modelUsuario.getSexo());
		pstm.setDouble(7, modelUsuario.getRendaMensal());
		pstm.setString(8, modelUsuario.getCep());
		pstm.setString(9, modelUsuario.getCidade());
		pstm.setString(10, modelUsuario.getBairro());
		pstm.setString(11, modelUsuario.getLogradouro());
		pstm.setString(12, modelUsuario.getUf());
		pstm.setString(13, modelUsuario.getNumero());
		pstm.setString(14, modelUsuario.getLogin());
		pstm.setString(15, modelUsuario.getSenha());
		pstm.setLong(16, idUser);
		
		pstm.execute();
		connection.commit();
		
		if(modelUsuario.getFotoUser() != null && !modelUsuario.getFotoUser().isEmpty()) {
			
			String sqlFoto = "update model_usuario set foto_user=? , extensao_foto_user=? where login=?";
			PreparedStatement pstmFoto = connection.prepareStatement(sqlFoto);
			pstmFoto.setString(1, modelUsuario.getFotoUser());
			pstmFoto.setString(2, modelUsuario.getExtensaoFotoUser());
			pstmFoto.setString(3, modelUsuario.getLogin());
			
			pstmFoto.executeUpdate();
			
			connection.commit();
			
		}
		
		return modelUsuario;
	}
	
	public ModelUsuario atualizaUsuario(ModelUsuario modelUsuario) throws Exception{
		
		String sql = "UPDATE model_usuario SET nome=?, data_nascimento=?, cpf=?, email=?, perfil=?, sexo=?,  "
				+ "renda_mensal=?, cep=?, cidade=?, bairro=?, logradouro=?, uf=?, numero=?, login=?, senha=?"
				+ "WHERE id=?;";
		
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, modelUsuario.getNome());
		pstm.setDate(2, modelUsuario.getDataNascimento());
		pstm.setString(3, modelUsuario.getCpf());
		pstm.setString(4, modelUsuario.getEmail());
		pstm.setString(5, modelUsuario.getPerfil());
		pstm.setString(6, modelUsuario.getSexo());
		pstm.setDouble(7, modelUsuario.getRendaMensal());
		pstm.setString(8, modelUsuario.getCep());
		pstm.setString(9, modelUsuario.getCidade());
		pstm.setString(10, modelUsuario.getBairro());
		pstm.setString(11, modelUsuario.getLogradouro());
		pstm.setString(12, modelUsuario.getUf());
		pstm.setString(13, modelUsuario.getNumero());
		pstm.setString(14, modelUsuario.getLogin());
		pstm.setString(15, modelUsuario.getSenha());
		pstm.setLong(16, modelUsuario.getId());
		
		pstm.executeUpdate();
		connection.commit();
		
		if(modelUsuario.getFotoUser() != null && !modelUsuario.getFotoUser().isEmpty()) {
			
			String sqlFoto = "update model_usuario set foto_user=? , extensao_foto_user=? where id=?";
			PreparedStatement pstmFoto = connection.prepareStatement(sqlFoto);
			pstmFoto.setString(1, modelUsuario.getFotoUser());
			pstmFoto.setString(2, modelUsuario.getExtensaoFotoUser());
			pstmFoto.setLong(3, modelUsuario.getId());
			
			pstmFoto.executeUpdate();
			
			connection.commit();
			
		}
		
		return modelUsuario;
	}
	
	public List<ModelUsuario> listaDeUsuarios() throws Exception{
		
		List<ModelUsuario> usuarios = new ArrayList<ModelUsuario>();
		
		String sql = "select id, nome, email from model_usuario";
		PreparedStatement pstm = connection.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) {
			
			ModelUsuario modelUsuario = new ModelUsuario();
			
			modelUsuario.setId(rs.getLong("id"));
			modelUsuario.setNome(rs.getString("nome"));
			modelUsuario.setEmail(rs.getString("email"));
			
			usuarios.add(modelUsuario);
			
		}
		
		pstm.execute();
		connection.commit();
		
		return usuarios;
	}
	
	public boolean existeLogin(String login) throws Exception{
		
		String sql = "Select count(1) > 0 as existe_login from model_usuario where upper(login) = upper(?)";
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, login);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		if(rs.getBoolean("existe_login")) {
			return true;
		}
		
		return false;
	}
	
	public ModelUsuario carregaUsuarioLogin(String login) throws Exception {
		
		modelUsuario = new ModelUsuario();
		
		String sql = "Select * from model_usuario where upper(login) = upper(?)";
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setString(1, login);
		ResultSet rs = pstm.executeQuery();
		
		if(rs.next()) {
			modelUsuario.setId(rs.getLong("id"));
			modelUsuario.setNome(rs.getString("nome"));
			modelUsuario.setPerfil(rs.getString("perfil"));
			modelUsuario.setLogin(rs.getString("login"));
			modelUsuario.setFotoUser(rs.getString("foto_user"));
		}
		
		return modelUsuario;
	}

	public ModelUsuario consultarUsuarioLogado(String login) throws Exception  {
		
		modelUsuario = new ModelUsuario();
		
		String sql = "select * from model_usuario where upper(login) = upper(?)";
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

	public ModelUsuario carregarPorId(Long idUser) throws Exception {
		
		String sql = "Select * from model_usuario where id=?";
		PreparedStatement pstm = connection.prepareStatement(sql);
		pstm.setLong(1, idUser);
		ResultSet rs = pstm.executeQuery();
		
		if(rs.next()) {
			
			ModelUsuario modelUsuario = new ModelUsuario();
			
			modelUsuario.setFotoUser(rs.getString("foto_user"));
			modelUsuario.setId(rs.getLong("id"));
			modelUsuario.setNome(rs.getString("nome"));
			modelUsuario.setCpf(rs.getString("cpf"));
			modelUsuario.setDataNascimento(rs.getDate("data_nascimento"));
			modelUsuario.setRendaMensal(rs.getDouble("renda_mensal"));
			modelUsuario.setEmail(rs.getString("email"));
			modelUsuario.setPerfil(rs.getString("perfil"));
			modelUsuario.setLogin(rs.getString("login"));
			modelUsuario.setSenha(rs.getString("senha"));
			modelUsuario.setCep(rs.getString("cep"));
			modelUsuario.setUf(rs.getString("uf"));
			modelUsuario.setCidade(rs.getString("cidade"));
			modelUsuario.setBairro(rs.getString("bairro"));
			modelUsuario.setLogradouro(rs.getString("logradouro"));
			modelUsuario.setNumero(rs.getString("numero"));
			modelUsuario.setSexo(rs.getString("sexo"));
			
			this.modelUsuario = modelUsuario;
			
		}
		
		return modelUsuario;
	}

}
