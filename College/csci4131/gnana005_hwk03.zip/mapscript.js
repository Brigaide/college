var map;
var geocoder;
var service;
var directionsService;
var directionsRenderer;
var mpls = {lat: 44.9727,lng: -93.23540000000003};
var markers = [];
var address;
var names;

function clearMarkers(markers){
  while (markers.length != 0){
    markers.pop().setMap(null);
  }
}

function initMap() {

  var input = document.getElementById('end');
  var autocomplete = new google.maps.places.Autocomplete(input);


  address = document.getElementsByClassName("address");
  names = document.getElementsByClassName("personName");

  map = new google.maps.Map(document.getElementById('map'), {
    center: mpls,
    zoom: 14
  });
  geocoder = new google.maps.Geocoder();
  //codeAddress();
  service = new google.maps.places.PlacesService(map);
  directionsService = new google.maps.DirectionsService();
  directionsRenderer = new google.maps.DirectionsRenderer();

  //map.controls[google.maps.ControlPosition.RIGHT_TOP].push(document.getElementById('legend'));
  directionsRenderer.setMap(map);
  contactinfo();

}

function addrMarker(infowindow, address){
  geocoder.geocode( { 'address': address}, function(results, status) {
  if (status == 'OK') {
    var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
        icon: './img/Goldy.png'
    });
    marker.addListener('click', function() { infowindow.open(map,marker); });
    markers.push(marker);
  }
  else {
    alert('Geocode was not successful for the following reason: ' + status);
  }
});
}

function contactinfo(){
  for (i = 0; i < address.length; i++){
    var contentString = '<div id="content">' +
      '<div id="bodyContent">' + names[i].innerHTML +
      '</div>' + address[i].innerHTML +
      '</div>';
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    addrMarker(infowindow, address[i].innerHTML);
  }
}

function findAddr() {
  clearMarkers(markers);
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
    var pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    var position = new google.maps.LatLng(pos.lat, pos.lng);
    var radius = document.getElementById("radius").value;
    var option = document.getElementById("myList").value;
    if (option == "other"){
      option = document.getElementById("locationAddr").value;
    }
    var request = {
      location: position,
      radius: radius,
      query: option
    };
  service.textSearch(request, callback);
  });
  }
}

function callback(results, status) {
  if (status == google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarkers(results[i]);
    }
  }
}

function createMarkers(results) {
  var marker = new google.maps.Marker({
    map: map,
    position: results.geometry.location
  });
  var infowindow = new google.maps.InfoWindow({
    content: "<b>" + results.name + "</b><br>" + results.formatted_address
  });
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
  markers.push(marker);
}

function calcRoute() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
    var pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    var start = pos;
    var end = document.getElementById('end').value;
    var inputs = document.getElementsByClassName("transportMode");
    for (i = 0; i < inputs.length; i++) {
      if (inputs[i].checked) {
          var mode = inputs[i].value;
      }
    }
    var request = {
      origin: start,
      destination: end,
      travelMode: mode
    };
    var panel = document.getElementById('directions-panel');
    var mapScreen = document.getElementById('map');
    directionsRenderer.setMap(mapScreen);
    directionsService.route(request, function(result, status) {
      if (status == 'OK') {
        directionsRenderer.setDirections(result);
        mapScreen.style.width = "55%";
        panel.style.width = "40%";
        directionsRenderer.setPanel(panel);
        directionsRenderer.setDirections(result);
      }
    });
  });
  }
}
