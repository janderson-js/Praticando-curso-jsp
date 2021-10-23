package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOUsuarioRepository;
import model.ModelUsuario;

@WebServlet("/ServletUsuarioController")
public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ModelUsuario modelUsuario = new ModelUsuario();
	private DAOUsuarioRepository daoUsuarioRepository;
       
    public ServletUsuarioController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String dataNascimento = request.getParameter("data");
		String rendaMensal = request.getParameter("rendaMensal");
		String perfil = request.getParameter("perfil");
		String cep = request.getParameter("cep");
		String  uf = request.getParameter("uf");
		String cidade = request.getParameter("cidade");
		String bairro = request.getParameter("bairro");
		String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String[] sexo = request.getParameterValues("sexo");
		
		try {
			
			modelUsuario.setId(Long.parseLong(id));
			modelUsuario.setNome(nome);
			modelUsuario.setEmail(email);
			modelUsuario.setLogin(login);
			modelUsuario.setSenha(senha);
			modelUsuario.setCpf(cpf);
			modelUsuario.setDataNascimento(Date.valueOf(new SimpleDateFormat("yyyy-mm-dd").format(new SimpleDateFormat("dd/mm/yyyy").parse(dataNascimento))));
			modelUsuario.setRendaMensal(Double.parseDouble(rendaMensal));
			modelUsuario.setPerfil(perfil);
			modelUsuario.setUf(uf);
			modelUsuario.setCep(cep);
			modelUsuario.setCidade(cidade);
			modelUsuario.setBairro(bairro);
			modelUsuario.setLogradouro(logradouro);
			modelUsuario.setNumero(numero);
			modelUsuario.setSexo(sexo[0]);
			
			
			daoUsuarioRepository.gravarUsuario(modelUsuario);
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
			
		}
		
	}

}
