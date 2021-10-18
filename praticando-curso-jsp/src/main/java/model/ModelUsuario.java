package model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class ModelUsuario implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private Date dataNascimento;
	private String cpf;
	private String email;
	private String perfil;
	private String sexo;
	private String fotoUser;
	private String extensaoFotoUser;
	private List<ModelTelefone> telefones;
	private Double rendaMensal;
	
	private String cep;
	private String cidade;
	private String bairro;
	private String logradouro;
	private String uf;
	private String numero;
	
	private String login;
	private String senha;
	
	private Boolean userAdmin;
	
	private Long userCad;
	private Date datacad;
	
	
	
	public Double getRendaMensal() {
		return rendaMensal;
	}
	public void setRendaMensal(Double rendaMensal) {
		this.rendaMensal = rendaMensal;
	}
	public Date getDatacad() {
		return datacad;
	}
	public void setDatacad(Date datacad) {
		this.datacad = datacad;
	}
	public Long getUserCad() {
		return userCad;
	}
	public void setUserCad(Long userCad) {
		this.userCad = userCad;
	}
	public Boolean getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(Boolean userAdmin) {
		this.userAdmin = userAdmin;
	}
	public List<ModelTelefone> getTelefones() {
		return telefones;
	}
	public void setTelefones(List<ModelTelefone> telefones) {
		this.telefones = telefones;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getFotoUser() {
		return fotoUser;
	}
	public void setFotoUser(String fotoUser) {
		this.fotoUser = fotoUser;
	}
	public String getExtensaoFotoUser() {
		return extensaoFotoUser;
	}
	public void setExtensaoFotoUser(String extensaoFotoUser) {
		this.extensaoFotoUser = extensaoFotoUser;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
}
