<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				<c:if test="${imgUser != '' && imgUser != null}">					
						<img alt="Imagem do Usuário" class="img-80 img-radius"  src="${imgUser}" width="70px">
					</c:if>
					<c:if test="${imgUser == '' || imgUser == null}">
						<img alt="Imagem do Usuário" class="img-80 img-radius"  src="assets/images/avatar-6.png" width="70px">
					</c:if>
				<div class="user-details">
					<span id="more-details">${usuarioLogado.nome}<i class="fa fa-caret-down"></i></span>
				</div>
			</div>

			<div class="main-menu-content">
				<ul>
					<li class="more-details"><a href="<%=request.getContextPath()%>/ServletLogin?acao=sair"><i
							class="ti-layout-sidebar-left"></i>Sair</a></li>
				</ul>
			</div>
		</div>
		<div class="pcoded-navigation-label"
			data-i18n="nav.category.navigation"></div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="active"><a href="<%=request.getContextPath()%>/principal/principal.jsp"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-home"></i><b>D</b></span> <span class="pcoded-mtext"
					data-i18n="nav.dash.main">Inicio</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
			<li class="pcoded-hasmenu"><a href="javascript:void(0)"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layout-grid2-alt"></i></span> <span class="pcoded-mtext"
					data-i18n="nav.basic-components.main">Usuários</span> <span
					class="pcoded-mcaret"></span>
			</a>
				<ul class="pcoded-submenu">
					<li class=" "><a href="<%=request.getContextPath()%>/ServletUsuarioController?acao=lista"
						class="waves-effect waves-dark"> <span class="pcoded-micon"><i
								class="ti-angle-right"></i></span> <span class="pcoded-mtext"
							data-i18n="nav.basic-components.alert"><i class="far fa-address-book"></i> Gerenciar Usuário</span> <span
							class="pcoded-mcaret"></span>
					</a></li>
				</ul></li>
		</ul>
		<div class="pcoded-navigation-label" data-i18n="nav.category.forms">Formulário(s)</div>
		<ul class="pcoded-item pcoded-left-item">
			<li><a href="<%=request.getContextPath()%>/principal/formularios_usuario.jsp"
				class="waves-effect waves-dark"> <span class="pcoded-micon"><i
						class="ti-layers"></i><b>FC</b></span> <span class="pcoded-mtext"
					data-i18n="nav.form-components.main">Form. Usuário</span> <span
					class="pcoded-mcaret"></span>
			</a></li>
		</ul>

		<div class="pcoded-navigation-label" data-i18n="nav.category.forms">Gráficos</div>
		<ul class="pcoded-item pcoded-left-item">
			<li><a href="chart.html" class="waves-effect waves-dark"> <span
					class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span> <span
					class="pcoded-mtext" data-i18n="nav.form-components.main">Chart</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
			<li><a href="map-google.html" class="waves-effect waves-dark">
					<span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
					<span class="pcoded-mtext" data-i18n="nav.form-components.main">Maps</span>
					<span class="pcoded-mcaret"></span>
			</a></li>
		</ul>
	</div>
</nav>