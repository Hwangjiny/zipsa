<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
    <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>

<!-- Modal -->
  <div class="modal fade" id="loginModal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" data-backdrop="false" style="background-color: rgba(0, 0, 0, 0.5);">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">ログイン</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form action="<c:url value='/member/login' />" method="post">
        <div class="modal-body" >
				<input type="text" name="userid" class="form-control input-lg" placeholder="ユーザID" style="width: 350px; margin: 0 auto; margin-top: 5px;">
				<input type="password" name="userpwd" class="form-control input-lg" placeholder="パスワード" style="width: 350px; margin: 0 auto; margin-top: 5px;">
        </div>
        <div class="modal-footer">
        	<button type="submit" class="btn btn-primary">ログイン</button>
         	<button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="logOutModal" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" data-backdrop="false" style="background-color: rgba(0, 0, 0, 0.5);">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">ログアウト</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
				<h4>本当にログアウトしますか。</h4>
        </div>
        <div class="modal-footer">
	        <form action="<c:url value='/logout' />" method="get">
		        <button type="submit" class="btn btn-primary">ログアウト</button>
	        </form>
         	<button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <footer class="footer text-faded text-center py-5">
    <div class="container">
		
      <p class="m-0 small">Copyright &copy; 執事の条件 2020</p>
      
    </div>
</footer>
  
