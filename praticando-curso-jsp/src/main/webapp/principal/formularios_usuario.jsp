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
														<h5>Buscar Formulário</h5>
													</div>
													<div class="card-boody">
														<form class="form-material" id="formFormulario"
															method="get"
															action="<%=request.getContextPath()%>/servletFormulario?">

															<div class="form-group row" style="max-width: 1000px;">
																<input type="hidden" id="acao" name="acao"
																	value="formularioHTML"> <label
																	class="col-sm-2 col-form-label"
																	style="margin-top: 8px; margin-left: 15px;">Fomulário:</label>
																<div class="col-sm-10"
																	style="max-width: 180px; margin-left: 15px;">
																	<input type="date" id="dataInicial" name="dataInicial"
																		class="form-control">
																</div>
																<label class="" style="margin-top: 10px;">Até</label>
																<div class="col-sm-10"
																	style="max-width: 180px; margin-left: 15px;">
																	<input type="date" id="dataFinal" name="dataFinal"
																		class="form-control">
																</div>
																<div class="col-sm-10 d-flex"
																	style="max-width: 180px; margin-top: 3px; margin-left: 15px;">
																	<button title="Gerar Relátorio"
																		style="margin-right: 5px;" type="button"
																		onclick="imprimirHTML();" class="btn btn-primary mb-2">
																		<i class="fas fa-file-alt"></i>
																	</button>
																</div>
															</div>

														</form>
														<div id="card-header"></div>
														<div id="card-body" style="overflow: scroll; height: 500px; display: none;">
															<table id="tableListaUsuario" class="table table-hover">
																<thead style="background-color: #448aff; color: #fff;">
																	<tr>

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
	</div>

	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<script type="text/javascript">
		function imprimirHTML() {

			//document.getElementById("acao").value = "formularioHTML";
			var dataInicial = document.getElementById("dataInicial").value;
			var dataFinal = document.getElementById("dataFinal").value;
			var element = document.getElementById("card-body");
			
			

			if (verificarDatas(dataInicial, dataFinal)) {
				
				element.style.display = "block"

				var url = document.getElementById("formFormulario").action;

				$.ajax({

									method : "get",
									url : url,
									data : "acao=formularioHTML&dataInicial="
											+ dataInicial + "&dataFinal="
											+ dataFinal,
									success : function(response, textStatus,
											xhr) {

										var json = JSON.parse(response);
										
										element.classList.remove("card-body");
										
										$('#tableListaUsuario > tbody > tr')
												.remove();
										$('#tableListaUsuario > thead > tr')
												.remove();
										$("#card-header > div").remove();
										$("#pag > li").remove();

										$('#tableListaUsuario > thead')
												.append(
														"<tr> <td>ID</td> <td>NOME</td> <td>E-MAIL</td> <td>TELEFONE(S)</td> </tr>");
										element.classList.add("card-body");

										for (var p = 0; p < json.length; p++) {

											if (json[p].email == null) {

												json[p].email = "     ";

											}

											$('#tableListaUsuario > tbody')
													.append(
															'<tr><td>'
																	+ json[p].id
																	+ '</td><td>'
																	+ json[p].nome
																	+ '</td><td>'
																	+ json[p].email
																	+ '</td><td>'+
																	
																	"<div  class='dropdown show'> <a style='background-color: #448aff; color: #fff;' class='btn btn-secondary dropdown-toggle' href='#' role='button' id='dropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Telefone(s)</a>"+

																  "<div id='listaTelefone"+p+"'class='dropdown-menu' aria-labelledby='dropdownMenuLink'></div></div>"
																  
																	+'</td></tr>');
											for(telefone of json[p].telefones){
												$("#listaTelefone"+p).append("<a class='dropdown-item' href='#'>"+ telefone.numero +"</a>");
											}
										}
										
										var totalPaginaAjax = xhr.getResponseHeader("totalPagAjaxForm");
										
										for(var i = 0; i < totalPaginaAjax; i++){
											var url = "acao=listaAjaxFormHTML&pagina=" + i*5 + "&dataInicial=" + dataInicial + "&dataFinal=" + dataFinal; 
											$('#pag').append('<li class="page-item"><a class="page-link" href="#" onclick="listaOffSet(\''+url+'\')">'+(i+1)+'</a></li>');
											
										}
										
										document.getElementById('total').textContent = 'Total de Paginas: '+totalPaginaAjax;
										
										$("#card-header")
												.append(
														"<div class='card-header'><h5>Formulário de Usuários Cadastrados</h5></div>");
									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuario por nome:'
											+ xhr.responseText);
								});
			}
		}
		
		function listaOffSet(url){
			
			var urlAction = document.getElementById("formFormulario").action;
			var element = document.getElementById("card-body");
			var dataIncial = document.getElementById("dataInicial").value;
			var dataFinal = document.getElementById("dataFinal").value;
			
			$.ajax({

						method : "get",
						url : urlAction,
						data :url,
						success : function(response, textStatus,
								xhr) {

							var json = JSON.parse(response);
						
							
							element.classList.remove("card-body");
							
							$('#tableListaUsuario > tbody > tr')
									.remove();
							$('#tableListaUsuario > thead > tr')
									.remove();
							$("#card-header > div").remove();
							$("#pag > li").remove();

							$('#tableListaUsuario > thead')
									.append(
											"<tr> <td>ID</td> <td>NOME</td> <td>E-MAIL</td> <td>TELEFONE(S)</td> </tr>");
							element.classList.add("card-body");

							for (var p = 0; p < json.length; p++) {

								if (json[p].email == null) {

									json[p].email = "     ";

								}

								$('#tableListaUsuario > tbody')
										.append(
												'<tr><td>'
														+ json[p].id
														+ '</td><td>'
														+ json[p].nome
														+ '</td><td>'
														+ json[p].email
														+ '</td><td>'+
														"<div  class='dropdown show'> <a style='background-color: #448aff; color: #fff;' class='btn btn-secondary dropdown-toggle' href='#' role='button' id='dropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Telefone(s)</a>"+

													  "<div id='listaTelefone"+p+"'class='dropdown-menu' aria-labelledby='dropdownMenuLink'></div></div>"
													  
														+'</td></tr>');
								for(telefone of json[p].telefones){
									$("#listaTelefone"+p).append("<a class='dropdown-item' href='#'>"+ telefone.numero +"</a>");
								}
							}
							
							var totalPaginaAjax = xhr.getResponseHeader("totalPagAjaxForm");
							
							for(var i = 0; i < totalPaginaAjax; i++){
								var url = "acao=listaAjaxFormHTML&pagina=" + i*5 + "&dataInicial="+ dataIncial + "&dataFinal="+ dataFinal; 
								$('#pag').append('<li class="page-item"><a class="page-link" href="#" onclick="listaOffSet(\''+url+'\')">'+(i+1)+'</a></li>');
								
							}
							
							document.getElementById('total').textContent = 'Total de Paginas: '+totalPaginaAjax;
							
							$("#card-header")
									.append(
											"<div class='card-header'><h5>Formulário de Usuários Cadastrados</h5></div>");
						}

					}).fail(
					function(xhr, status, errorThrown) {
						alert('Erro ao buscar usuario por nome:'
								+ xhr.responseText);
					});			
			
		}

		function verificarDatas(dataInicial, dataFinal) {
			var a = true;

			if (dataFinal.trim() != "" && dataFinal != "" && dataFinal != null) {
				if (dataInicial == "" || dataInicial.trim() == "" || dataInicial == null) {
					alert("informe a data inicial!!");
					a = false;
				}

			} else if (dataInicial != "" && dataFinal == "") {
				alert(" Não foi informada a data Final!! \n");
				a = false;
			}

			if (dataFinalMenor()) {
				if (a) {
					if (dataMaiorAtual()) {
						return a;
					} else {
						alert("As data informadas não podem ser maior que a data atual");
					}
				}
			} else {
				alert("A data final não pode ser menor que a data incial!!");
			}
		}

		function dataMaiorAtual() {
			var urlAction = document.getElementById("formFormulario").action;

			var dataResult = true;

			var data1 = new Date(document.getElementById("dataInicial").value);
			var data2 = new Date(document.getElementById("dataFinal").value);
			var dataAtual = new Date(dataAtualFormatada());

			if (data1.getTime() > dataAtual.getTime() || data2.getTime() > dataAtual.getTime()) {
				dataResult = false;
			}

			return dataResult;
		}

		function dataFinalMenor() {
			var urlAction = document.getElementById("formFormulario").action;

			var data1 = new Date(document.getElementById("dataInicial").value);
			var data2 = new Date(document.getElementById("dataFinal").value);

			var dataResult = true;

			if (data2.getTime() < data1.getTime()) {
				dataResult = false;
			}

			return dataResult;
		}

		function dataAtualFormatada() {
			var data = new Date(), dia = data.getDate().toString(), diaF = (dia.length == 1) ? '0'
					+ dia
					: dia, mes = (data.getMonth() + 1).toString(), //+1 pois no getMonth Janeiro começa com zero.
			mesF = (mes.length == 1) ? '0' + mes : mes, anoF = data
					.getFullYear();
			return anoF + "-" + mesF + "-" + diaF;
		}
	</script>
</body>

</html>
