define(["jquery", "js!//maps.googleapis.com/maps/api/js?v=3.exp&callback=GoogleMapsLoaded&key="+GOOGLE_MAPS_API_KEY+"!order!exports=google"], function ($) {
  var homeMap;
  var homeMarker;

  function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(38.8308,-77.3075),
      zoom: 15,
      scrollwheel: false,
      disableDefaultUI: true
      };

    homeMap = new google.maps.Map(document.getElementById("map-home-canvas"),
        mapOptions);
  }

  // google.maps.event.addDomListener(window, 'load', initialize);
  $(document).on("google-maps:loaded", initialize);

  function showMarker(report){
    homeMarker = new google.maps.Marker({
        position: new google.maps.LatLng(report.latitude, report.longitude),
        map: homeMap
      });
  }

  $.getJSON('/reports').then(function(reports){
    $.each(reports, function(index, report){
      showMarker(report);
    });
  });
});
