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
      var image = {
        url: '/locate.png',
        size: new google.maps.Size(512,512),
        origin: new google.maps.Point(0,0),
        anchor: new google.maps.Point(13,13),
        scaledSize: new google.maps.Size(26,26)
      };
      marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        icon: image
      });
    }
  }

  function updateCoordinates(coordinates, panToNewLocation) {
    var latLng = new google.maps.LatLng(coordinates[0], coordinates[1]);

    placeMarker(latLng);
    if (panToNewLocation) { map.panTo(latLng) };

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
      updateCoordinates(coordinates, true);
    });

    google.maps.event.addListener(map,'click', function(event) {
      selectedManually = true;
      updateCoordinates([event.latLng.lat(), event.latLng.lng()]);
    })
  }

  google.maps.event.addDomListener(window, 'load', initialize);
}());
