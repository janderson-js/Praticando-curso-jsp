<!DOCTYPE html>
<html lang="pt-br">

<head>
<title>Mega Able bootstrap admin template by codedthemes</title>
<jsp:include page="principal/head.jsp"></jsp:include>
</head>

<body themebg-pattern="theme1">
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="loader-track">
			<div class="preloader-wrapper">
				<div class="spinner-layer spinner-blue">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
				<div class="spinner-layer spinner-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-yellow">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>

				<div class="spinner-layer spinner-green">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="gap-patch">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->

	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

					<form class="form-group form-default form-static-label"
						class="row g-3 needs-validation"
						action="<%=request.getContextPath()%>/ServletLogin" method="post"
						novalidate>
						<div class="text-center">
							<img src="assets/images/logo.png" alt="logo.png">
						</div>
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">Login JSP</h3>
									</div>
								</div>
								<strong>${msgLogin}</strong> 
								<div class="form-group form-primary">
									<label class="float-label">Login:</label> <input type="text"
										id="login" name="login" class="form-control"
										autocomplete="off" required="required"> <span
										class="form-bar"></span>
								</div>
								<div class="form-group form-primary">
									<label class="float-label">Senha:</label> <input
										type="password" name="senha" id="senha" class="form-control"
										autocomplete="off" required> <span class="form-bar"></span>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">Entrar</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- end of form -->
				</div>
				<!-- end of col-sm-12 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container-fluid -->
	</section>


	<jsp:include page="principal/javascriptfile.jsp"></jsp:include>
	<script type="text/javascript">
		$('.alert').alert()
	</script>
</body>

</html>
