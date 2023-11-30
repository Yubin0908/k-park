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
    {
        title: '세석대피소',
        latlng: new kakao.maps.LatLng(35.31809464983184, 127.69340777383621),
        address: '경남 산청군 시천면 세석길 217-573'
    },
    {
        title: '장터목대피소',
        latlng: new kakao.maps.LatLng(35.33260982020686, 127.71629086657347),
        address: '경남 함양군 마천면 백무동로 373'
    },
    {
        title: '벽소령대피소',
        latlng: new kakao.maps.LatLng(35.32600170083427, 127.64279435403215),
        address: '경남 함양군 마천면 벽소령소금길 1'
    },
    {
        title: '로타리대피소',
        latlng: new kakao.maps.LatLng(35.32734936635524, 127.73749535657896),
        address: '경남 산청군 시천면 지리산대로 320-282'
    },
    {
        title: '치밭목대피소',
        latlng: new kakao.maps.LatLng(35.348567065961284, 127.75052618441798),
        address: '경남 산청군 삼장면 치밭목길 428'
    },
    {
        title: '연하천대피소',
        latlng: new kakao.maps.LatLng(35.33140398842789, 127.61307207885584),
        address: '전북 남원시 산내면 와운길 324'
    },
    {
        title: '노고단대피소',
        latlng: new kakao.maps.LatLng(35.296215034807034, 127.52631202884433),
        address: '전남 구례군 산동면 노고단로 1068-321'
    },
    {
        title: '소청대피소',
        latlng: new kakao.maps.LatLng(38.12659979209315, 128.4531523870872),
        address: '강원특별자치도 인제군 북면 백담로 1755'
    },
    {
        title: '중청대피소',
        latlng: new kakao.maps.LatLng(38.12098020952729, 128.46028200576217),
        address: '강원특별자치도 인제군 북면 백담로 1818-40'
    },
    {
        title: '희운각대피소',
        latlng: new kakao.maps.LatLng(38.13260832552032, 128.46494169795642),
        address: '강원특별자치도 인제군 북면 백담로 1925'
    },
    {
        title: '양폭대피소',
        latlng: new kakao.maps.LatLng(38.14019173549485, 128.47371354545953),
        address: '강원특별자치도 속초시 설악동 산 41'
    },
    {
        title: '수렴동대피소',
        latlng: new kakao.maps.LatLng(38.14652167820508, 128.41442946412224),
        address: '강원특별자치도 인제군 북면 백담로 1220'
    },
    {
        title: '삿갓재대피소',
        latlng: new kakao.maps.LatLng(35.7912038025545, 127.70490819815511),
        address: '경남 거창군 북상면 월성리 산 282-3'
    },
    {
        title: '제2연화봉대피소',
        latlng: new kakao.maps.LatLng(36.92779677869328, 128.4415942664572),
        address: '충북 단양군 대강면 용부원리 산 13-1'
    },
    {
        title: '소백산탐방원',
        latlng: new kakao.maps.LatLng(36.97201916012891, 128.6082785170244),
        address: '경북 영주시 단산면 영단로 253'
    },
    {
        title: '무등산탐방원',
        latlng: new kakao.maps.LatLng(35.18068513875189, 126.99662136368397),
        address: '광주광역시 북구 덕의길 20'
    },
    {
        title: '내장산탐방원',
        latlng: new kakao.maps.LatLng(35.50744358188143, 126.90474370043627),
        address: '전북 정읍시 내장호반로 266'
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
