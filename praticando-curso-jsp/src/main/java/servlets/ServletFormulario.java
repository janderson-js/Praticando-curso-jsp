package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOTelefoneRepository;
import dao.DAOUsuarioRepository;
import model.ModelUsuario;


@WebServlet(urlPatterns = {"/ServletFormulario","/servletFormulario"})
public class ServletFormulario extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String acao;

    public ServletFormulario() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			acao = request.getParameter("acao");
			String dataInicial = request.getParameter("dataInicial");
			String dataFinal = request.getParameter("dataFinal");
			
			
			if(acao != null && !acao.equals("null") && acao.equalsIgnoreCase("formularioHTML")) {
				
				if(dataInicial == null || dataInicial.isEmpty() && dataFinal == null || dataFinal.isEmpty()) {
					DAOUsuarioRepository daoTelefone = new DAOUsuarioRepository();
					List<ModelUsuario> listaFormularioHTML = daoTelefone.listaFormularioHTML();
					
					ObjectMapper objectMapper = new ObjectMapper();
					String json = objectMapper.writeValueAsString(listaFormularioHTML);
					
					response.getWriter().write(json);
					
				}else {
					System.out.println("formulario com filtro de data /" + dataInicial +" data //"+ dataFinal);
				}
				
			}else if(acao != null && !acao.equals("null") && acao.equalsIgnoreCase("formularioPDF")) {
				
				if(dataInicial == null || dataInicial.isEmpty() && dataFinal == null || dataFinal.isEmpty()) {
					System.out.println("formularioPDF sem filtro de data /" + dataInicial +" data //"+ dataFinal);
				}else {
					System.out.println("formularioPDF com filtro de data /" + dataInicial +" data //"+ dataFinal);
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}