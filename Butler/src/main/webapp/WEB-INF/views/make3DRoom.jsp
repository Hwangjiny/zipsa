<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
<style>
* { font-family: "Sawarabi Gothic"; }
</style>
<meta charset="UTF-8">
<title>３Dルームシミュレーション</title>
<script src="https://unpkg.com/konva@4.2.2/konva.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/three.js'/>"></script>
<script src="<c:url value='/resources/js/OrbitControls.js'/>"></script>
<script src="<c:url value='/resources/js/OBJLoader.js'/>"></script>
<script src="<c:url value='/resources/js/MTLLoader.js'/>"></script>
<script src="<c:url value='/resources/js/GLTFLoader.js'/>"></script>
<script src="<c:url value='/resources/js/DRACOLoader.js'/>"></script>

</head>
<body>
	<input type='hidden' value='0' id='roomData'>
	
	<script src="<c:url value='/resources/js/room3DMaker.js'/>"></script>
	
	
</body>
</html>