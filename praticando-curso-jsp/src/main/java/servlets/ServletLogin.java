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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			

			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			
			if(login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
				
				ModelUsuario modelUsuario = new ModelUsuario();
				DAOLoginRepository loginRepository = new DAOLoginRepository();
				DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
				
				modelUsuario.setLogin(login);
				modelUsuario.setSenha(senha);
				
				
				if(loginRepository.validarLogin(modelUsuario)) {
					
					modelUsuario = daoUsuarioRepository.carregaUsuarioLogin(login);
					
					RequestDispatcher redirecionar = request.getRequestDispatcher("/principal/principal.jsp");
					request.setAttribute("usuarioLogado", modelUsuario);
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
		request.setAttribute("msgLogin", "Informe o login e senha corretamente!!!!");
		redirecionar.forward(request, response);
		
	}

}
