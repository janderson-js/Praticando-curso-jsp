<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="pt-br">
<jsp:include page="head.jsp"></jsp:include>
<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-looder.jsp"></jsp:include>
	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="nav-bar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<jsp:include page="nav-bar-main-menu.jsp"></jsp:include>
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-header">
														<h5>Cad. Usuário</h5>
													</div>
													<div class="card-block">
														<form class="form-material" id="formUsuario" method="post"
															action="<%=request.getContextPath()%>/ServletUsuarioController">
															<div class="form-group form-default form-static-label">
																<input id="id" type="text" name="id"
																	class="form-control" readonly="readonly" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">ID:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="nome" type="text" name="nome"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="cpf" type="text" name="cpf"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">CPF:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="data" type="date" name="data"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Data
																	de Nascimento:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="rendaMensal" type="number" name="rendaMensal"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Renda
																	Mensal:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="email" type="email" name="email"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">E-mail:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<select name="select" class="form-control"
																	style="border-style: none;border: none;">
																	<option value="">Perfil</option>
																	<option value="ADMIN">ADMIN</option>
																	<option value="AUXILIAR">AUXÍLIAR</option>
																	<option value="SECRETARIA">SECREÁRIA</option>
																</select>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="login" type="text" name="login"
																	class="form-control" required=""> <span
																	class="form-bar"></span> <label class="float-label">Login:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="senha" type="password" name="senha"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Senha:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="cep" type="text" name="cep"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">CEP:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="uf" type="text" name="uf"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">UF:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="cidade" type="text" name="cidade"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Cidade:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="bairro" type="text" name="bairro"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Bairro:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="logradouro" type="text" name="logradouro"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Logradouro:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="numero" type="text" name="numero"
																	class="form-control" required="" autocomplete="off"> <span
																	class="form-bar"></span> <label class="float-label">Numero:</label>
															</div>
															<div class="form-group form-default form-static-label">
																Sexo:</br>
																masculino:<input id="sexo" type="radio" value="MASCULINO"  checked="checked" name="sexo"> 
																feminino:<input id="sexo" type="radio" value="FEMININO" name="sexo"> 
															</div>
															<div class="form-group form-default form-static-label">
																<button type="submit"
																	class="btn btn-success waves-effect waves-light">Salvar</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Page-body end -->
							</div>
							<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="javascriptfile.jsp"></jsp:include>
</body>

</html>
