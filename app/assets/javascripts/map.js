var latitude = 38.8308;
var longitude = -77.3075;

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(latitude, longitude),
    zoom: 15,
    scrollwheel: false,
    disableDefaultUI: true
    };

  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);

  circle = new google.maps.Circle({
      map: map,
      center: new google.maps.LatLng(latitude, longitude)
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
