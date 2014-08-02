window.CurrentLocation = (function () {
  "use strict";
  var watchID;
  var exports = {};

  var success = function (pos) {
    var newCoordinates = [pos.coords.latitude, pos.coords.longitude];
    console.log("your current coordinates:", newCoordinates);
    $(document).trigger("updated-coordinates", [newCoordinates]);
    exports.lastLocation = newCoordinates;
  }
  var failure = function (err) {
    console.log("error getting current location:", err)
  }

  exports.startTracking = function () {
    if (!!navigator.geolocation) {
      if (!watchID) {
        watchID = navigator.geolocation.watchPosition(success, failure, {
          enableHighAccuracy: true,
          maximumAge: 0
        });
      }
    }
  };

  exports.stopTracking = function () {
    navigator.geolocation.clearWatch(watchID);
    watchID = null;
  };

  return exports;
}());
