package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAOLoginRepository;
import dao.DAOUsuarioRepository;
import model.ModelUsuario;

@WebServlet(urlPatterns = { "/ServletLogin", "/principal/ServletLogin" })
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletLogin() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("sair")) {
			request.getSession().invalidate();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
			redirecionar.forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			

			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String url = request.getParameter("url");
			
			if(login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
				
				ModelUsuario modelUsuario = new ModelUsuario();
				DAOLoginRepository loginRepository = new DAOLoginRepository();
				DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
				
				modelUsuario.setLogin(login);
				modelUsuario.setSenha(senha);
				
				
				if(loginRepository.validarLogin(modelUsuario)) {
					
					modelUsuario = daoUsuarioRepository.carregaUsuarioLogin(login);
					
					if (url == null || url.equals("null")) {
						url = "principal/principal.jsp";
					}
					
					
					RequestDispatcher redirecionar = request.getRequestDispatcher(url);
					request.getSession().setAttribute("usuarioLogin", modelUsuario.getLogin());
					request.getSession().setAttribute("imgUser", modelUsuario.getFotoUser());
					request.getSession().setAttribute("usuarioLogado", modelUsuario);
					redirecionar.forward(request, response);
					
				}else {
					this.teste(request, response);
				}
			}else {
				this.teste(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void teste(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
		request.setAttribute("msgLogin", "<div style=\"color: #842029;background-color: #f8d7da;border-color: #f5c2c7;\" class='alert alert-danger alert-dismissible'><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
				+ "<strong><i class=\"fas fa-exclamation-circle\"></i> Login ou senha incorretos!!!!</strong></div>");
		redirecionar.forward(request, response);
		
	}
}
