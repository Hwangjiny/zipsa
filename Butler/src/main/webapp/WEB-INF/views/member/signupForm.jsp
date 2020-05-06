<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>執事の条件</title>

  <!-- Bootstrap core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/css/business-casual.min.css" rel="stylesheet">
  
  <!-- All Plugin Css --> 
  <link href="../resources/css/plugins.css" rel="stylesheet">
		
  <!-- Style & Common Css --> 
  <link href="../resources/css/common.css" rel="stylesheet">
  
	<script>
		function idCheckForm() { 
			open("<c:url value='idCheckForm'/>", "_blank", "width=500, height=200");
		}
	</script>

</head>

<body>

  <h1 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-primary mb-3">会員登録</span>
    <span class="site-heading-lower">執事の条件</span>
  </h1>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
    <div class="container">
      <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="#">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav mx-auto">    
		    <section class="login-wrapper">
		    	<div class="container">
					<div class="col-md-6 col-sm-8 col-md-offset-3 col-sm-offset-2">
		   				<form action="<c:url value='signup'/>" method="post">
							<table>
								<tr>
									<th style="color: white;">ユーザID</th>
									<td>
										<input type="text" id="userid" name="userid" required="required" readonly="readonly" class="form-control input-lg" placeholder="Username">
									</td>
									<td>
										<input type="button" value="IDチェック" onclick="idCheckForm()" class="btn btn-primary">
									</td>
								</tr>
								<tr>
									<th style="color: white;">パスワード</th>
									<td>
										<input type="password" name="userpwd" required="required" class="form-control input-lg" placeholder="Password">
									</td>
								</tr>
								
								<tr>
									<th style="color: white;">氏名</th>
									<td>
										<input type="text" name="username" required="required" class="form-control input-lg" placeholder="お名前">
									</td>
								</tr>								
								<tr>
									<th style="color: white; width: 100px;">電話番号</th>
									<td>
										<input type="tel" name="phone" required="required" class="form-control input-lg" placeholder="携帯番号"
										pattern="(010)-\d{3,4}-\d{4}" title="例)010-0000-0000">
										
									</td>
								</tr>
								
								<tr>
									<th colspan="3" style="text-align: center;">
										<input type="submit" id="signupbtn" value="アカウント登録" disabled="disabled" class="btn btn-primary">
										<input type ="button" value = "キャンセル" onclick = "history.back(-1);" class="btn btn-primary">
									</th>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</section>
        </ul>
      </div>
    </div>
  </nav>

  <footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; 執事の条件 2020</p>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
