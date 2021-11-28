package model;

import java.io.Serializable;

public class ModelTelefone implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String numero;
	
	private Long idUser;
	
	public boolean isNovo() {
		
		if(this.id == null) {
			return true;
		}else if(this.id != null && this.id > 0) {
			return false;
		}
		
		return id == null;
	}
	
	public Long getIdUser() {
		return idUser;
	}
	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
}
