
var map;
var marker;
var lat = document.getElementById("lat").value;
var lng = document.getElementById("lng").value;
var myLocation = new google.maps.LatLng(lat, lng);

function ajaxGetSignal(lat, lng){
  $.ajax({             
    url: "/ajax_getSignal", 
    contentType: 'json',
    dataType: 'json',
    data : {
      lat: lat,
      lng: lng
    },               
    success: function(response) 
    {
      if(response[0] == null){alert("No Data Found!");}
      alert(lat + ", "+ lng +"\r"+response[0].Latitud +","+ response[0].Longitud);      
    },
    error: function(){alert('An error has ocurred, please try again later.');}
  });

}

function createMarker(event){
  //alert("Latitude: "+event.latLng.lat()+" "+", longitude: "+event.latLng.lng());

  if(marker){marker.setPosition(event.latLng);}
  else{
    marker = new google.maps.Marker({
      position: event.latLng,
      map: map
    });
  }
  ajaxGetSignal(event.latLng.lat(),event.latLng.lng());
}



function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(-33.383844, -70.533967),
    zoom: 8,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  google.maps.event.addListener(map, 'click', function(event){createMarker(event);});
}

google.maps.event.addDomListener(window, 'load', initialize);


