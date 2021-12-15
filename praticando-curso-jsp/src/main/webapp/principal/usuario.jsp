<%@page import="model.ModelUsuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
ModelUsuario dadosUsuario = (ModelUsuario) request.getAttribute("dadosUsuario");
%>

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
														<h5>Cad. Usuário</h5></br></br>
														<span id="msg">${msg}</span>
													</div>
													<div class="card-block">
														<form class="form-material" enctype="multipart/form-data"
															id="formUsuario" method="post"
															action="<%=request.getContextPath()%>/ServletUsuarioController">
															<div class="form-group form-default form-static-label">
																<div class="main-menu-header">
																	<c:if
																		test="${dadosUsuario.fotoUser != '' && dadosUsuario.fotoUser != null}">
																		<img id="fotoUsuario" class="img-80 img-radius"
																			alt="imagem de usuario"
																			src="${dadosUsuario.fotoUser}">
																	</c:if>
																	<c:if
																		test="${dadosUsuario.fotoUser == '' || dadosUsuario.fotoUser == null}">
																		<img id="fotoUsuario" class="img-80 img-radius"
																			alt="imagem de usuario"
																			src="<%=request.getContextPath()%>/assets/images/avatar-6.png">
																	</c:if>
																</div>
																</br>
																<div>
																	<input type="file" name="filefoto" id="filefoto"
																		onchange="visualizarImg('fotoUsuario','filefoto');"
																		accept="image/"
																		onchange="visualizarImg('fotoembase64','filefoto');"
																		class="form-contro-file">
																</div>
															</div>
															</br>
															<div class="form-group form-default form-static-label">
																<input id="id" type="text" name="id"
																	class="form-control" readonly="readonly"
																	autocomplete="off" value="${dadosUsuario.id}">
																<span class="form-bar"></span> <label
																	class="float-label">ID:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="nome" type="text" name="nome"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="cpf" type="text" name="cpf"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.cpf}"> <span
																	class="form-bar"></span> <label class="float-label">CPF:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="data" type="date" name="data"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.dataNascimento}"> <span
																	class="form-bar"></span> <label class="float-label">Data
																	de Nascimento:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="rendaMensal" type="text" name="rendaMensal"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.rendaMensal}"> <span
																	class="form-bar"></span> <label class="float-label">Renda
																	Mensal:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="email" type="email" name="email"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.email}"> <span
																	class="form-bar"></span> <label class="float-label">E-mail:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<select name="perfil" class="form-control"
																	style="border-style: none; border: none;">
																	<option value="">Perfil</option>
																	<option value="ADMIN"
																		<%if (dadosUsuario != null && dadosUsuario.getPerfil().equals("ADMIN")) {out.print(" selected ");}%>>ADMIN</option>
																	<option value="AUXILIAR"
																		<%if (dadosUsuario != null && dadosUsuario.getPerfil().equals("AUXILIAR")) {out.print(" selected ");}%>>AUXÍLIAR</option>
																	<option value="SECRETARIA"
																		<%if (dadosUsuario != null && dadosUsuario.getPerfil().equals("SECRETARIA")) {out.print(" selected ");}%>>SECREÁRIA</option>
																</select>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="login" type="text" name="login"
																	class="form-control" required=""
																	value="${dadosUsuario.login}"> <span
																	class="form-bar"></span> <label class="float-label">Login:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="senha" type="password" name="senha"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.senha}"> <span
																	class="form-bar"></span> <label class="float-label">Senha:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="cep" type="text" name="cep"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.cep}"> <span
																	class="form-bar"></span> <label class="float-label">CEP:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="uf" type="text" name="uf"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.uf}"> <span
																	class="form-bar"></span> <label class="float-label">UF:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="cidade" type="text" name="cidade"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.cidade}"> <span
																	class="form-bar"></span> <label class="float-label">Cidade:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="bairro" type="text" name="bairro"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.bairro}"> <span
																	class="form-bar"></span> <label class="float-label">Bairro:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="logradouro" type="text" name="logradouro"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.logradouro}"> <span
																	class="form-bar"></span> <label class="float-label">Logradouro:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="numero" type="text" name="numero"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.numero}"> <span
																	class="form-bar"></span> <label class="float-label">Numero:</label>
															</div>
															<div class="form-group form-default form-static-label">
																Sexo:</br> masculino:<input
																	<%if (dadosUsuario != null && !dadosUsuario.getSexo().equals(null) && dadosUsuario.getSexo().equals("MASCULINO")) {out.print(" checked ");}%>
																	id="sexo" type="radio" value="MASCULINO"
																	checked="checked" name="sexo"> feminino:<input
																	<%if (dadosUsuario != null && !dadosUsuario.getSexo().equals(null) && dadosUsuario.getSexo().equals("FEMININO")) {out.print(" checked ");}%>
																	id="sexo" type="radio" value="FEMININO" name="sexo">
															</div>
															<div class="form-group form-default form-static-label">
																<button onclick="limarForm();" class="btn btn-secondary waves-effect waves-light">Limpar Formulario</button>
																<button type="submit" class="btn btn-success waves-effect waves-light">Salvar</button>
																<button type="button" onclick="deletarAjax();" class="btn btn-danger waves-effect waves-light">Excluir</button>
																
																<c:if test="${dadosUsuario != null}">
																	
																	<a href="<%=request.getContextPath()%>/servletTelefoneController?idUser=${dadosUsuario.id}" class="btn btn-dark">Telefone</a>
																	
																</c:if>
																<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Pesquisar</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-block" style="overflow: scroll; height: 500px;">
														<div class="card-header">
															<h5>Lista de Usuário</h5>
														</div>
														<table id="tableListaUsuario" class="table table-hover">
															<thead>
																<tr>
																	<th scope="col">ID</th>
																	<th scope="col">NOME</th>
																	<th scope="col">E-MAIL</th>
																	<th scope="col">VER</th>
																</tr>
															</thead>
															<tbody>
																
															</tbody>
														</table>
														<div class="d-flex justify-content-center">
															<nav aria-label="Page navigation example">
															  <ul id="pag" class="pagination">
															    
															  </ul>
															</nav>
														</div>
														<div id="total"></div>
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div  class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="overflow: scroll; height: 500px;">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							id="nomeBuscar" aria-label="Recipient's username"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-success waves-effect waves-light"
								type="button" onclick="buscarUser()">Pesquisar</button>
						</div>
					</div>
					<table id="tabelaResultados"  class="table">
						<thead>
							<tr  >
								<th  scope="col">ID</th>
								<th  scope="col">NOME</th>
								<th  scope="col">VER</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul id="pagModal" class="pagination">
															    
							</ul>
						</nav>
					</div>
					<div id="totalPagModal"></div>
				</div>
				<div class="modal-footer">
					<button  type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<script type="text/javascript">
	
	
		window.onload =  function () {
			
			var url = document.getElementById("formUsuario").action;
						
			$.ajax({
				
				method : "get",
				url : url,
				data : "acao=paginar",
				success : function(response, textStatus,xhr) {

					var json = JSON.parse(response);
					
					$('#tableListaUsuario > tbody > tr').remove();
					$("#pag > li").remove();
																			
					for (var p = 0; p < json.length; p++) {
						
						if(json[p].email == null){
							
							json[p].email = "     ";
							
						}
						
						$('#tableListaUsuario > tbody').append('<tr><td>'+ json[p].id+ '</td><td>'+ json[p].nome+ '</td><td>'+ json[p].email + '</td>'
								+ '<td> <button class="btn btn-success" onclick="editar('+ json[p].id +');">ver</a> </td></tr>');;
					}
					
					var totalPaginaAjax = xhr.getResponseHeader("totalPagina");
					
					for(var i = 0; i < totalPaginaAjax; i++){
						var url = "acao=listaAjax&pagina=" + i*5; 
						$('#pag').append('<li class="page-item"><a class="page-link" href="#" onclick="listaOffSet(\''+url+'\')">'+(i+1)+'</a></li>');
						
					}
					
					document.getElementById('total').textContent = 'Resultados: '+totalPaginaAjax;
					
				}
				
			}).fail(function(xhr, status, errorThrown) {
				alert('Erro ao buscar usuario por nome:'
						+ xhr.responseText);
			});
			
		}
		
		function listaOffSet(url){
			
			var urlAction = document.getElementById("formUsuario").action;
			
			
			$.ajax({
				
				method : "get",
				url : urlAction,
				data : url,
				success : function(response, textStatus,xhr) {

					var json = JSON.parse(response);
														
					$('#tableListaUsuario > tbody > tr').remove();
					$("#pag > li").remove();
					
					for (var p = 0; p < json.length; p++) {
						
						if(json[p].email == null){
							
							json[p].email = "     ";
							
						}
						
						$('#tableListaUsuario > tbody').append('<tr><td>'+ json[p].id+ '</td><td>'+ json[p].nome+ '</td><td>'+ json[p].email + '</td>'
								+ '<td> <button class="btn btn-success" onclick="editar('+ json[p].id +');">ver</a> </td></tr>');;
					}
					
					var totalPaginaAjax = xhr.getResponseHeader("totalPagina");
					
					for(var i = 0; i < totalPaginaAjax; i++){
						
						var url = "acao=listaAjax&pagina=" + i*5; 
						
						$('#pag').append('<li class="page-item"><a class="page-link" href="#" onclick="listaOffSet(\''+url+'\')">'+(i+1)+'</a></li>');
						
					}
					
					scroll();
					
					document.getElementById('total').textContent = 'Resultados: '+totalPaginaAjax;
					
				}
				
				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ao buscar usuario por nome:'
						+ xhr.responseText);
				});
			}
		
		function scroll(){
			var pos = $("#tableListaUsuario").offset().top;
			window.scrollBy(0,pos);
		}
		
		function editar(id) {
			var urlAction = document.getElementById('formUsuario').action;
			
			window.location.href = urlAction + '?acao=editar&idUser='+id;
		}
		
		function limarForm() {
			var elementos = document.getElementById("formUsuario");

			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
		// Preview de imagem de usuario
		function visualizarImg(fotoUsuario, filefoto) {

			var preview = document.getElementById(fotoUsuario);
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result;
			}

			if (fileUser) {
				reader.readAsDataURL(fileUser);
			} else {
				preview.src = '';
			}
		}
		//buscar com ajax
		function buscarUser() {

			var nomeBuscar = document.getElementById('nomeBuscar').value;

			if (nomeBuscar != null && nomeBuscar != ''
					&& nomeBuscar.trim() != '') {

				var urlAction = document.getElementById('formUsuario').action;

				$('#tabelaResultados > tbody > tr').remove();
				$("#pagModal > li").remove();
				
				$.ajax({
					method : 'get',
					url : urlAction,
					data : "nomeBuscar=" + nomeBuscar
							+ "&acao=buscarAjax",
					success : function(response, textStatus,xhr) {

						var json = JSON.parse(response);
						
						var totalPaginaAjax = xhr.getResponseHeader("totalPaginaAjaxModal");

						for (var p = 0; p < json.length; p++) {
							$('#tabelaResultados > tbody')
									.append('<tr><td>'+ json[p].id+ '</td><td>'+ json[p].nome
											+ '</td>'+ '<td> <button type="button" class="btn btn-info" onclick="verEditar('
											+ json[p].id + ')">info</button> </td></tr>');
						}
						
						for(var i = 0; i < totalPaginaAjax; i++){
							
							var url ="nomeBuscar="+ nomeBuscar + "&acao=buscarAjaxPagina&pagina="+(i*5);
							
							$('#pagModal').append('<li class="page-item"><a class="page-link" href="#" onclick="listaOffsetModal(\''+url+'\')">'+(i+1)+'</a></li>');
							
						}
						
						document.getElementById('totalPagModal').textContent = 'Resultados: '+totalPaginaAjax;

					}

				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ao buscar usuario por nome:'
							+ xhr.responseText);
				});
			}
		}
		function listaOffsetModal(url) {

			var nomeBuscar = document.getElementById('nomeBuscar').value;

			if (nomeBuscar != null && nomeBuscar != ''
					&& nomeBuscar.trim() != '') {

				var urlAction = document.getElementById('formUsuario').action;

				$('#tabelaResultados > tbody > tr').remove();
				$("#pagModal > li").remove();
				
				
				$.ajax({
					method : 'get',
					url : urlAction,
					data : url,
					success : function(response, textStatus,xhr) {

						var json = JSON.parse(response);
						
						var totalPaginaAjax = xhr.getResponseHeader("totalPaginaAjaxModal");

						for (var p = 0; p < json.length; p++) {
							$('#tabelaResultados > tbody')
									.append('<tr><td>'+ json[p].id+ '</td><td>'+ json[p].nome
											+ '</td>'+ '<td> <button type="button" class="btn btn-info" onclick="verEditar('
											+ json[p].id + ')">info</button> </td></tr>');
						}
						
						for(var i = 0; i < totalPaginaAjax; i++){
							
							var url ="nomeBuscar="+ nomeBuscar + "&acao=buscarAjaxPagina&pagina="+(i*5);
							
							$('#pagModal').append('<li class="page-item"><a class="page-link" href="#" onclick="listaOffsetModal(\''+url+'\')">'+(i+1)+'</a></li>');
							
						}
						
						document.getElementById('totalPagModal').textContent = 'Resultados: '+totalPaginaAjax;

					}

				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ao buscar usuario por nome:'
							+ xhr.responseText);
				});
			}
		}
		// Deletar com ajax
		function deletarAjax() {
			
			var urlAction = document.getElementById("formUsuario").action; 
			var idUser = document.getElementById("id").value;
			var nome = document.getElementById("nome").value;
			
			if(idUser != null && idUser != '' && idUser.trim() != ''){
				if(confirm("Deseja Excluir o usuário: "+ nome +"?")){
					
					$.ajax({
						
						method : "get",
						url : urlAction,
						data : "idUser=" + idUser + "&acao=deletarAjax",
						success : function(response, textStatus,xhr) {
							
							limarForm();
							
							$('#msg').append("<div style=\"background-color: #d1e7dd;color: #0f5132;border-color: #0f5132;\" class='alert alert-success '><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\r\n"
							+ "<strong><i class=\"far fa-check-circle\"></i> Usuário Excluido com sucesso!!</strong></div>");
						}
						
					}).fail(function(xhr, status, errorThrown) {
						alert('Erro ao buscar usuario por nome:'
								+ xhr.responseText);
					});
				}
			}else{
				alert("Nenhum usuário selecionado para Excluir!!");
			};
		}
	</script>
</body>

</html>
