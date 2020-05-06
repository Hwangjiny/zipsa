var maxWidth = 1280;
var maxHeight = 720;


var ratioWidth, ratioHeight;

var modelnum = 1;

var arrayList = new Array();

function makeroom() {
	
	
	
	$("#accordion").empty();
	modelnum = 1;
	arrayList = [];
	
	
	var roomWidth = $('#roomWidth').val() * 40;
	var roomHeight = $('#roomHeight').val() * 40;
	var roomDepth = $('#roomDepth').val();
	
	if(roomWidth == 0 || roomHeight == 0) {
		
	}
	
	roomDepth = Number(roomDepth);
	
	ratioWidth = maxWidth / roomWidth;
	ratioHeight = maxHeight / roomHeight;
	
	
	$("#test").empty();

	$("#test").append($("<div class='drop-target'></div>"));
		
	if(ratioWidth < ratioHeight) {
		roomWidth = roomWidth * ratioWidth;
		roomHeight = roomHeight * ratioWidth;
		var ratioPic = 20 * ratioWidth;
		$(".drop-target").css('background-size', ratioPic + 'px' );
	} else {
		roomWidth = roomWidth * ratioHeight;
		roomHeight = roomHeight * ratioHeight;
		var ratioPic = 20 * ratioHeight;
		$(".drop-target").css('background-size', ratioPic + 'px' );
	}
	
	$('.drop-target').css("width", roomWidth);
	$('.drop-target').css("height", roomHeight);
		
	$(".drop-target").droppable({
		accept: ".drag-item"
	});
	
	$('#makingModelButton').removeAttr('disabled');
	
	arrayList.push(modelnum);
	arrayList.sort();
	
	$("#accordion").append($(
			"<div class='panel panel-default jumbotron' id='modelPanel" + modelnum + "'>" +
				"<div class='panel-heading'>" +
					"<h4 class='panel-title'>" +
						"<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + modelnum + "'>" +
							"Model Num" + modelnum +
						"</a>" +
					"</h4>" + 
				"</div>" + 
				"<div id='collapse" + modelnum + "' class='panel-collapse collapse in'>" +
					"<div class='panel-body'>" + 
						"<div class='container'>" + 
							"<div class='setting' id='model" + modelnum + "'> " +
								"横 : <input type='number' class='valueset inputData' value='1' name='modelWidth' min='0.05' max='10' step='0.05'> m <br>" +
								"縦 : <input type='number' class='valueset inputData' value='1' name='modelLength' min='0.05' max='10' step='0.05'> m <br>" +
								"高 : <input type='number' class='valueset inputData' value='1' name='modelHeight' min='0.05' max='3' step='0.05'> m <br>" +
								"<select name='model" + modelnum + "' class='valueset'>" +
									"<option value='table'>Table</option>" +
									"<option value='bed'>Bed</option>" + 
									"<option value='fridge'>Fridge</option>" +
									"<option value='drawer'>Drawer</option>" +
									"<option value='closet'>Closet</option>" +
									"<option value='catTower'>Cat Tower</option>" +
									"<option value='catTolet'>Cat Tolet</option>" +
									"<option value='catPlate'>Cat Feed</option>" +
								"</select>" +
								"<button class='btn btn-primary btn-sm' onclick='rotate(event)'>回転</button>" + 
								"<button class='btn btn-primary btn-sm' onclick='deleteModel(event)'>削除</button>" +
								"<input type='hidden' class='valueset' value='0' name='rotateVal" + modelnum + "'>" +
								"<input type='hidden' class='valueset' value='0' name='locateX'>" +
								"<input type='hidden' class='valueset' value='0' name='locateY'>" +
								"<br>" + 
							"</div>" + 
						"</div>" + 
					"</div>" + 
				"</div>" +
			"</div>"
	));
	
	$('.jumbotron').css('padding', '3');
	$('.jumbotron').css('background-color', '#76542C');
	$('.setting').css('color', 'white');
	$('.btn-sm').css('font-size', '.07rem');
	$('.inputData').css('width', '80px')
	
	$('.valueset').on('change', function() {
		var changeParent = $(this).closest('div').attr('id'); // 포함하고 있는 모델ID
		var changeTemp = $(this).attr('name'); //값이 변경된 데이터의 name값
		resizemodel(changeParent, changeTemp);
	});+
	makemodel();
}

function makemodelSet() {
	
	if(arrayList.length > 9) {
		alert('モデルはこれ以上追加できません。');
		return;
	}
	
	arrayList.push(modelnum);
	arrayList.sort();
	
	console.log(arrayList);
	
	$("#accordion").append($(
			"<div class='panel panel-default jumbotron' id='modelPanel" + modelnum + "'>" +
				"<div class='panel-heading' role='tab'>" +
					"<h4 class='panel-title'>" +
						"<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + modelnum + "'>" +
							"Model Num" + modelnum +
						"</a>" +
					"</h4>" + 
				"</div>" + 
				"<div id='collapse" + modelnum + "' class='panel-collapse collapse'>" +
					"<div class='panel-body'>" + 
						"<div class='container'>" + 
							"<div class='setting' id='model" + modelnum + "'> " +
								"横 : <input type='number' class='valueset inputData' value='1' name='modelWidth' min='0.05' max='9' step='0.05'> m <br>" +
								"縦 : <input type='number' class='valueset inputData' value='1' name='modelLength' min='0.05' max='9' step='0.05'> m <br>" +
								"高 : <input type='number' class='valueset inputData' value='1' name='modelHeight' min='0.05' max='3' step='0.05'> m <br>" +
								"<select name='model" + modelnum + "' class='valueset'>" +
									"<option value='table'>Table</option>" +
									"<option value='bed'>Bed</option>" + 
									"<option value='fridge'>Fridge</option>" +
									"<option value='drawer'>Drawer</option>" +
									"<option value='closet'>Closet</option>" +
									"<option value='catTower'>Cat Tower</option>" +
									"<option value='catTolet'>Cat Tolet</option>" +
									"<option value='catPlate'>Cat Feed</option>" +
								"</select>" +
								"<button class='btn btn-primary btn-sm' onclick='rotate(event)'>回転</button>" + 
								"<button class='btn btn-primary btn-sm' onclick='deleteModel(event)'>削除</button>" +
								"<input type='hidden' class='valueset' value='0' name='rotateVal" + modelnum + "'>" +
								"<input type='hidden' class='valueset' value='0' name='locateX'>" +
								"<input type='hidden' class='valueset' value='0' name='locateY'>" +
								"<br>" + 
							"</div>" + 
						"</div>" + 
					"</div>" + 
				"</div>" +
			"</div>"
	));
	
	$('.jumbotron').css('padding', '3');
	$('.jumbotron').css('background-color', '#76542C');
	$('.setting').css('color', 'white');
	$('.btn-sm').css('font-size', '.07rem');
	$('.inputData').css('width', '80px')
	
	$('.valueset').on('change', function() {
		var changeParent = $(this).closest('div').attr('id'); // 포함하고 있는 모델ID
		var changeTemp = $(this).attr('name'); //값이 변경된 데이터의 name값
		resizemodel(changeParent, changeTemp);
	});
	
	makemodel();
	sortModel();
	
};

function deleteModel(event) {
	var modelID = event.target.closest('div').id;	
	
	modelID = modelID.replace('model','');
	
	delete arrayList[Number(modelID) - 1];
	arrayList.sort();
	arrayList.pop();
	
	var modelID2 = "2Dmodel" + modelID;
	modelID = "modelPanel" + modelID;
	
	$('#' + modelID).remove();
	$('#' + modelID2).remove();
	
	sortModel();
}

function sortModel() {
	var i = 1;
	$('.panel-title').each(function() {
		$(this).children('a').text('Model Num' + i);
		i++;
	})
}


function takeLocate(modelVer, modelData) {
	
	var X = $('#' + modelVer).css('top');
	var Y = $('#' + modelVer).css('left');
		
	$('#' + modelData).find("input[name=locateX]").val(X);
	$('#' + modelData).find("input[name=locateY]").val(Y);
};

function rotate(event) {
	var modelID = event.target.closest('div').id;
	
	var temp = $('#' + modelID).find('input[name*="rotateVal"]').val();
	
	temp = Number(temp) + 1;
	
	if (temp >= 4) {temp = temp % 4};
	
	$('#' + modelID).find('input[name*="rotateVal"]').val(temp);
	
	resizemodel(modelID, 'rotateVal');
};

function makemodel() {
	$(function() {
		if(arrayList.length > 10) {
			alert('モデルはこれ以上追加できません。');
			return;
		}
		
		$(".drop-target").append($("<div class='drag-item ui-widget-content test" +  modelnum + "' id='2Dmodel" + modelnum + "'></div>"))
		var ratioMove, ratioSizeX, ratioSizeY;
		
		if(ratioWidth < ratioHeight) {
			ratioMove = ratioWidth * 2;
			ratioSizeX = ratioWidth * 20;
			ratioSizeY = ratioWidth * 20;
		} else {
			ratioMove = ratioHeight * 2;
			ratioSizeX = ratioHeight * 20;
			ratioSizeY = ratioHeight * 20;
		}
		
		$('.test' + modelnum).css("width", ratioSizeX * 2);
		$('.test' + modelnum).css("height", ratioSizeY * 2);
		$('.test' + modelnum).draggable({
			grid : [ratioMove, ratioMove],
			containment: ".drop-target",
			stop: function() {
				var modelID = this.id;
				var modelVal = modelID.replace('2Dmodel', 'model')
				takeLocate(modelID, modelVal);
			}
		});
		
		modelnum++;
	});
};

function resizemodel(changeParent, changeTemp) {
	
	var rotateVal = $('#' + changeParent).find("input[name*='rotateVal']").val()
	var tempWidth, tempHeight;
	var model = changeParent.replace('model', 'test');
	
	if(changeTemp.indexOf('rotateVal') !== -1) {
		
		tempWidth = $('.' + model).css('width');
			
		tempHeight = $('.' + model).css('height');
			
		$('.' + model).css('width', tempHeight);
			
		$('.' + model).css('height', tempWidth);
			
		checkPicRotate(changeParent);
	};
	
	if(changeTemp == 'modelWidth') {
		var Width = $('#' + changeParent).find("input[name=modelWidth]").val()
		
		tempRotate();
		
		if(ratioWidth < ratioHeight) {
			Width = ratioWidth * Width * 40;
		} else {
			Width = ratioHeight * Width * 40;
		}
		
		$('.' + model).css('width', Width + 'px');
		
		tempRotate();
	}
	
	else if(changeTemp == 'modelLength') {
		var Length = $('#' + changeParent).find("input[name=modelLength]").val()
		
		tempRotate();
		
		if(ratioWidth < ratioHeight) {
			Length = ratioWidth * Length * 40;
		} else {
			Length = ratioHeight * Length * 40;
		}
		
		$('.' + model).css('height', Length + 'px');
		
		tempRotate();
	}
	
	else if(changeTemp.indexOf('model') !== -1 || changeTemp.indexOf('rotateVal') !== -1) {
		var modelPic = $('#' + changeParent).find("select[name*=model]").val()
		switch(modelPic) {
		
		case "table" :
			$('.' + model).css('background', "url('resources/img/table" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		case "bed" :
			$('.' + model).css('background', "url('resources/img/bed" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		case "fridge" :
			$('.' + model).css('background', "url('resources/img/fridge" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break; 
		case "drawer" :
			$('.' + model).css('background', "url('resources/img/drawer" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		case "closet" :
			$('.' + model).css('background', "url('resources/img/closet" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		case "catTower" :
			$('.' + model).css('background', "url('resources/img/catTower" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		case "catTolet" :
			$('.' + model).css('background', "url('resources/img/catTolet" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		case "catPlate" :
			$('.' + model).css('background', "url('resources/img/catPlate" + Number(rotateVal) % 2 + ".png')");
			$('.' + model).css('background-size', '100% 100%');
			break;
		}
		checkPicRotate(changeParent);
	}
	
	function tempRotate() {
		
		if (rotateVal % 2 != 0) {
			tempWidth = $('.' + model).css('width');
			
			tempHeight = $('.' + model).css('height');
			
			$('.' + model).css('width', tempHeight);
			
			$('.' + model).css('height', tempWidth);
		}
	}
	
	function checkPicRotate(modelID) {
		var rotateValPic = $('#' + modelID).find('input[name*=rotateVal]').val();
		var picID = modelID.replace('model', 'test');
		var rotateValPic2 = Math.floor(Number(rotateValPic) / 2) * 180
		
		$('.' + picID).css('transform', 'rotate(' + rotateValPic2 + 'deg)');
	}
};

var s = 0;

function handle(delta) {
    
    if (s + (delta / 2) > 10 || s + (delta / 2) < -10) {
    	s += 0;
    } else {
    	 s += delta / 2;
    }
    $(function() {
    	$('#testwheel').text(s);
    });
    
};

function wheel(event){
    var delta = 0;
    if (!event) event = window.event;
    if (event.wheelDelta) {
        delta = event.wheelDelta/120;
        if (window.opera) delta = -delta;
    } else if (event.detail) delta = -event.detail/3;
    if (delta) handle(delta);
};

$(function() {
	$('#make3DRoom').click(function() {
		var roomDataList = [];
		var tempData = new Object();
		
		$('div[id*=model][id^=model]').each(function() {
			var temptest = this.id;
			var modelData = {
					"modelWidth" 	: $(this).find('input[name=modelWidth]').val() * 2,
					"modelLength" 	: $(this).find('input[name=modelLength]').val() * 2,
					"modelHeight" 	: $(this).find('input[name=modelHeight]').val() * 2,
					"model" 		: $(this).find('select[name*=model]').val(),
					"modelRotate" 	: $(this).find('input[name*=rotateVal]').val(),
					"modelLocateX" 	: $(this).find('input[name=locateX]').val(),
					"modelLocateY" 	: $(this).find('input[name=locateY]').val(),
			}
			
			roomDataList.push(modelData);
		});
		var roomData;
		
		roomData = {
				"roomWidth"		: $('#roomWidth').val(),
				"roomHeight"	: $('#roomHeight').val(),
				"roomDepth"		: '3',
				"roomRealWidth"	: $('.drop-target').css('width'),
				"roomRealHeight": $('.drop-target').css('height')
		}
		
		tempData.roomDataList = roomDataList;
		
		tempData.roomData = roomData;
		console.log(roomData);
		
		var jsonData = JSON.stringify(tempData);
		console.log(jsonData);
		
	/*	$.ajax({
			url			: "testMakeRoom",
			type 		: "post",
			dataType	: "text",
			data		: {"jsonData" : jsonData},
			success		: function(init) {
				alert(init);
			},
			error		: function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});*/
		
		var Room3DMaker = window.open(
				"make3DRoom",
				'3DRoom',
				'width=800, height=800, resizeable=yes, scrollbars=yes'
		)
		
		$('#tempData').val(jsonData);
		
		
		/*Room3DMaker.document.getElementById('roomData').value = jsonData;*/
	});
});











