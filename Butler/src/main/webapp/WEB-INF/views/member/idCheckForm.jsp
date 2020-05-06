<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IDチェック</title>
	    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
	<script>
		function closeFunc() {
			close();
		}

		function submitId() {
			var useridDoc = opener.document.getElementById("userid");
			var signupBtnDoc = opener.document.getElementById("signupbtn");
			useridDoc.value = "${userid}";
			signupBtnDoc.removeAttribute("disabled");
			close();
		}
	</script>
	
</head>

<body>
	<h1>IDチェック</h1>
	<form action="<c:url value='checkid' />" method="post">
		<input type="text" name="userid" value="${userid}" required="required">
		<input type="submit" value="チェック">
		<input type="button" id="btn" value="入力" onclick="submitId()" disabled="disabled">
		<input type="button" value="キャンセル" onclick="closeFunc()">
	</form>
	
	<c:choose>
		<c:when test="${checkResult == true}">
			<p>このIDは使用可能です。</p>
			<script>
				document.getElementById("btn").removeAttribute("disabled");
			</script>
		</c:when>
		
		<c:when test="${checkResult == false}">
			<p>このIDは使用できません。</p>
		</c:when>
	</c:choose>
</body>

</html>
