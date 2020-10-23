/*
mapを関数の外で定義(codeAddressでも使うため)
geocoderを用意
*/

let map
let geocoder
let marker = false
function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.667875, lng: 138.226475},
  zoom: 8
  });
}

function codeAddress(){
  // 入力を取得
  let inputAddress = document.getElementById('address').value;

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
　　　　　　　　　　　　// map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);
                    // 検索を再度実行時にマーカーが既にあれば先に立てたマーカーは削除
      if (marker != false){marker.setMap(null)}
　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
       marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });

      var latForm = document.getElementById('form_latitude')
      latForm.value = results[0].geometry.location.lat()
      var lngForm = document.getElementById('form_longitude')
      lngForm.value = results[0].geometry.location.lng()
    } else {
      alert('次の理由でジオコードが成功しませんでした: ' + status);
    }
  });
}