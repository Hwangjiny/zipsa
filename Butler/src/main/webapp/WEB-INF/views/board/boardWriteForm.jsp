<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
    <meta charset="utf-8">
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
    
    <script src = "<c:url value = '../resources/js/jquery-3.4.1.js'/>"></script>
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
			function writeConfirm()
			{
				var title = document.getElementById("title1");
				var content = document.getElementById("content");
				if(title.value.length==0)
				{
					alert("タイトルを入力してください。");
					return false;
				}
				if(content.value.length==0)
				{
					alert("内容を登録してください。");
					return false;
				}
				return confirm("登録しますか。"); //확인 누르면 true 아니오 누르면 false
			}
		</script>
  
    
        
</head>
<body>
<h1 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-primary mb-3">投稿を作成</span>
    <span class="site-heading-lower">執事の条件</span>
  </h1>
  
  <form action="<c:url value = '/board/write'/>" method="post" enctype="multipart/form-data">
	<table style="margin-top: 70px;margin-left: auto; margin-right: auto; border-radius: 10px;background-color: white" border="1" >
		<tr>
			<th style="text-align: center;color: black;">投稿者</th>
			<td><input type = "text" style="width: 500px;color: black;" value = "${sessionScope.userid}" disabled="disabled" name = "userid"></td>
		</tr>
		<tr>
			<th style="text-align: center;color: black;">タイトル</th>
			<td><input type = "text" style="width: 500px;color: black;" name = "title" id = "title1" placeholder = "タイトル" required = "required" 
			name = "title"></td>
			<!-- required 를 쓰면 값이 무조건 들어가야 넘어간다 -->
		</tr>
		<tr>
			<th style="text-align: center;color: black;">ファイル</th>
			<td>
				<input type = "file" name = "uploadFile" value = "ファイルを選択" style="color: black;">
			</td>
		</tr>
		<tr>
			<th style="text-align: center;color: black;">内容</th>
			<td><textarea cols="10" rows="10" placeholder = "内容" name = "content" id = "content" style="width: 500px;color: black;"></textarea> </td>
		</tr>
		<tr>
			<td class="right" colspan="2" style="text-align: center;color: black;">
				<input type = "submit" value = "投稿" onclick ="return writeConfirm()">
				<input type = "reset" value = "リセット">
				<input type = "button" value = "戻る" onclick = "history.back(-1);">
		
				
		
			</td>
		</tr>
	</table>
</form>

 

	
	<footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; Your Website 2020</p>
    </div>
  </footer>
  
   <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 

  


	

	

</body>
</html>