<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>

<!-- All Plugin Css -->
<!--  <link href="resources/css/plugins.css" rel="stylesheet"> -->

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/business-casual.min.css'/>" rel="stylesheet">

<!-- Style & Common Css -->
<link href="<c:url value='/resources/css/common.css'/>" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src = "<c:url value = '/resources/js/jquery-3.4.1.js'/>"></script>
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

<h1 class="site-heading text-center text-white d-none d-lg-block">
	<span class="site-heading-upper text-primary mb-3" id='pageFrontName'>トップ</span> <span
		class="site-heading-lower">執事の条件</span>
</h1>


<c:choose>
	<c:when test="${sessionScope.userid != null}">
		<section class="login-wrapper">
			<div class="container">
				<div align="right">
					<span style="font-size: 20px; color: white; font-style: italic;">${sessionScope.userid} 様、ようこそ</span>
				</div>
			</div>
		</section>

	</c:when>
</c:choose>



<!-- Navigation -->
<nav class="navbar navbar-expand navbar-dark" id="mainNav">
	<div class="container">
		<a
			class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
			href="#" style="text-align: center;">執事の条件</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#menu" aria-expanded="false"
			aria-controls="menu">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="menu">
			<ul class="navbar-nav mx-auto nav">
				<li class="nav-item px-lg-2" id='homePage'><a
					class="nav-link text-uppercase text-expanded" href="<c:url value = '/index'/>" 
					style="font-size: 15px;">Home<span class="sr-only">(current)</span></a></li>
				<li class="nav-item px-lg-2" id='SMSPage'><a
					class="nav-link text-uppercase text-expanded" href="<c:url value = '/products'/>" 
					style="font-size: 15px;">予防接種通知サービス</a></li>
				<li class="nav-item px-lg-2" id='locatePage'><a
					class="nav-link text-uppercase text-expanded" href="<c:url value = '/myLocation'/>" 
					style="font-size: 15px;">近所の動物病院</a></li>
				<li class="nav-item px-lg-2" id='freePage'><a
					class="nav-link text-uppercase text-expanded" 
					href="<c:url value = '/board/boardList'/>" style="font-size: 15px;">コミュニティー</a></li>
				<li class="nav-item px-lg-2" id='3dPage'><a
					class="nav-link text-uppercase text-expanded" href="<c:url value = '/3d'/>" 
					style="font-size: 15px;">3Dインテリア</a></li>
				<li class="nav-item px-lg-2" id='QnAPage'><a
					class="nav-link text-uppercase text-expanded" 
					href="<c:url value = '/qnaboard/qnaboardList'/>" style="font-size: 15px;">Q & A</a></li>
			</ul>
			
			<script>
				var tempPageData = $('#pageData').val();

				switch(tempPageData) {
				
				case 'home':
					$('#homePage').addClass('active');
					$('#homePage > a').addClass('disabled')
					$('#pageFrontName').text('HOME');
					break;
					
				case 'product':
					$('#SMSPage').addClass('active');
					$('#SMSPage > a').addClass('disabled')
					$('#pageFrontName').text('予防接種通知サービス');
					break;

				case 'locateData':
					$('#locatePage').addClass('active');
					$('#locatePage > a').addClass('disabled')
					$('#pageFrontName').text('近所の動物病院');
					break;

				case 'freeData':
					$('#freePage').addClass('active');
					$('#freePage > a').addClass('disabled')
					$('#pageFrontName').text('コミュニティー');
					break;

				case '3dData':
					$('#3dPage').addClass('active');
					$('#3dPage > a').addClass('disabled')
					$('#pageFrontName').text('3Dインテリア');
					break;

				case 'QnaData':
					$('#QnAPage').addClass('active');
					$('#QnAPage > a').addClass('disabled')
					$('#pageFrontName').text('Q&A');
					break;

				case 'userInfo':
					$('#Home').addClass('active');
					$('#Home > a').addClass('disabled')
					$('#pageFrontName').text('会員情報');
					break;
				}
				
			</script>
			<c:choose>
				<c:when test="${sessionScope.userid == null}">
					<ul class="nav navbar-nav nav-item navbar-right">
						<li><a href="member/signupForm"><span
								class="glyphicon glyphicon-user"></span> 会員登録</a></li>
						<li><a href="#" data-toggle='modal' data-target='#loginModal'><span
								class="glyphicon glyphicon-log-in"></span> ログイン</a></li>
					</ul>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.userid != null}">
					<ul class="nav navbar-nav nav-item navbar-right">
						<li><a href="/project/userInfo"><span class="glyphicon glyphicon-user"></span>会員情報</a></li>
						<li><a href="#" data-toggle='modal' data-target='#logOutModal'><span class="glyphicon glyphicon-log-out"></span>ログアウト</a></li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
</nav>