package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import model.ModelUsuario;

@MultipartConfig
@WebServlet("/ServletUsuarioController")
public class ServletUsuarioController extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
	
	private ModelUsuario modelUsuario = new ModelUsuario();
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	private List<ModelUsuario> modelUsuarios = new ArrayList<ModelUsuario>();
	
       
    public ServletUsuarioController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		
		try {
			
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("lista")) {
				
				modelUsuarios = daoUsuarioRepository.listaDeUsuarios();
				
				request.setAttribute("listaUsuarios", modelUsuarios);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("editar")) {
				
				Long idUser = Long.parseLong(request.getParameter("idUser"));
				
				modelUsuario = daoUsuarioRepository.carregarPorId(idUser);
				
				modelUsuarios = daoUsuarioRepository.listaDeUsuarios();

				this.redirecionaParaPagUsuario(request, response);
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarAjax")) {
				
				String nomeBuscar = request.getParameter("nomeBuscar");
				
				List<ModelUsuario> usuarios = daoUsuarioRepository.listaUsuariosLike(nomeBuscar);
				
				ObjectMapper objectMapper = new ObjectMapper();
				String json = objectMapper.writeValueAsString(usuarios);
				
				response.getWriter().write(json);
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {
				
				String idUser = request.getParameter("idUser");
				
				daoUsuarioRepository.deletar(Long.parseLong(idUser));
				
				response.getWriter().write("<div style=\\\"background-color: #d1e7dd;color: #0f5132;border-color: #0f5132;\\\" class='alert alert-success '><a href=\\\"#\\\" class=\\\"close\\\" data-dismiss=\\\"alert\\\" aria-label=\\\"close\\\">&times;</a>\\r\\n\"\r\n"
						+ "							+ \"<strong><i class=\\\"far fa-check-circle\\\"></i> Usuário Excluido com sucesso!!</strong></div>");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String dataNascimento = request.getParameter("data");
		String rendaMensal = request.getParameter("rendaMensal");
		String perfil = request.getParameter("perfil");
		String cep = request.getParameter("cep");
		String uf = request.getParameter("uf");
		String cidade = request.getParameter("cidade");
		String bairro = request.getParameter("bairro");
		String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String sexo[] = request.getParameterValues("sexo");
		
		try {
			
			modelUsuario.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelUsuario.setNome(nome);
			modelUsuario.setEmail(email);
			modelUsuario.setLogin(login);
			modelUsuario.setSenha(senha);
			modelUsuario.setCpf(cpf);
			modelUsuario.setDataNascimento(Date.valueOf(dataNascimento));
			modelUsuario.setRendaMensal(Double.parseDouble(rendaMensal));
			modelUsuario.setPerfil(perfil);
			modelUsuario.setUf(uf);
			modelUsuario.setCep(cep);
			modelUsuario.setCidade(cidade);
			modelUsuario.setBairro(bairro);
			modelUsuario.setLogradouro(logradouro);
			modelUsuario.setNumero(numero);
			modelUsuario.setSexo(sexo[0]);
			
			if(request.getPart("filefoto") != null) {
				Part part = request.getPart("filefoto");
				if(part.getSize() > 0){

					byte[] foto = IOUtils.toByteArray(part.getInputStream());
					String  ImgBase64 = "data:image/"+ part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);
					
					modelUsuario.setFotoUser(ImgBase64);
					modelUsuario.setExtensaoFotoUser(part.getContentType().split("\\/")[1]);
				}
			}

			if (daoUsuarioRepository.existeLogin(modelUsuario.getLogin()) && modelUsuario.getId() == null) {
				request.setAttribute("msg", "<div style=\"background-color: #fff3cd;color: #856404;border-color: #856404;\" class='alert alert-warning '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
						+ "<strong><i class=\"fas fa-exclamation-triangle\"></i> Já existe um usuário com esse login!!! Por favor informe outro login!!</strong></div>");
			} else {

				if (modelUsuario.isNovo()) {
					request.setAttribute("msg", "<div style=\"background-color: #d1e7dd;color: #0f5132;border-color: #0f5132;\" class='alert alert-success '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
							+ "<strong><i class=\"far fa-check-circle\"></i> Usuário cadastrado com sucesso!!</strong></div>");
					
					modelUsuario = daoUsuarioRepository.gravarUsuario(modelUsuario,super.getUserLogado(request));
					
				} else {
					request.setAttribute("msg", "<div style=\"background-color: #d1e7dd;color: #0f5132;border-color: #0f5132;\" class='alert alert-success '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
							+ "<strong><i class=\"far fa-check-circle\"></i> Atualizado com sucesso!!</strong></div>");
					
					modelUsuario = daoUsuarioRepository.atualizaUsuario(modelUsuario);
				}
			}
			modelUsuarios = daoUsuarioRepository.listaDeUsuarios();
			this.redirecionaParaPagUsuario(request, response);
			
		} catch (Exception e) {
		
			e.printStackTrace();
			
		}
		
	}
	
	protected void redirecionaParaPagUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setAttribute("dadosUsuario", modelUsuario);
		request.setAttribute("listaUsuarios", modelUsuarios);
		request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
	}

}
