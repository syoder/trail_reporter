define(["msgs", "msgs/channels/pubsub"], function (msgs) {
  "use strict";
  var bus = msgs.bus();

  bus.pubsubChannel("current-coordinates");

  return bus;
});
