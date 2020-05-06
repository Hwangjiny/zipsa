<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
<title>ストリートビュー</title>
  <script src = "<c:url value = '/resources/js/jquery-3.4.1.js'/>"></script>
</head>
<body>
	<div id="roadview" style="width:100%;height:700px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bcb304f051b2968e7a9473de010e09a0"></script>
	<script>
	
	var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
	
	var x = ${xx};
	var y = ${yy};
	
	

	var position = new kakao.maps.LatLng(x, y);
	
	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
	});
	// 지금 좀 부정확해서 거리로 바꾸는거랑, 2,3번 로드뷰 수정
	
	</script>
	
</body>
</html>