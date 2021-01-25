<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
<link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
<style>
* { font-family: "Sawarabi Gothic"; }
</style>
<style>
body div.mainButton {
	text-align: center;
	margin: 0 auto;
}
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>執事の条件</title>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

  <c:if test="${requestScope.signupResult == true}">
	<script>alert("会員登録完了");</script>
  </c:if>
  
  <c:if test="${requestScope.loginResult == false}">
	<script>alert("idまたはパスワードが正しくありません");</script>
  </c:if>
  
</head>

<body>

	<input type="hidden" value="home" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 

  <section class="page-section clearfix">
    <div class="container">
      <div class="intro">
        <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="resources/img/intro.jpg" alt="">
        <div class="intro-text left-0 text-center bg-faded p-5 rounded" style="margin-top: 0px; height: 433px;">
          <h2 class="section-heading mb-4">
            <span class="section-heading-upper">正しいペット文化</span>
            <span class="section-heading-lower">執事の条件 -commit test version-</span>
          </h2>
           <pre class="mb-3">
「執事の条件」は
ペットたちの幸せと同時に、お客様に満足していただけるよう
常に変化し、発展のために努力を続けています。
健康で正しいペット文化を目指し、
いつも初心を忘れずに真っ直ぐな道に進もうと
持続的な努力に力を注いでいます。
執事の条件の会員になってください!
          </pre>
        </div>
      </div>
    </div>
  </section>

  <section class="page-section cta">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <div class="cta-inner text-center rounded">
            <h2 class="section-heading mb-4">
              <span class="section-heading-upper">Our Promise</span>
              <span class="section-heading-lower">To You</span>
            </h2>
             <p class="mb-0">「執事の条件」は、正しいペット文化が定着するまで先頭に立って努力します。</p>
             <p class="mb-0">We will always keep our initial commitment and improve our cat's happiness, health, and customer satisfaction.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
   
   <!--  
  <div class="intro-button mx-auto mainButton" style="margin: 0 auto;">
        <a class="btn btn-primary btn-xl" href="#">Visit Us Today!</a>
  </div>
   -->
   
  <!-- 카카오 챗봇 버튼 -->
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
