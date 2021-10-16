package model;

import java.io.Serializable;

public class ModelTelefone implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String numero;
	
	private ModelUsuario idUser;
	private ModelUsuario idCad;
	
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
	public ModelUsuario getIdUser() {
		return idUser;
	}
	public void setIdUser(ModelUsuario idUser) {
		this.idUser = idUser;
	}
	public ModelUsuario getIdCad() {
		return idCad;
	}
	public void setIdCad(ModelUsuario idCad) {
		this.idCad = idCad;
	}
}
