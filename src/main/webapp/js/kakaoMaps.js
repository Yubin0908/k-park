var container = document.getElementById('map');
var options = {
    center: new kakao.maps.LatLng(36.65687419753685, 127.94467456277664),
    level: 12
};

var map = new kakao.maps.Map(container, options);

function setMapType(maptype) {
    var roadmapControl = document.getElementById('btnRoadMap');
    var skyviewControl = document.getElementById('btnSkyview');

    if(maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

var positions = [
    {
        title: '설악동야영장',
        latlng: new kakao.maps.LatLng(38.16243293668856, 128.54367981420302),
        address: '강원도 속초시 청봉로 25'
    },
    {
        title: '백무동야영장',
        latlng: new kakao.maps.LatLng(35.35840458157729, 127.67933653547344),
        address: '경남 함양군 마천면 강청리 148'
    },
    {
        title: '내원야영장',
        latlng: new kakao.maps.LatLng(35.29671372403614, 127.81240678915606),
        address: '경남 산청군 삼장면 대포리 산106-2'
    },
    {
        title: '소막골야영장',
        latlng: new kakao.maps.LatLng(35.35106203035531, 127.81580822405815),
        address: '경남 산청군 삼장면 평촌리 산118-1'
    },
    {
        title: '뱀사골 제1야영장',
        latlng: new kakao.maps.LatLng(35.37044251881596, 127.57966756983907),
        address: '전북 남원시 산내면 와운길 29'
    },
    {
        title: '뱀사골 제2야영장',
        latlng: new kakao.maps.LatLng(35.37166025368514, 127.578526346253),
        address: '전북 남원시 산내면 와운길 10'
    },
    {
        title: '달궁 제2야영장',
        latlng: new kakao.maps.LatLng(35.355078191569866, 127.55794731079133),
        address: '전북 남원시 산내면 덕동리 281'
    },
    {
        title: '달궁 제1야영장',
        latlng: new kakao.maps.LatLng(35.35192754105444, 127.55562083530516),
        address: '전북 남원 산내면 덕동리 287-3'
    },
    {
        title: '덕동야영장',
        latlng: new kakao.maps.LatLng(35.36504830894727, 127.56777027466946),
        address: '전북 남원시 산내면 덕동리 74'
    },
    {
        title: '학천야영장',
        latlng: new kakao.maps.LatLng(35.37005595786459, 127.57236646409562),
        address: '전북 남원시 산내면 지리산로 712'
    },
    {
        title: '사기막야영장',
        latlng: new kakao.maps.LatLng(37.67549652796448, 126.96750949450782),
        address: '경기도 고양시 덕양구 북한산로618번길 130'
    },
    {
        title: '소도야영장',
        latlng: new kakao.maps.LatLng(37.11750834625864, 128.95162599200506),
        address: '강원도 태백시 소도동 천제단길 181'
    },
];

var imageSrc = '../img/marker.png',
	  imageSize = new kakao.maps.Size(50, 55),
	  imageOption = {offset: new kakao.maps.Point(27, 69)};
	  
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

for (var i = 0; i < positions.length; i++) {
  var marker = new kakao.maps.Marker({
    image: markerImage,
    map: map,
    position: positions[i].latlng,
    title: positions[i].title,
    address: positions[i].address
  });

  (function (marker, title, content) {
    kakao.maps.event.addListener(marker, 'click', function () {
      var customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: marker.getPosition(),
        content: content,
        yAnchor: 1
      });

      customOverlay.setMap(map);
      
      var overlayClose = document.querySelector('.overlay_info a');
      overlayClose.addEventListener('click', function(e) {
        e.preventDefault();
        customOverlay.setMap(null); // 오버레이 닫기
      });
    });
  })(marker, positions[i].title, '<div class="overlay_info"><a href="#"><strong>' + positions[i].title + '</strong></a><div class="desc"><span class="address">' + positions[i].address + '</span></div></div>');
}
