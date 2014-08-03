(function () {
  "use strict";

  var homeMap;
  var homeMarker;
  var selfMarker;
  var infoWindow;

  CurrentLocation.startTracking();

  function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(38.8308,-77.3075),
      zoom: 15
    };

    homeMap = new google.maps.Map(document.getElementById("map-home-canvas"),
        mapOptions);

    $(document).on("updated-coordinates", function (event, coords) {
      showSelf(coords);
    });
    if (CurrentLocation.lastCoordinates) {
      showSelf(CurrentLocation.lastCoordinates);
    }

    infoWindow = new google.maps.InfoWindow();

    $.getJSON('/reports').then(function(reports){
      $.each(reports, function(index, report){
        showMarker(report);
      });
    });
  }
  google.maps.event.addDomListener(window, 'load', initialize);

  function showMarker(report){
    var homeMarker = new google.maps.Marker({
        position: new google.maps.LatLng(report.latitude, report.longitude),
        data: report,
        map: homeMap
      });

      google.maps.event.addListener(homeMarker, 'click', function() {
        homeMap.setCenter(new google.maps.LatLng(homeMarker.position.lat(), homeMarker.position.lng()));

        var contentString = homeMarker.data.description + "<br /><br />Tags: "+ homeMarker.data.tags_text;
        // Replace our Info Window's content and position
        infoWindow.setContent(contentString);
        infoWindow.setPosition(homeMarker.position);
        infoWindow.open(homeMap)
      });
  }

  function showSelf(coordinates) {
    var latLng = new google.maps.LatLng(coordinates[0], coordinates[1]);
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
}());
