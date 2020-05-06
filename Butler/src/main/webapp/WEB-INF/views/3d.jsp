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

<style type="text/css">
	.drag-item, .outside-drag-item {
    position:absolute;
    background: url('resources/img/table0.png');
    background-size: 100% 100%;
    width:40px;height:20px;
    cursor:move;
    background-position: 50% 50%;
}
.drop-target {
    position:relative;
    margin:0 auto;
    border:dashed 1px orange;
    background: url('resources/img/grid_20.png') repeat;
}

#test {
	
	display: flex;
	align-items: center;
	opacity: 0.5;
	width: 1000px; height: 750px;
	border: solid 1px black;
	background-color: white;
	margin:0 auto;
}

#control {
	position: absolute;
	left: 130px;
	top: 450px; 
	
}

</style>

</head>

<body>

	<input type="hidden" value="3dData" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 
	
	<script src="https://unpkg.com/konva@4.2.2/konva.min.js"></script>
	<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/three.js'/>"></script>
	<script src="<c:url value='/resources/js/OrbitControls.js'/>"></script>
	<script src="<c:url value='/resources/js/OBJLoader.js'/>"></script>
	<script src="<c:url value='/resources/js/MTLLoader.js'/>"></script>
	<script src="<c:url value='/resources/js/GLTFLoader.js'/>"></script>
	<script src="<c:url value='/resources/js/DRACOLoader.js'/>"></script>

  	<div class='container' style="margin-top: 50px;">
		<div style="color: white;">
			横 : <input type='number' id='roomWidth'>m
		</div>
		<div style="color: white;">
			縦 : <input type='number' id='roomHeight' name='stet'>m
		</div>
		<div style="color: white;">
			天井高は３m基準
			<input type='hidden' value="30" id="roomDepth">
		</div>
		
		<div id="canves"></div>
		<div>
			<button type="button" class='btn btn-info' onclick='makeroom()'>お部屋を作る</button>
			<button type="button" class='btn btn-info' onclick='makemodelSet()' disabled="disabled" id='makingModelButton'>家具セット</button>
			<button type='button' class='btn btn-primary' id='make3DRoom'>3Dビュー</button>
			
		</div>
	</div>
	<div id="test" style="margin-top: 20px; margin-bottom: 50px;">
		
	</div>
	
		<div id='control' class='col-md-2' style="width: 240px; margin-right: 0 auto;">
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="width: 240px; margin-right: 0 auto;">
			</div>
		</div>
	
	<input type='hidden' value='0' id='tempData'>
	
	<script src="<c:url value='/resources/js/RoomMaker.js'/>"></script>
	
	 <jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 
	 
	 <c:choose>
		<c:when test="${sessionScope.userid != null}">
					<div style="position: fixed; right: 20px; bottom: 20px;">
						<a href="javascript:void chatChannel()">
							  <img src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png" style="width: 120px;">
							</a>
					</div>
	 	 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>			
		</c:when>
	</c:choose>

   <!-- 카카오 챗봇 을 위해 추가 -->
  	<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('bcb304f051b2968e7a9473de010e09a0');
    function chatChannel() {
      Kakao.Channel.chat({
        channelPublicId: '_hHcGxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
      });
    }
  //]]>
</script>

</body>

</html>
