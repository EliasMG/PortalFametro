<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="FlavioAlves">
<link rel="shortcut icon" href="img/favicon.ico">

<!-- Mascara -->
<script type="text/javascript" src="jquery/jquery.js"></script>
<script type="text/javascript" src="jquery/jquery.maskedinput.js"></script>
<script type="text/javascript" src="js/mascara/mascara.js"></script>

<!-- consulta do endereço pelo cep -->
<script type="text/javascript" src="js/cep-consulta/cep-consulta.js"></script>


<title>Portal Fametro | Perfil</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="css/custom.min.css" rel="stylesheet">

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<%@ include file="menu-de-navegacao.jsp"%>
			<%@ include file="navegacao-de-topo.jsp"%>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Perfil do Usuário</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" name="search" id="search"
										class="form-control" placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="x_panel">
								<div class="x_title">
									<c:if
										test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Secretario') }">
										<h2>Informações do Secretário</h2>
									</c:if>
									<c:if
										test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Professor') }">
										<h2>Informações do Professor</h2>
									</c:if>
									<c:if
										test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Aluno') }">
										<h2>Informações do Aluno</h2>
									</c:if>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 profile_left">
										<div class="profile_img">
											<div id="crop-avatar">
												<!-- Current avatar -->
												<img class="img-responsive avatar-view" src="images/img.jpg"
													alt="Avatar" title="Change the avatar">
											</div>
										</div>
										<h3>${usuarioLogado.getPrimeiroNome() }</h3>

										<ul class="list-unstyled user_data">
											<li><i class="fa fa-map-marker user-profile-icon"></i>
												${usuarioLogado.getEndereco().getBairro() },
												${usuarioLogado.getEndereco().getCidade() },
												${usuarioLogado.getEndereco().getEstado() }</li>
											<c:if
												test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Aluno') }">
												<li><i class="fa fa-briefcase user-profile-icon"></i>
													${usuarioLogado.getCurso().getNome() }</li>
											</c:if>
											<c:if
												test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Professor') }">
												<c:forEach var="disciplina"
													items="${usuarioLogado.getDisciplinas() }">
													<li><i class="fa fa-briefcase user-profile-icon"></i>
														${disciplina.getNome() }</li>
												</c:forEach>
											</c:if>
										</ul>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
										<div class="x_content">
											<br />
											<c:if
												test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Aluno') }">
												<form id="demo-form2" name="demo-form2"
													data-parsley-validate
													class="form-horizontal form-label-left" method="post"
													action="AlunoController.do">
											</c:if>
											<c:if
												test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Professor') }">
												<form id="demo-form2" name="demo-form2"
													data-parsley-validate
													class="form-horizontal form-label-left" method="post"
													action="ProfessorController.do">
											</c:if>
											<c:if
												test="${tipoUsuarioLogado.getNome().equalsIgnoreCase('Secretario') }">
												<form id="demo-form2" name="demo-form2"
													data-parsley-validate
													class="form-horizontal form-label-left" method="post"
													action="SecretarioController.do">
											</c:if>
											<div class="profile_title">
												<div class="col-md-6">
													<h2>Identificação</h2>
												</div>
											</div>
											<br />
											<div class="form-group">
												<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
													<label class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
														for="registro">Registro Acadêmico <span
														class="required">*</span>
													</label>
													<div>
														<input disabled type="text" name="registro" id="registro"
															required class="form-control"
															value="${usuarioLogado.getMatricula() }">
													</div>

												</div>
												<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
													<label class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
														for="nome">Nome <span class="required">*</span>
													</label>
													<div>
														<input disabled type="text" name="nome" id="nome" required
															class="form-control" value="${usuarioLogado.getNome() }">
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12"
														for="data-nascimento">Data de Nascimento <span
														class="required">*</span>
													</label>
													<div>
														<input disabled type="date" name="data-nascimento"
															id="data-nascimento" required class="form-control"
															value="${DateUtility.DateToHtml(usuarioLogado.getNascimento()) }">
													</div>
												</div>
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12"
														for="naturalidade">Naturalidade <span
														class="required">*</span>
													</label>
													<div>
														<input disabled type="text" name="naturalidade"
															id="naturalidade" required class="form-control"
															value="${usuarioLogado.getNaturalidade() }">
													</div>
												</div>
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12"
														for="estado-natal">Estado Natal <span
														class="required">*</span>
													</label>
													<div>
														<input disabled type="text" name="estado-natal"
															id="estado-natal" required class="form-control"
															value="${usuarioLogado.getEstadoNatal() }">
													</div>
												</div>
											</div>

											<br />
											<div class="profile_title">
												<div class="col-md-6">
													<h2>Endereço</h2>
												</div>
											</div>
											<br />
											<div class="form-group">
												<div class="col-md-3 col-sm-3 col-xs-3">
													<label class="col-md-12 col-sm-12 col-xs-12" for="cep">CEP
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="cep" id="cep" required
															class="form-control"
															value="${usuarioLogado.getEndereco().getCep() }">
													</div>
												</div>
												<div class="col-md-9 col-sm-9 col-xs-9">
													<label class="col-md-12 col-sm-12 col-xs-12" for="rua">Logradouro
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="logradouro" id="rua" required
															class="form-control"
															value="${usuarioLogado.getEndereco().getLogradouro() }">
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-5 col-sm-5 col-xs-5">
													<label class="col-md-12 col-sm-12 col-xs-12"
														for="complemento">Complemento <span
														class="required">*</span>
													</label>
													<div>
														<input type="text" name="complemento" id="complemento"
															required class="form-control"
															value="${usuarioLogado.getEndereco().getComplemento() }">
													</div>
												</div>
												<div class="col-md-3 col-sm-3 col-xs-3">
													<label class="col-md-12 col-sm-12 col-xs-12" for="numero">Número
														<span class="required">*</span>
													</label>
													<div>
														<input type="number" min=0 max=999999999 name="numero"
															id="numero" required class="form-control"
															value="${usuarioLogado.getEndereco().getNumero() }">
													</div>
												</div>
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12" for="bairro">Bairro
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="bairro" id="bairro" required
															class="form-control"
															value="${usuarioLogado.getEndereco().getBairro() }">
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-6">
													<label class="col-md-12 col-sm-12 col-xs-12" for="estado">Estado
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="estado" id="uf" required
															class="form-control"
															value="${usuarioLogado.getEndereco().getEstado() }">
													</div>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-6">
													<label class="col-md-12 col-sm-12 col-xs-12" for="cidade">Cidade
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="cidade" id="cidade" required
															class="form-control"
															value="${usuarioLogado.getEndereco().getCidade() }">
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-6">
													<label class="col-md-12 col-sm-12 col-xs-12" for="pais">País
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="pais" id="pais" required
															class="form-control"
															value="${usuarioLogado.getEndereco().getPais() }">
													</div>
												</div>
												<div class="col-md-6 col-sm-6 col-xs-6">
													<label class="col-md-12 col-sm-12 col-xs-12" for="email">Email
														<span class="required">*</span>
													</label>
													<div>
														<input type="text" name="email" id="email" required
															class="form-control" value="${usuarioLogado.getEmail() }">
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12"
														for="fone-residencial">Telefone Residencial <span
														class="required">*</span>
													</label>
													<div>
														<input type="text" name="fone-residencial"
															id="fone-residencial" required class="form-control"
															value="${usuarioLogado.getResidencial() }">
													</div>
												</div>
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12"
														for="fone-celular">Telefone Celular <span
														class="required">*</span>
													</label>
													<div>
														<input type="text" name="fone-celular" id="fone-celular"
															required class="form-control"
															value="${usuarioLogado.getCelular() }">
													</div>
												</div>
												<div class="col-md-4 col-sm-4 col-xs-4">
													<label class="col-md-12 col-sm-12 col-xs-12" for="fone-3">Telefone
														3 <span class="required">*</span>
													</label>
													<div>
														<input type="text" name="fone-3" id="fone-3" required
															class="form-control"
															value="${usuarioLogado.getOpcional() }">
													</div>
												</div>
											</div>

											<div class="ln_solid"></div>
											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="reset" class="btn btn-warning" name="reset"
														value="Redefinir"> <input type="submit"
														class="btn btn-success" name="action"
														value="Alterar Perfil">
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
			<%@ include file="conteudo-do-rodape.jsp"%>
		</div>
	</div>

	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="js/custom.min.js"></script>
</body>
</html>