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
			.radius_border{border:1px solid #919191;border-radius:5px;}     
			.custom_typecontrol {position:absolute;top:33%;left:43%;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:15px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
			.custom_typecontrol span {display:block;width:64px;height:30px;float:left;text-align:center;cursor:pointer;font-size:15px;padding:0;}
			.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
			.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
			.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
			.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
			.custom_typecontrol .selected_btn:hover {color:#fff;}   
			.custom_zoomcontrol {position:absolute;top:37%;left:49%;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
			.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;padding-top: 5px;}     
			          
		</style>
		
		<style>
		body div.mainButton {
			text-align: center;
			margin: 0 auto;
		}
		
		</style>
    
    <c:if test="${requestScope.smsYesResult == true }">
		<script>alert("SMS通知サービスが登録されました。")</script>
	</c:if>
	<c:if test="${requestScope.smsNoResult == true }">
		<script>alert("SMS通知サービスが解除されました。")</script>
	</c:if>
</head>
<script>
	function smsOk(){
		if(confirm("予防接種通知サービスを申し込みしますか。") == true){
			location.href="<c:url value='/smsOk'/>";
		} else{
				return;
			}	
		
	};

	function smsNo(){
		if(confirm("予防接種通知サービスを解除しますか。") == true){
			location.href="<c:url value='/smsNo'/>";
		} else{
				return;
			}	
		
	};
</script>

<body>
	
	<input type="hidden" value="product" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 


  <!-- Bootstrap core JavaScript -->
  <section class="page-section clearfix">
    <div class="container">
      <div class="intro">
        <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="resources/img/sms.jpg" alt="사진 출력 오류" style="height: 440px;">
        <div class="intro-text left-0 text-center bg-faded p-5 rounded" style="margin-top: 0px; height: 440px;">
          <h2 class="section-heading mb-4">
            <span class="section-heading-lower" style="font-size: 30px;"><b>我が愛する猫<br>いつまでも, お元気で</b></span>
            <span class="section-heading-upper">適期に正しい予防接種を。</span>
          </h2>
          <pre class="mb-3">
飼い猫に、適時に正しいワクチンを接種することは
一生の健康を守るため
飼い主ができる最も重要なことのひとつです。
<b>「執事の条件」は最適な予防接種日程のお知らせを提供します。</b>
<br>また、正確な接種日程やアトバイスのために、
<b><a href="myLocation" style="color: black;">近所の動物病院</a></b> メニューを通して、お近くの獣医との相談をお勧めします。
          </pre>
        </div>
      </div>
    </div>
  </section>
  
  <div>
  	<c:if test="${requestScope.result.sms_agr == 'n'}">
          <div class="intro-button mx-auto mainButton">
            <a class="btn btn-primary btn-xl" href="#" onclick="smsOk()">予防接種通知サービスのお申し込み</a>
          </div>
          </c:if>
          <c:if test="${requestScope.result.sms_agr == 'y'}">
 			<div class="intro-button mx-auto mainButton">
            <a class="btn btn-primary btn-xl" href="#" onclick="smsNo()">サービス利用中<br><b>予防接種通知サービスの解除はこちらへ</b></a>
            </div>
 		</c:if>
 		
  </div>
 
  <section class="page-section cta">
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <div class="cta-inner text-center rounded">
            <h2 class="section-heading mb-4">
              <span class="section-heading-upper"></span>
              <span class="section-heading-lower"><b>猫の予防接種について</b></span>
            </h2>           
			<div>
				一般的に必須ワクチンと言うのは4種総合ワクチン、白血病を含め計5種ワクチンを指します。<br>
				さらに、義務に定められている狂犬病ワクチンと、死亡率が比較的高い伝染性腹膜炎のワクチンの接種を勧めています。<br>
				<br><br>
				<b>予防接種のプランのご案内</b><br><br>
				生後2ヶ月:総合ワクチン4種1次、(選択)白血病1次接種推奨時期<br>
				生後3ヶ月:総合ワクチン4種2次、(選択)白血病2次接種推奨時期<br>
				生後4ヶ月:総合ワクチン4種3次、(選択)腹膜炎1次接種推奨時期<br>
				生後5ヶ月:(義務)狂犬病ワクチン、(選択)腹膜炎2次接種推奨時期<br>
				<br>
				※より詳しい説明につきましては、<a href="myLocation" style="color: black;">近所の動物病院</a> メニューを通して、お近くの獣医との相談をお勧めします。
			</div>
			<br> 
          </div>
        </div>
      </div>
    </div>
  </section>
	
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