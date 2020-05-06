<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>執事の条件</title>
        <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
    <style>
    
    	.board-th {
    		font-family: arial;
    		font-size: 20px;
    		background-color: #E6A756;
    		text-align: center;
    		width: 100px;
    		color: white;
    	}
    	
    	.board-td {
    		font-family: dotum;
    		font-size: 15px;
    		background-color: #76542C;
    		text-align: center;
    		width: 500px;
    		color: white;
    	}
    	
    </style>
</head>
<body>

	<input type="hidden" value="freeData" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 
	
	<script>
		function delete1()
		{
			return confirm("削除しますか。");
			
		}

		function update1()
		{
			if(confirm("修正しますか。"))
			{
				location.href = "<c:url value = '/board/boardUpdate?boardnum=${requestScope.read.boardnum}'/>";
			}
		}

		function replyDelete(a,b)
		{
			if(confirm("削除しますか。"))
			{
				location.href = "<c:url value ='/board/replyDelete?replynum='/>"+a+"&boardnum="+b;
				
			}
		}

		function backmenu()
		{
			location.href = "<c:url value = '/board/boardList'/>"
		}
	
	</script>
	
	<c:choose>
		<c:when test="${requestScope.replyDelete==true }">
			<script>alert("コメントが削除されました。");</script>
		</c:when>
			
		<c:when test="${requestScope.replyDelete==false }">
			<script>alert("コメントの削除に失敗しました。");</script>
		</c:when>
	</c:choose>

<table frame=void style="margin-top: 70px; margin: 0 auto; margin-bottom: 30px" border= "1">
	<tr height="60px">
		<td class="right" colspan="2" style="text-align: right; ">
<!-- 			수정 / 삭제 / 목록 버튼 넣기 -->
<!-- 			수정 / 삭제 / 버튼은 게시글 작성자와 접속 유저가 동일할 경우에만 출력-->
			<c:if test = "${read.userid == sessionScope.userid}">
				
				<input type = "button" value = "修正" onclick = "return update1()" class="btn btn-primary">
				
				<a href = "<c:url value = '/board/delete?boardnum=${read.boardnum}'/>">
				<input type = "button" value = "削除" onclick = "return delete1()" class="btn btn-primary">
				</a>
			</c:if>
			
				<input type = "button" value ="戻る" onclick = "backmenu()" class="btn btn-primary">
 				
		</td>
	</tr>
	
	<tr>
		<th class="board-th">番号</th>
		<td class="board-td">${read.boardnum}</td>
	</tr>
	
	<tr>
		<th class="board-th">投稿者</th>
		<td class="board-td">${read.userid}</td>
	</tr>
	
	<tr>
		<th class="board-th">投稿日</th>
		<td class="board-td">${read.inputdate}</td>
	</tr>
	
	<tr>
		<th class="board-th">ヒット</th>
		<td class="board-td">${read.hit}</td>
	</tr>
	
	<tr>
		<th class="board-th">タイトル</th>
		<td class="board-td">${read.title }</td>
	</tr>
	
	<tr>
		<th class="board-th">ファイル</th>
		<td id = "boardfile" class="board-td">
			<a href = "<c:url value = '/board/download?boardnum=${read.boardnum}'/>">
			${read.originalFileName}
			</a>
		</td>
	</tr>
	
	<tr>
		<th class="board-th" >内容</th>
		<td class="board-td" style="height: 300px; text-align: left; vertical-align: top; border: 10px;">${read.content }</td>
	</tr>
</table>


<form action="<c:url value = '/board/replyWrite'/>" method = "post">
	<input type = "hidden" name = "boardnum" value = "${read.boardnum}"/>
	<table id = "replyinput" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td style="color: black;">
				<input id = "replytext" type = "text" name = "replytext" required="required" style="width: 519px;">
				<input id = "replysubmit" type = "submit" value = "コメント入力" class="btn btn-primary"/>
			</td>
		</tr>
	</table>
</form>
<br/>
<div id = "replydisplay" style="margin-bottom: 50px;">
	<table class = "reply" style="margin-left: auto; margin-right: auto; border-color: black; background-color: white; " border="1">
	  
		<tr>
			<th style="color: white; width: 350px; text-align: center; background-color: #E6A756;">内容</th>
			<th style="color: white; width: 70px; text-align: center; background-color: #E6A756;">投稿者</th>
			<th colspan="2" style="color: white; width: 180px; text-align: center; background-color: #E6A756;">投稿日</th>
		</tr>
		
		
	<c:forEach items="${replyList}" var = "reply">
	
		
		<tr>
			<td class = "replytext" style="background-color: #76542C; color: white;"> 
				${reply.replytext } 
			</td>
			
			<td class = "replyid" style="background-color: #76542C; color: white; text-align: center;"> 
				<span> ${reply.userid} </span>
			</td>
			
			<td class = "replydate" style="background-color: #76542C; color: white;">
				<span> ${reply.inputdate} </span>
			</td>
			
			<c:if test = "${sessionScope.userid == reply.userid }">
				<td class = "replybutton" style="background-color: #76542C;">
					<input type = "button" value = "削除" onclick = "replyDelete('${reply.replynum}','${reply.boardnum}')" class="btn btn-primary">
				</td>
			</c:if>
		</tr>
		
	</c:forEach>
	 
		
	</table>
</div>

<jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 	

</body>
</html>