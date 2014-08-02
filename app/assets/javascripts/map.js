(function () {
  "use strict";

  var map;
  var marker;

  CurrentLocation.startTracking();

  //Places marker & moves if already placed
  function placeMarker(myLatlng) {
    if ( marker ) {
      marker.setPosition(myLatlng);
    } else {
      marker = new google.maps.Marker({
        position: myLatlng,
        map: map
      });
    }
  }

  function updateCoordinates(coordinates) {
    var latLng = new google.maps.LatLng(coordinates[0], coordinates[1]);
    placeMarker(latLng);
    document.getElementById('report_latitude').value = coordinates[0];
    document.getElementById('report_longitude').value = coordinates[1];
  }

  function initialize() {
    var selectedManually = false;
    var myLatlng = new google.maps.LatLng(38.8308,-77.3075);
    var mapOptions = {
      center: myLatlng,
      zoom: 15
    };

    map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);

    // We should keep the selected coordinates in sync with the user's location.
    $(document).on("updated-coordinates", function (event, coordinates) {
      // If they've selected a different location manually, then we should go with that.
      if (selectedManually) { return };
      updateCoordinates(coordinates);
    });

    google.maps.event.addListener(map,'click', function(event) {
      selectedManually = true;
      updateCoordinates([event.latLng.lat(), event.latLng.lng()]);
    })
  }

  google.maps.event.addDomListener(window, 'load', initialize);
}());
