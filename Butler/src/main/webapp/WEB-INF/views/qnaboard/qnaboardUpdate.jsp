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
<!--   <link href="../resources/css/plugins.css" rel="stylesheet"> -->
		
  <!-- Style & Common Css --> 
  <link href="../resources/css/common.css" rel="stylesheet">
    
    <script src = "<c:url value = '../resources/js/jquery-3.4.1.js'/>"></script>
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>
			function writeConfirm()
			{
				if(confirm("修正しますか。"))
				{
					var updateFormDoc = document.getElementById("updateForm");
					updateFormDoc.submit();
				}
			}
		</script>
  
    
        
</head>
<body>
<h1 class="site-heading text-center text-white d-none d-lg-block">
    <span class="site-heading-upper text-primary mb-3">投稿の修正</span>
    <span class="site-heading-lower">執事の条件</span>
  </h1>
  
  <form action="<c:url value = '/qnaboard/update'/>" method="post" id = "updateForm" enctype="multipart/form-data">

	<table style="margin-top: 70px;margin-left: auto; margin-right: auto; border-radius: 10px;background-color: white" border="1">
		<tr>
			<th style="text-align: center;color: black;">投稿者</th>
			<td><input type = "text" value = "${sessionScope.userid}" disabled="disabled" style="width: 500px;color: black;"></td>
		</tr>
		<tr>
			<th style="text-align: center;color: black;">タイトル</th>
			<td><input type = "text" name = "title" id = "title1" value = "${read.title}" required = "required" style="width: 500px;color: black;"></td>
			<!-- required 를 쓰면 값이 무조건 들어가야 넘어간다 -->
		</tr>
		<tr>
			<th style="text-align: center;color: black;">ファイル</th>
			<td>
				${read.originalFileName}
				<a href = "<c:url value = '/qnaboard/deleteFile?boardnum=${read.boardnum}'/>" >
					<input type = "button" value = "削除" style="color: black;" >
				</a>
				<input type = "file" name = "uploadFile">
				
			</td>
		</tr>
		<tr>
			<th style="text-align: center;color: black;">内容</th>
			<td><textarea cols="5" rows="10" placeholder = "内容" name = "content" id = "content" style="width: 500px;color: black;">${read.content}</textarea> </td>
		</tr>
		<tr>
			<td class="right" colspan="2" style="text-align: center;">
				<input type = "button" value = "確認" onclick ="writeConfirm()">
				<input type = "reset" value = "リセット">
				<a href = "<c:url value = '/qnaboard/qnaboardList'/>">
					<input type = "button" value ="戻る" style="color: black;">
 				</a>
				
				
		
			</td>
		</tr>
	</table>
	<input type = "hidden" name = "boardnum" value ="${read.boardnum}">
</form>

 

	
	<footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; 執事の条件</p>
    </div>
  </footer>
  
   <script src="../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 

  


	

	

</body>
</html>