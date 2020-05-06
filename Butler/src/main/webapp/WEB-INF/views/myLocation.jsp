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
			.custom_typecontrol {position:absolute;top:34%;left:43%;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:15px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
			.custom_typecontrol span {display:block;width:64px;height:30px;float:left;text-align:center;cursor:pointer;font-size:15px;padding:0;}
			.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
			.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
			.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
			.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
			.custom_typecontrol .selected_btn:hover {color:#fff;}   
			.custom_zoomcontrol {position:absolute;top:37%;left:49%;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
			.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;padding-top: 5px;}     
			
			          
		</style>
    
</head>
<body>

	<input type="hidden" value="locateData" id='pageData'>

	<jsp:include page="/WEB-INF/views/include/mainNav.jsp"></jsp:include> 

  <!-- Bootstrap core JavaScript -->
  <br><br>
  
<p style="margin-top:-12px;margin-left: 50px;">
    <b style = "color:white">位置が不正確な場合、直接地図にクリックして補正ボタンを押してください。</b>
    <input type = "button" value = "補正" id = "loCheck" style="border-radius: 5px;text-align: center;font-weight: bold;"> 
</p>

<section class="page-section clearfix" style="margin: 0 auto; margin-bottom: 50px;">

<div class="map_wrap">
    <div id="map" style="width:50%;height:600px;float:left;position:relative;overflow:hidden;margin-left: 100px;">
	    <!-- 지도타입 컨트롤 div 입니다 -->
	    <div class="custom_typecontrol radius_border" style="z-index: 10; position: relative; top: 5px;">
	        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">地図</span>
	        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">ビュー</span>
	    </div>
	    
	    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
	    <div class="custom_zoomcontrol radius_border" style="z-index: 10; position: relative; top: -20px; left: 5px;"> 
	        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="拡大"></span>  
	        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="縮小"></span>
	    </div>
    </div>
    
    
</div>
<div id = "found" style ="width:40%;height:600px;float:left;margin-left: 5px;">
	<table style = "width:100%; height : 100%; color: white;border-color: white;" border="1">
	
		
		<tr>
			<th style = "height : 30px; text-align: center;" width="70px;">病院名</th>
			<td style = "vertical-align: middle; ">
				<p id = "id1" style="margin-top: 19px;"></p>
			</td>
			<td rowspan="3" align="center">
				<input type = "button" value = "ルート" style="height: 30px;text-align: left; color: black; border-radius: 5px; opacity: 0.9;" id = "check">
				<br/><br/>
				<input type = "button" value = "ストリートビュー" style="height: 30px;text-align: left; color: black; border-radius: 5px; opacity: 0.9;" id = "road">
			</td>
		</tr>
		
		<tr>
			<th style = "height : 30px;text-align: center;">電話番号</th>
			<td>
				<p id = "ph1" style="margin-top: 19px; font-weight: bold;"></p>
			</td>
		</tr>	
		
		<tr>
			<th style = "height : 30px;text-align: center;">住所</th>
			<td>
				<p id = "lo1" style="margin-top: 19px;"></p>
			</td>
		</tr>	
		
		<tr>
			<th style = "height : 30px;text-align: center;">病院名</th>
			<td>
				<p id = "id2" style="margin-top: 19px;"></p>
			</td>
			<td rowspan="3" align="center">
				<input type = "button" value = "ルート" style="height: 30px;text-align: left; color: black; border-radius: 5px; opacity: 0.9;" id = "check1">
				<br/><br/>
				<input type = "button" value = "ストリートビュー" style="height: 30px;text-align: left; color: black; border-radius: 5px; opacity: 0.9;" id = "road1">
			</td>
		</tr>
		
		<tr>
			<th style = "height : 30px;text-align: center;">電話番号</th>
			<td>
				<p id = "ph2" style="margin-top: 19px;"></p>
			</td>
		</tr>	
		
		<tr>
			<th style = "height : 30px;text-align: center;">住所</th>
			<td>
				<p id = "lo2" style="margin-top: 19px;"></p>
			</td>
		</tr>		
		
		<tr>
			<th style = "height : 30px;text-align: center;">病院名</th>
			<td>
				<p id = "id3" style="margin-top: 19px;"></p>
			</td>
			<td rowspan="3" align="center">
				<input type = "button" value = "ルート" style="height: 30px;text-align: left; color: black; border-radius: 5px; opacity: 0.9;" id = "check2">
				<br/><br/>
				<input type = "button" value = "ストリートビュー" style="height: 30px;text-align: left; color: black; border-radius: 5px; opacity: 0.9;" id = "road2">
			</td>
		</tr>
		
		<tr>
			<th style = "height : 30px;text-align: center;">電話番号</th>
			<td>
				<p id = "ph3" style="margin-top: 19px;"></p>
			</td>
		</tr>	
		
		<tr>
			<th style = "height : 30px;text-align: center;">住所</th>
			<td style ="vertical-align: middle; padding: 0;">
				<p id = "lo3" style="margin-top: 19px;"></p>
			</td>
		</tr>	
		
		
	</table>

</div>

<div>
	<input type = "button" value = "音声検索" id = "voice" style = "margin-top: 20px; margin-left: 50%;" class="btn btn-primary">
	<p id = "start"></p>
</div>

</section>





<span id = "x" hidden="hidden"></span>
<span id = "y" hidden="hidden"></span>

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



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bcb304f051b2968e7a9473de010e09a0&libraries=services"></script>



<script>

var coords = new kakao.maps.Coords(400207.5, -11710);
coords.toLatLng().toString(); 

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}






// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다	
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
           
        var my = ""; 
            var coord = new kakao.maps.LatLng(lat, lon);
            var callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                   my = result[0].address.address_name;
                }
            };
            var markers = [];
			var count = 0;
			
            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			
            $.ajax({
    			url : "myL",
    			type : "get",
    			data : {
    				xValue:lat
    				,yValue:lon
    			},
    			success : function(data){
     							
					$('#id1').html(data[0]);
					$('#ph1').html(data[1]);
					$('#lo1').html(data[2]);
					
					$('#id2').html(data[3]);
					$('#ph2').html(data[4]);
					$('#lo2').html(data[5]);

					$('#id3').html(data[6]);
					$('#ph3').html(data[7]);
					$('#lo3').html(data[8]);

					
					
					var positions = [
					    {
					        title: data[0], 
					        latlng: new kakao.maps.LatLng(data[9], data[10])
					    },
					    {
					        title: data[3], 
					        latlng: new kakao.maps.LatLng(data[11], data[12])
					    },
					    {
					        title: data[6], 
					        latlng: new kakao.maps.LatLng(data[13], data[14])
					    },
					];

					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					for (var i = 0; i < positions.length; i ++) {
					    
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    var marker1 = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					    markers.push(marker1);
					}

					$('#voice').on("click", function(){
     					var start = my;
     					location.href = "voice?index=" + start;
     					
     				});
					
					     				
     				$('#check').on("click", function(){
     					var start = my;
     					var end = data[2];
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

     				$('#check1').on("click", function(){
     					var start = my;
     					var end = data[5];
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

     				$('#check2').on("click", function(){
     					var start = my;
     					var end = data[8];
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

     				$('#road').on("click", function(){
         				     				     		
     					var x = data[9];
     					var y = data[10];
     					var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
     				
     					w.location.href = "http://localhost:8888/project/roadView?xx="+ x +"&yy=" + y
     							
     					
    				});

     				$('#road1').on("click", function(){
				     		
     					var x = data[11];
     					var y = data[12];
     					var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
     				
     					w.location.href = "http://localhost:8888/project/roadView?xx="+ x +"&yy=" + y
     							
     					
    				});

     				$('#road2').on("click", function(){
				     		
     					var x = data[13];
     					var y = data[14];
     					var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
     				
     					w.location.href = "http://localhost:8888/project/roadView?xx="+ x +"&yy=" + y
     							
     					
    				});

     				
			
     				
     				
    			},
    			error : function(){
    			
    			}
    		});
           

		  var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">ここにいらっしゃいますか?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커를 생성합니다
    	   	var marker = new kakao.maps.Marker({  
    	    map: map, 
    	   	position : locPosition
    	   
    	  });     
        
    	   	var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
        

      //지도를 클릭한 위치에 표출할 마커입니다
        var marker2 = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter() 
        }); 
        // 지도에 마커를 표시합니다
        marker2.setMap(map);

        var x = "";
        var y = "";

        //클릭이벤트
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
           	marker.setMap(null);
            
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker2.setPosition(latlng);
            
            x = latlng.getLat();
            y = latlng.getLng();
        });

        
        

	        
	            $(function(){
	            	$('#loCheck').on("click", function(){
	            		       	
		            	count++;
	            		for(var i = 0 ; i<3*count; i++)
	   		            {
			            		markers[i].setMap(null);
	       		        }

	            		var my1 = ""; 
	                    var coord1 = new kakao.maps.LatLng(x, y);
	                    var callback = function(result, status) {
	                        if (status === kakao.maps.services.Status.OK) {
	                           my1 = result[0].address.address_name;
	                        }
	                    };
	                    geocoder.coord2Address(coord1.getLng(), coord1.getLat(), callback);
	            								     							
	            		$.ajax({
	            			url : "myL",
	            			type : "get",
	            			data : {
	            				xValue:x
	            				,yValue:y
	            			},
	            			success : function(data){
	            					
	            				$('#id1').html(data[0]);
	            				$('#ph1').html(data[1]);
	            				$('#lo1').html(data[2]);
	            				
	            				$('#id2').html(data[3]);
	            				$('#ph2').html(data[4]);
	            				$('#lo2').html(data[5]);

	            				$('#id3').html(data[6]);
	            				$('#ph3').html(data[7]);
	            				$('#lo3').html(data[8]);

	            				var positions = [
	            				    {
	            				        title: data[0], 
	            				        latlng: new kakao.maps.LatLng(data[9], data[10])
	            				    },
	            				    {
	            				        title: data[3], 
	            				        latlng: new kakao.maps.LatLng(data[11], data[12])
	            				    },
	            				    {
	            				        title: data[6], 
	            				        latlng: new kakao.maps.LatLng(data[13], data[14])
	            				    },
	            				];
								
	            				// 마커 이미지의 이미지 주소입니다
	            				var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	            				  
	            				for (var i = 0; i < positions.length; i ++) {
	            				    
	            				    // 마커 이미지의 이미지 크기 입니다
	            				    var imageSize = new kakao.maps.Size(24, 35); 
	            				    
	            				    // 마커 이미지를 생성합니다    
	            				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	            				    
	            				    // 마커를 생성합니다
	            				    var marker1 = new kakao.maps.Marker({
	            				        map: map, // 마커를 표시할 지도
	            				        position: positions[i].latlng, // 마커를 표시할 위치
	            				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            				        image : markerImage // 마커 이미지 
	            				       
	            				    });
	            				    markers.push(marker1);
	            				}
	            				
												
			     				
	             				$('#check').off().on("click", function(){
	             					var start = my1;
	             					var end = data[2];
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

	             				$('#check1').off().on("click", function(){
	             					var start = my1;
	             					var end = data[5];
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

	             				$('#check2').off().on("click", function(){
	             					var start = my1;
	             					var end = data[8];
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
	             				$('#road').off().on("click", function(){
		     				     		
	             					var x = data[9];
	             					var y = data[10];
	             					var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
	             				
	             					w.location.href = "http://localhost:8888/project/roadView?xx="+ x +"&yy=" + y
	             							
	             					
	            				});

	             				$('#road1').off().on("click", function(){
	        				     		
	             					var x = data[11];
	             					var y = data[12];
	             					var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
	             				
	             					w.location.href = "http://localhost:8888/project/roadView?xx="+ x +"&yy=" + y
	             							
	             					
	            				});

	             				$('#road2').off().on("click", function(){
	        				     		
	             					var x = data[13];
	             					var y = data[14];
	             					var w = window.open("about:blank","_blank","width=1000, height=700, top=0,left=0,scrollbars=no");
	             				
	             					w.location.href = "http://localhost:8888/project/roadView?xx="+ x +"&yy=" + y
	             							
	             					
	            				});
	        	            			
	            				     		            				     				
	             				
	            		
	             				
	            			},
	            			error : function(){
	            			
	            			}
	            		});
	            		
	            	});
	            });
	            
	            
	        
      
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocationが利用できません、、'
    
        
  
   
   
}

</script>

<jsp:include page="/WEB-INF/views/include/modal.jsp"></jsp:include> 

</body>
</html>