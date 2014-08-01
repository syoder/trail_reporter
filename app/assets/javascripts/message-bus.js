define(["msgs"], function (msgs) {
  "use strict";
  var bus = msgs.bus();

  bus.channel("current-coordinates");

  return bus;
});
