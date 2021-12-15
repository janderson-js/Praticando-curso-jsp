package servlets;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOTelefoneRepository;
import dao.DAOUsuarioRepository;
import model.ModelTelefone;
import model.ModelUsuario;

@WebServlet(urlPatterns = {"/ServletTelefoneController","/servletTelefoneController"})
public class ServletTelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	private static ModelTelefone modelTelefone;
	private static ModelUsuario modelUsuario;
	private static DAOTelefoneRepository daoTelefone = new DAOTelefoneRepository();
	private static DAOUsuarioRepository daoUser = new DAOUsuarioRepository();
	
	
    public ServletTelefoneController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Long idUser = Long.parseLong(request.getParameter("idUser"));
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.equals("null") && acao.equalsIgnoreCase("deletar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				
				request.setAttribute("msgLista", "<div style=\"background-color: #d1e7dd;color: #0f5132;border-color: #0f5132;\" class='alert alert-success '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
						+ "<strong><i class=\"far fa-check-circle\"></i> Telefone excluido com sucesso!!</strong></div>");
				daoTelefone.deletarNumero(id, idUser);
			}
			
			this.redirecionarTelefone(request, response, idUser);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String numero = request.getParameter("numero");			
			
			Long idUser = Long.parseLong(request.getParameter("idUser"));						

			modelTelefone = new ModelTelefone();
			
			modelTelefone.setNumero(numero);
			modelTelefone.setIdUser(idUser);
			
			if(daoTelefone.existeNumero(numero, idUser)) {
				
				request.setAttribute("msg", "<div style=\"background-color: #fff3cd;color: #856404;border-color: #856404;\" class='alert alert-warning '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
						+ "<strong><i class=\"far fa-check-circle\"></i> O usuário já esta cadastrado com esse número!!</strong></div>");
			}else {
				modelTelefone = daoTelefone.gravarTelefoneUsuario(modelTelefone);
				
				request.setAttribute("msg", "<div style=\"background-color: #d1e7dd;color: #0f5132;border-color: #0f5132;\" class='alert alert-success '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
						+ "<strong><i class=\"far fa-check-circle\"></i>Telefone cadastrado com sucesso!!</strong></div>");
			}
			
			this.redirecionarTelefone(request, response,idUser);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void redirecionarTelefone(HttpServletRequest request, HttpServletResponse response, Long idUser) {
		
		try {
			
			modelUsuario = new ModelUsuario();
			
			modelUsuario = daoUser.carregarPorId(idUser);
			List<ModelTelefone> telefones = daoTelefone.ListarTelefoneUsuario(idUser);
			
			
			request.setAttribute("ListaTelefones", telefones);
			request.setAttribute("dadosUsuario", modelUsuario);
			request.getRequestDispatcher("principal/cad_telefone.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
