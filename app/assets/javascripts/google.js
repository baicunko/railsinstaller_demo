var map;
var marker;



function createMarker(event){
  //alert("Latitude: "+event.latLng.lat()+" "+", longitude: "+event.latLng.lng());

  if(marker){marker.setPosition(event.latLng);}
  else{
    marker = new google.maps.Marker({
      position: event.latLng,
      map: map
    });
  }
}



function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  google.maps.event.addListener(map, 'click', function(event){createMarker(event);});
}

google.maps.event.addDomListener(window, 'load', initialize);


