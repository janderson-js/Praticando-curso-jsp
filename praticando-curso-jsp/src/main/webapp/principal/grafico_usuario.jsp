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
														<h5>Gerar Gráfico</h5>
													</div>
													<div class="card-boody">
														<form class="form-material" id="formGrafico"
															method="get"
															action="<%=request.getContextPath()%>/servletGrafico?">

															<div class="form-group row" style="max-width: 1000px;">
																<input type="hidden" id="acao" name="acao"
																	value="formularioHTML"> <label
																	class="col-sm-2 col-form-label"
																	style="margin-top: 8px; margin-left: 15px;">Gráfico de:</label>
																<div class="col-sm-10"
																	style="max-width: 180px; margin-left: 15px;">
																	<input type="date" id="dataInicial" name="dataInicial"
																		class="form-control">
																</div>
																<label class="" style="margin-top: 10px;">até</label>
																<div class="col-sm-10"
																	style="max-width: 180px; margin-left: 8px;">
																	<input type="date" id="dataFinal" name="dataFinal"
																		class="form-control">
																</div>
																<div class="col-sm-10 d-flex"
																	style="max-width: 180px; margin-top: 3px; margin-left: 15px;">
																	<button title="Gerar Relátorio"
																		style="margin-right: 5px;" type="button"
																		onclick="gerarGrafico();" class="btn btn-primary mb-2">
																		<i class="fas fa-chart-line"></i>
																	</button>
																</div>
															</div>

														</form>
														<div id="card-header"></div>
														<div id="card-body" style="max-height: 600px; display: none;">
															<canvas id="myChart" style="max-height: 600px;"></canvas>
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript">
	
		var myChart = new Chart(document.getElementById('myChart'));
	
		function gerarGrafico() {

			var dataInicial = document.getElementById("dataInicial").value;
			var dataFinal = document.getElementById("dataFinal").value;
			var element = document.getElementById("card-body");

			if (verificarDatas(dataInicial, dataFinal)) {
				
				element.style.display = "block"

				var url = document.getElementById("formGrafico").action;

				$.ajax({

						method : "get",
						url : url,
						data : "acao=gerarGrafico&dataInicial="
								+ dataInicial + "&dataFinal="
								+ dataFinal,
						success : function(response, textStatus,xhr) {

							var json = JSON.parse(response);
										
							myChart.destroy();
							
							myChart = new Chart(document.getElementById('myChart'), {
								type : 'line',
								data : {
									labels :json.perfil,
									datasets : [ {
										label : 'Gráfico de média salarial por tipo',
										backgroundColor : 'rgb(255, 99, 132)',
										borderColor : 'rgb(255, 99, 132)',
										data : json.salario,
									} ]
								},
								options : {}
							});
						}

				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ao buscar usuario por nome:'+ xhr.responseText);
				});
			}
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
			var urlAction = document.getElementById("formGrafico").action;

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
			var urlAction = document.getElementById("formGrafico").action;

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
