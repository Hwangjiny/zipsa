<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
        <link href="https://fonts.googleapis.com/css?family=Sawarabi+Gothic" rel="stylesheet">
		<style>
		* { font-family: "Sawarabi Gothic"; }
		</style>
    <title>執事の条件</title>
    
  
  <style type="text/css">
  /* Google Speech API */
	#speech_Button {
	    border: none;
	    background-color:transparent;
	    padding: none;
	}
	
	/* Mic 이미지 크기 */
	#speech_img {
	    width: 35px;
	    height: 35px;
	}
  
  </style>
      
</head>
<body>

	<input type="hidden" value="locateData" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 


  <table style="margin-top: 70px;margin-left: auto; margin-right: auto; margin-bottom: 50px;">
  	<tr>
  		<th style="color: white; height: 100px;font-size: 30px;">出発地 : <span id = "start" style="color: white;font-size: 30px;"></span>
  		</th>
  	  	</tr>
  	
  	<tr>
  		<th style="color: white; height: 100px;font-size: 30px;">目的地 : <input type = "text" id = "end" style="width: 200px;">
  		<button id="start_button" onclick="startButton(event)">
		  <img id="start_img" src="resources/img/mic.gif" alt="Start Listening....">
		</button>
  		</th>
  		
  	</tr>
  	
  	<tr>
  		<td colspan="2" style="text-align: center;">
	  		<input type = "button" value = "ルート" id = "check" class = "btn btn-primary">
	  		<a href="myLocation"><input type='button' value='戻る' class='btn btn-primary'></a>
	 	 </td>
  	</tr>
  
  </table>
  
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
  
 
	  

  
  
  <script>

		 $(function(){
			    var val = location.href.substr(
				          location.href.lastIndexOf('=') + 1
				      );
				      var a = decodeURI(val);
				      $('#start').html(a);
				      
				  });

        var final_transcript = '';
        var recognizing = false;
        var ignore_onend;
        var start_timestamp;
        var search_input = document.getElementById('end'); // 자신의 검색 상자 태그ID를 여기에 넣습니다.
        var search_Button = document.getElementById('speech_img');

        // Browser Upgrade or Not supported Browser
        if (!('webkitSpeechRecognition' in window)) {
            upgrade();
        } else {
            start_button.style.display = 'inline-block';
            var recognition = new webkitSpeechRecognition();
            recognition.continuous = true;
            recognition.interimResults = true;

            recognition.onstart = function() {
                recognizing = true;
                start_img.src = 'resources/img/mic-animate.gif';
            };

            recognition.onerror = function(event) {
                if (event.error == 'no-speech') {
                    start_img.src = 'resources/img/mic.gif';
                    ignore_onend = true;
                }
                if (event.error == 'audio-capture') {
                    start_img.src = 'resources/img/mic.gif';
                    ignore_onend = true;
                }
                if (event.error == 'not-allowed') {
                    ignore_onend = true;
                }
            };

            recognition.onend = function() {
                recognizing = false;
                if (ignore_onend) {
                    return;
                }
                start_img.src = 'resources/img/mic.gif';
                if (!final_transcript) {
                    return;
                }
                if (window.getSelection) {
                    window.getSelection().removeAllRanges();
                    var range = document.createRange();
                    range.selectNode(search_input);
                    window.getSelection().addRange(range);
                }
            };

            recognition.onresult = function(event) {
                var interim_transcript = '';
                for (var i = event.resultIndex; i < event.results.length; ++i) {
                    if (event.results[i].isFinal) {
                        final_transcript += event.results[i][0].transcript;
                    } else {
                        interim_transcript += event.results[i][0].transcript;
                    }
                }
                final_transcript = capitalize(final_transcript);
                search_input.value = linebreak(final_transcript);
            };
        }

        function searchVisible() {
            if(search_Button.style.display != 'inline-block') {
                search_Button.style.display = 'inline-block';
            } else {
                speech_Button.style.display = 'none';
            }
        }

        function searchHidden() {
            if(search_Button.style.display != 'none') {
                search_Button.style.display = 'none';
            }
        }

        function upgrade() {
            start_button.style.visibility = 'hidden';
        }
            
        var two_line = /\n\n/g;
        var one_line = /\n/g;
        
        function linebreak(s) {
            return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
        }
                
        var first_char = /\S/;

        function capitalize(s) {
            return s.replace(first_char, function(m) { return m.toUpperCase(); });
        }
                
        function startButton(event) {
            if (recognizing) {
                recognition.stop();
                return;
            }
        
            final_transcript = '';
            recognition.lang = 'ko-KR';
            recognition.start();
            ignore_onend = false;
            search_input.value = '';
            start_img.src = 'resources/img/mic-slash.gif';
            start_timestamp = event.timeStamp;
        }

        $('#check').on("click", function(){
				var start = $('#start').html();
				var end = $('#end').val();
				var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
				$.ajax({
					url : "check",
					type : "post",
					data : {
						start : start
						,end : end
					},
					success : function(data){
						
						w.location.href = "http://map.daum.net/?sName="+ data[0] +"&eName=" + data[1]
						
					},
					error : function(){
					
					}
				});
			});
</script>

	<jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 

</body>
</html>