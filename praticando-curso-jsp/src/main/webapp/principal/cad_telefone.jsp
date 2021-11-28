<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
														<h5>Cad. Telefone de Usuário</h5></br></br>
														<span id="msg">${msg}</span>
													</div>
													<div class="card-block">
														
														<form class="form-material"
															id="formTelefone" method="post"
															action="<%=request.getContextPath()%>/servletTelefoneController">
															
															<div class="form-group form-default form-static-label">
																<input id="nome" type="text" name="nome" readonly="readonly"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Usuário:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="numero" type="hidden" name="idUser"
																	class="form-control" required="" autocomplete="off"
																	value="${dadosUsuario.id}"> <span
																	class="form-bar"></span> <label class="float-label"></label>
															</div>
															<div class="form-group form-default form-static-label">
																<input id="numero" type="text" name="numero"
																	class="form-control" required="" autocomplete="off"
																	value=""> <span
																	class="form-bar"></span> <label class="float-label">Numero:</label>
															</div>
															<div class="form-group form-default form-static-label">
																<button type="submit" class="btn btn-success waves-effect waves-light">Salvar</button>
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
															<h5>Lista de Telefone</h5></br></br>
														<span id="msg">${msgLista}</span>
														</div>
														<table id="tableListaUsuario" class="table table-hover">
															<thead>
																<tr>
																	<th scope="col">ID</th>
																	<th scope="col">Número</th>
																	<th scope="col">Ação</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${ListaTelefones}" var="t">
																	<tr>
																		<td> <c:out value="${t.id}"></c:out> </td>
																		<td> <c:out value="${t.numero}"></c:out> </td>
																		<td> <button type="button" onclick="deletar('${t.id}','${t.idUser}');" class="btn btn-danger waves-effect waves-light">Excluir</button> </td>
																	</tr>
																</c:forEach>
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
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      
   <jsp:include page="javascriptfile.jsp"></jsp:include>
   <script type="text/javascript">
   		function deletar(id, id_user) {
			var urlAction =  document.getElementById("formTelefone").action;
			urlAction = urlAction + "?acao=deletar&id="+ id +"&idUser="+ id_user;
			window.location.href = urlAction;
		}
   </script>
</body>

</html>
