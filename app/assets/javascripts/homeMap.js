define(["jquery", "message-bus", "current-location", "js!//maps.googleapis.com/maps/api/js?v=3.exp&callback=GoogleMapsLoaded&key="+GOOGLE_MAPS_API_KEY+"!order!exports=google"], function ($, bus, currentLocation) {
  var homeMap;
  var homeMarker;
  var selfMarker;

  currentLocation.startTracking();

  function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(38.8308,-77.3075),
      zoom: 15
    };

    homeMap = new google.maps.Map(document.getElementById("map-home-canvas"),
        mapOptions);

    bus.on("current-coordinates", function (coords) {
      console.log("got coordinates from the bus!")
      showSelf(coords);
    });
    if (currentLocation.lastCoordinates) {
      showSelf(currentLocation.lastCoordinates);
    }

    $.getJSON('/reports').then(function(reports){
      $.each(reports, function(index, report){
        showMarker(report);
      });
    });
  }

  $(document).on("google-maps:loaded", initialize);

  function showMarker(report){
    homeMarker = new google.maps.Marker({
        position: new google.maps.LatLng(report.latitude, report.longitude),
        map: homeMap
      });
  }

  function showSelf(coordinates) {
    latLng = new google.maps.LatLng(coordinates[0], coordinates[1]);
    if (!selfMarker) {
      selfMarker = new google.maps.Marker({
        position: latLng,
        map: homeMap,
        title: "Current Location",
        icon: '/kangaroo.png'
      });
    } else {
      selfMarker.setPosition(latLng);
    }

    homeMap.panTo(latLng);
  }
});
