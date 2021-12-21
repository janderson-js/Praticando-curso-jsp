package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import beandto.BeanDtoGraficoSalarioUsuario;
import dao.DAOUsuarioRepository;
import model.ModelUsuario;


@WebServlet(urlPatterns = {"/ServletGrafico","/servletGrafico"})
public class ServletGrafico extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String acao;
	
	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	public ServletGrafico() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			acao = request.getParameter("acao");
			String dataInicial = request.getParameter("dataInicial");
			String dataFinal = request.getParameter("dataFinal");
			
			if(acao != null || !acao.isEmpty() && acao.equalsIgnoreCase("gerarGrafico")) {
				if(dataInicial == null || dataInicial.isEmpty() && dataFinal == null || dataFinal.isEmpty()) {
					
					BeanDtoGraficoSalarioUsuario graficoSalario = daoUsuarioRepository.graficoSalario();
					
					ObjectMapper objectMapper = new ObjectMapper();
					String json = objectMapper.writeValueAsString(graficoSalario);
					
					response.getWriter().write(json);
				}else {

					BeanDtoGraficoSalarioUsuario graficoSalario = daoUsuarioRepository.graficoSalarioData(Date.valueOf(dataInicial), Date.valueOf(dataFinal));
					
					ObjectMapper objectMapper = new ObjectMapper();
					String json = objectMapper.writeValueAsString(graficoSalario);
					
					response.getWriter().write(json);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
