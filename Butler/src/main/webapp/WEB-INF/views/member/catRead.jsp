<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>執事の条件</title>
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 <script>
			function writeConfirm()
			{
				if(confirm("入力した情報に修正しますか。"))
				{
					var updateFormDoc = document.getElementById("updateForm");
					updateFormDoc.submit();
				}
			}
		</script>



</head>
<body>
	<input type="hidden" value="userInfo" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 
	
	<div class="container">
		<div class="jumbotron" style='background-color: #351F15; margin-top: 30px;'>
		<form action="<c:url value = '/updateCat'/>" method="post" id = "updateForm">
		<table style="margin: auto; width: 80%; color: white;">
					<thead>
						<tr>
							<th>No.</th>
							<th>ユーザ名</th>
							<th>猫の名前</th>
							<th>猫の生年月日</th>
						</tr>
					</thead>
					<tbody>
					
					
	  	
					    <tr>
					      <th scope="row">
					      	${list.cat_no }
					      </th>
					      
					      <th>
					      	${list.userid }
					      </th>
					      <th>   	
					      		<input type = "text" value = "${list.catname }" id = "catname" name = "catname">
					      </th>
					      <th><input type = "date" value = "${list.cat_birth }" id = "cat_birth" name = "cat_birth">
					      		
					      		<input type = "button" value ="修正" onclick ="writeConfirm()" class="btn btn-primary">
					      		<a href = "<c:url value = '/catDelete?cat_no=${list.cat_no}'/>">
									<input type = "button" value = "削除" class="btn btn-primary">
								</a>
					      

						</th> 
					    </tr>
				   
				    </tbody>
				
										
					</table>
					<input type = "hidden" value = "${list.cat_no }" name = "cat_no">
					<input type = "hidden" value = "${list.userid }" name = "userid">
			</form>
			</div>
			</div>
					
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<c:choose>
	<c:when test="${sessionScope.userid != null}">
	  
					<div style="position: fixed; right: 20px; bottom: 20px;">
						<a href="javascript:void chatChannel()">
							  <img src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png"/ style="width: 120px;">
							</a>
					</div>
				
				
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
	
	 <jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 

</body>
</html>