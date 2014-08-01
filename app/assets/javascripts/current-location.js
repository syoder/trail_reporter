(function () {
  "use strict";
  var watchID;

  var success = function (pos) {
    window.LastPosition = pos;
    console.log("your current coordinates:", pos.coords.latitude, pos.coords.longitude)
  }
  var failure = function (err) {
    console.log("error getting current location:", err)
  }
  if (!!navigator.geolocation) {
    if (!watchID) {
      watchID = navigator.geolocation.watchPosition(success, failure, {
        enableHighAccuracy: true,
        maximumAge: 0
      });
    }
  }
}());
