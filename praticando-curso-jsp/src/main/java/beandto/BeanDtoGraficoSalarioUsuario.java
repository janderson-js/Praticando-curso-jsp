package beandto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BeanDtoGraficoSalarioUsuario implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private List<String> perfil = new ArrayList<String>();
	private List<Double> salario = new ArrayList<Double>();
	
	public List<String> getPerfil() {
		return perfil;
	}
	public void setPerfil(List<String> perfil) {
		this.perfil = perfil;
	}
	public List<Double> getSalario() {
		return salario;
	}
	public void setSalario(List<Double> salario) {
		this.salario = salario;
	}
	
}
