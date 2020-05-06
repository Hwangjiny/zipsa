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
    
  
        
</head>
<body>

	<input type="hidden" value="freeData" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include>
	
	 <script type="text/javascript">
		$(function(){
			$('#ment').fadeOut(5000);
			$('#ment').fadeIn(5000); 
		});

		function pageProc(currentPage, searchItem, searchKeyword) 
		{
			location.href="<c:url value='/board/boardList' />" 
				+"?currentPage=" + currentPage 
				+ "&searchItem=" + searchItem
				+ "&searchKeyword=" + searchKeyword;
		}
	</script> 

		<form action = "<c:url value = '/board/boardList'/>" method = "get">
			<select name = "searchItem" style="background-color: #31230a; color: white; height: 30px; margin-top: 20px; margin-left: 10%;">
				<option value = "userid" selected="selected">投稿者</option>
				<option value = "title">タイトル</option> 
				<option value = "content">内容</option>
			</select>
			<input type = "text" name = "searchKeyword">
			<input type = "submit" value = "検索" onclick = "return search()" class="btn btn-primary"><br>
			<br/>
		</form>
	
	<table class="table table-striped" frame='void' style='width: 80%; margin: 0 auto; margin-bottom: 50px;'>
	 
	    <tr style="background-color: #2D170F;">
	      <th scope="col" style='color: white;'>番号</th>
	      <th scope="col" style='color: white;'>投稿者</th>
	      <th scope="col" style='color: white;'>タイトル</th>
	      <th scope="col" style='color: white;'>ヒット</th>
	      <th scope="col" style='color: white;'>投稿日</th>
	    </tr>
	  
	  	<c:forEach items="${requestScope.list }" var="board">
	  	
		    <tr style="border-bottom-color: black; background-color: #D0944E;" class='colorCheck'>
		      <th scope="row">${board.boardnum }</th>
		      <th>${board.userid }</th>
		      <th id = "title" style="font-size: 130%;">
					<a href = "<c:url value = '/board/read?boardnum=${board.boardnum}'/>">
					${board.title }
					</a>
				</th>
		      <th>${board.hit }</th>
		      <th id = "inputdate">${board.inputdate}</th> 
		    </tr>
	    </c:forEach>
	    
	  <tr style="background-color: #2D170F;">
			<td id="navigator" colspan="5" style="text-align: center; color: black;">
				<a href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchItem}', '${searchKeyword}')" style="color: white;">◁◁ </a> &nbsp;&nbsp;
				<a href="javascript:pageProc(${navi.currentPage - 1}, '${searchItem}', '${searchKeyword}')" style="color: white;">◀</a> &nbsp;&nbsp;
					
				<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
					<c:if test="${counter == navi.currentPage}"></b></c:if>
						<a href="javascript:pageProc(${counter}, '${searchItem}', '${searchKeyword}')" style="color: white;">${counter}</a>&nbsp;
					<c:if test="${counter == navi.currentPage}"></b></c:if>
				</c:forEach>
				&nbsp;&nbsp;
				<a href="javascript:pageProc(${navi.currentPage + 1}, '${searchItem}', '${searchKeyword}')" style="color: white;">▶</a> &nbsp;&nbsp;
				<a href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchItem}', '${searchKeyword}')" style="color: white;">▷▷</a>
				<a href= "<c:url value= '/board/boardWriteForm'/>" >
					<input type = "button" value = "投稿" class="btn btn-primary">
				</a> 
			</td>
		</tr>
	  
	</table>
	
	<script>
		$("tr.colorCheck:odd").css('background', '#C3A159');
		$("tr.colorCheck:even").css('background', '#8A723F');		
	</script> 
	
  <jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 
  
  <c:choose>
	<c:when test="${sessionScope.userid != null}">
	  
					<div style="position: fixed; right: 20px; bottom: 20px;">
						<a href="javascript:void chatChannel()">
							  <img src="https://developers.kakao.com/assets/img/about/logos/channel/consult_small_yellow_pc.png"/ style="width: 120px;">
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