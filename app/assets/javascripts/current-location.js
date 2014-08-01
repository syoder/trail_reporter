define(["message-bus"], function (bus) {
  "use strict";
  var watchID;
  var exports = {};

  bus.channel("browser-geolocation");
  bus.transformer(function (message) {
    return [message.coords.latitude, message.coords.longitude];
  }, {
    input: "browser-geolocation",
    output: "current-coordinates",
  });

  var success = function (pos) {
    window.LastPosition = pos;
    console.log("your current coordinates:", pos.coords.latitude, pos.coords.longitude)
    bus.send("browser-geolocation", pos);
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
  }

  return exports;
})
