package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
					DAOUsuarioRepository daoUser = new DAOUsuarioRepository();
					List<ModelUsuario> listaFormularioHTML = daoUser.listaFormularioHTML();
					
					ObjectMapper objectMapper = new ObjectMapper();
					String json = objectMapper.writeValueAsString(listaFormularioHTML);
					
					response.addHeader("totalPagAjaxForm", ""+ daoUser.totalPagForm());
					response.getWriter().write(json);
					
				}else {
					
					DAOUsuarioRepository daoUser = new DAOUsuarioRepository();
					List<ModelUsuario> listaFormularioHTML = daoUser.listaFormularioHTMLData(Date.valueOf(dataInicial),Date.valueOf(dataFinal));
					
					ObjectMapper objectMapper = new ObjectMapper();
					String json = objectMapper.writeValueAsString(listaFormularioHTML);
					
					response.addHeader("totalPagAjaxForm", ""+ daoUser.totalPagFormData(Date.valueOf(dataInicial),Date.valueOf(dataFinal)));
					response.getWriter().write(json);
				}
				
			}else if(acao != null && !acao.equals("null") && acao.equalsIgnoreCase("listaAjaxFormHTML")) {
				
				String offSet = request.getParameter("pagina");
				int totalPag = 0;
				
				DAOUsuarioRepository daoUser = new DAOUsuarioRepository();
				List<ModelUsuario> listaFormularioHTMLOffSet = new ArrayList<ModelUsuario>();
				
				if(dataInicial == null || dataInicial.isEmpty() && dataFinal == null || dataFinal.isEmpty()) {
					listaFormularioHTMLOffSet = daoUser.listaFormularioHTMLOffSet(offSet);
					totalPag = daoUser.totalPagForm();
				}else {
					listaFormularioHTMLOffSet = daoUser.listaFormularioHTMLOffSetData(offSet,Date.valueOf(dataInicial),Date.valueOf(dataFinal));
					totalPag = daoUser.totalPagFormData(Date.valueOf(dataInicial),Date.valueOf(dataFinal));
				}
				
				ObjectMapper objectMapper = new ObjectMapper();
				String json = objectMapper.writeValueAsString(listaFormularioHTMLOffSet);
				
				response.addHeader("totalPagAjaxForm", ""+ totalPag);
				response.getWriter().write(json);
				
			}else if(acao != null && !acao.equals("null") && acao.equalsIgnoreCase("formularioPDF")) {
				
				if(dataInicial == null || dataInicial.isEmpty() && dataFinal == null || dataFinal.isEmpty()) {
					
					System.out.println("ta aqui");
					
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