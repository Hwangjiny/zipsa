
var scene = new THREE.Scene();
var camera;


var jsonData = $('#tempData', opener.document).val();

var allData = JSON.parse(jsonData);

var modelDataArray = allData.roomDataList;

var roomData = allData.roomData;


initThree(roomData);

addDirectionalLight(roomData);

for(var i = 0; i < modelDataArray.length; i++){
	var singleModel = modelDataArray[i];
	roomMaker(singleModel, roomData);
};

function roomMaker(model, roomData) {
	
	switch(model.model) {
	
	case 'catTower':
		loadGLTFLoader(model, roomData);
		break;
		
	default : 
		OBJ_MTLLoader(model, roomData);
		break;
	}
};


function addDirectionalLight(roomData) {
	let light1 = new THREE.DirectionalLight(0xffffff, 0.5);
	light1.position.set(300, 50, -300);
	let light2 = new THREE.DirectionalLight(0xffffff, 0.5);
	light1.position.set(-300, 50, -300);
	let light3 = new THREE.PointLight(0xffffff, 1);
	light1.position.set(300, 50, 300);
	let light4 = new THREE.PointLight(0xffffff, 1);
	light1.position.set(10, 1.5, 10);
	
	scene.add(light1);
	scene.add(light2);
	scene.add(light3);
	scene.add(light4);
}

function loadGLTFLoader(model, roomData) {
	
	var GLTFLoader = new THREE.GLTFLoader();
	var tempName = model.model + '.gltf';
	
	GLTFLoader.setPath('./resources/model/');
	GLTFLoader.load(tempName, function(gltf) {
		console.log('loding');
		
		var tempModel = gltf.scene;
		var x = Number(model.modelWidth);
		var y = Number(model.modelHeight);
		var z = Number(model.modelLength);
		gltf.scene.scale.set(x,y,z);
		
		var modelLocateX = model.modelLocateX;
		var modelLocateY = model.modelLocateY;
		if(modelLocateX != 0) {
			modelLocateX = modelLocateX.slice(0,-2);
		}
		
		if(modelLocateY != 0){
			modelLocateY = modelLocateY.slice(0,-2);
		}
		
		var roomRealWidth = roomData.roomRealWidth;
		var roomRealHeight = roomData.roomRealHeight;
		roomRealWidth = roomRealWidth.slice(0,-2);
		roomRealHeight = roomRealHeight.slice(0,-2);
		
		var tempRotate = Math.PI / 180;
		
		var rotateVal = tempRotate * (360 - 90 * (Number(model.modelRotate)));
		
		gltf.scene.rotation.y = rotateVal;
		
		var locateY = 0;
		var locateX, locateZ
		
		if(model.modelRotate == 0 ) {
			locateX = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (x/4);
			locateZ = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (z/8);
		} else if(model.modelRotate == 1) {
			locateX = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + ((z * 3) / 8);
			locateZ = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (x/4);
		} else if(model.modelRotate == 2) {
			locateX = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (x/4);
			locateZ = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + ((z * 3) / 8);
		} else if(model.modelRotate == 3) {
			locateX = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (z/8);
			locateZ = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (x/4);
		}
		
		gltf.scene.position.set(locateX, locateY, locateZ);
		
		scene.add(gltf.scene);
		
		/*render();*/
	});
};

function OBJ_MTLLoader(model, roomData) {
	
	var mtlLoader = new THREE.MTLLoader();
	var tempNameMtl = model.model + '.mtl';

	mtlLoader.setPath('./resources/mtl/');
		
	mtlLoader.load(tempNameMtl, function(materials) {
			materials.preload();
			
		loadOBJLoader(materials, model);
	}, function(xhr) {
		console.log('MTLLoader : ', xhr.loaded / xhr.total * 100, '% loaded');
	}, function(error) {
		console.error('MTL ロード中エラー発生', error);
		alert('MTL ロード中エラー発生');
	});
	
	
	function loadOBJLoader(materials, model) {
		var objLoader = new THREE.OBJLoader();
		var tempNameObj = model.model + '.obj';
		
		objLoader.setMaterials(materials);
		
		objLoader.setPath('./resources/model/');
		
		objLoader.load(tempNameObj, function(object) {
			
			var x = Number(model.modelWidth);
			var z = Number(model.modelLength);
			
			object.scale.x = model.modelWidth;
			object.scale.y = model.modelHeight;
			object.scale.z = model.modelLength;
			
			var modelLocateX = model.modelLocateX;
			var modelLocateY = model.modelLocateY;
			if(modelLocateX != 0) {
				modelLocateX = modelLocateX.slice(0,-2);
			}
			
			if(modelLocateY != 0){
				modelLocateY = modelLocateY.slice(0,-2);
			}
			
			var roomRealWidth = roomData.roomRealWidth;
			var roomRealHeight = roomData.roomRealHeight;
			roomRealWidth = roomRealWidth.slice(0,-2);
			roomRealHeight = roomRealHeight.slice(0,-2);
			
			var tempRotate = Math.PI / 180;
			
			var rotateVal = tempRotate * (360 - 90 * (Number(model.modelRotate)));
			
			object.rotation.y = rotateVal;
			
			if(model.model == 'table') {
				if(model.modelRotate == 0 ) {
					object.position.x = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + ((x * 3)/8);
					object.position.z = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (z/4);
				} else if(model.modelRotate == 1) {
					object.position.x = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (z/4);
					object.position.z = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + ((x * 3)/8);
				} else if(model.modelRotate == 2) {
					object.position.x = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (x/8);
					object.position.z = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (z/4);
				} else if(model.modelRotate == 3) {
					object.position.x = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (z/4);
					object.position.z = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (x/8);
				}
			} else {
				if(model.modelRotate % 2 == 0 ) {
					object.position.x = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (x/4);
					object.position.z = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (z/4);
				} else if(model.modelRotate % 2 == 1) {
					object.position.x = (Number(roomData.roomHeight) * Number(modelLocateY)) / Number(roomRealHeight) + (z/4);
					object.position.z = ((Number(roomData.roomWidth) * Number(modelLocateX)) / Number(roomRealWidth)) + (x/4);
				}
			}
			object.position.y = 0;
			
			scene.add(object);
			
		}, function(xhr) {
			console.log('OBJLoader : ', xhr.loaded / xhr.total * 100, "%loaded");
		}, function(error) {
			alert('OBJモデルのロード中エラー発生');
		});
	}
	
};

function initThree(data) {
	
	camera = new THREE.PerspectiveCamera(45, 2, 0.1, 1000);
	
	let renderer = new THREE.WebGLRenderer({
		antialias: true
	});
	renderer.setSize(window.innerWidth, window.innerHeight);
	renderer.setClearColor(0xffffff, 1);
	renderer.shadowMap.enabled = true;
	renderer.shadowMap.type = THREE.PCFSoftShadowMap;
	document.body.appendChild(renderer.domElement);
	
	let axis = new THREE.AxisHelper(10);
	scene.add(axis);
	
	camera.position.x = Number(data.roomWidth) / 2;
	camera.position.y = Number(data.roomDepth) / 2;
	camera.position.z = Number(data.roomHeight) + 5;
	
	camera.lookAt(Number(data.roomWidth)/2, 0, Number(data.roomHeight)/2);
	
	controls = new THREE.OrbitControls(camera);
	controls.rotateSpeed = 1.0;
	controls.zoomSpeed = 1.2;
	controls.panSpeed = 0.8;
	controls.minDistance = 0.1;
	controls.maxDistance = 1000;
	controls.target.set(Number(data.roomWidth)/2, 0, Number(data.roomHeight)/2);
	
	function animate() {
		requestAnimationFrame(animate);
		
		renderer.render(scene, camera);
		controls.update();
	}
	
	animate();
	
	var roomMTLLoader = new THREE.MTLLoader();
	roomMTLLoader.setPath('./resources/mtl/');
	roomMTLLoader.load('room.mtl', function (materials) {
         // 로드 완료되었을때 호출하는 함수
         materials.preload();

         roomLoader(materials);
     }, function (xhr) {
         // 로드되는 동안 호출되는 함수
         console.log('MTLLoader: ', xhr.loaded / xhr.total * 100, '% loaded');
     }, function (error) {
         // 로드가 실패했을때 호출하는 함수
         console.error('MTLLoader ロード中エラー発生', error);
         alert('MTLLoader  ロード中エラー発生.');
     });
	
	
	function roomLoader(materials) {
		var roomOBJloader = new THREE.OBJLoader();

	    // MTLLoader에서 로드한 materials 파일을 설정합니다.
	    roomOBJloader.setMaterials(materials);
	
	    // OBJLoader OBJ 파일을 사용할 전역 경로를 설정합니다.
	    roomOBJloader.setPath('./resources/model/');
	
	    // 로드할 OBJ 파일 명을 입력합니다.
	    roomOBJloader.load('room.obj', function (object) {
	        // 모델 로드가 완료되었을때 호출되는 함수
	    	
	    	object.scale.x = Number(data.roomWidth);
	    	object.scale.y = Number(data.roomDepth);
	    	object.scale.z = Number(data.roomHeight);
	    	
	    	object.position.set(Number(data.roomWidth) / 2, 0, Number(data.roomHeight) / 2);
	    		
	        scene.add(object);
	    }, function (xhr) {
	        // 모델이 로드되는 동안 호출되는 함수
	        console.log('OBJLoader: ', xhr.loaded / xhr.total * 100, '% loaded');
	    }, function (error) {
	        // 모델 로드가 실패했을 때 호출하는 함수
	        alert('モデルのロード中エラー発生.');
	    });
	}
};









































