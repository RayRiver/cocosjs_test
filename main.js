// Generated by CoffeeScript 1.10.0
(function() {
  window.onload = function() {
    cc.game.onStart = function() {
      return cc.LoaderScene.preload(Resources, function() {
        return cc.director.runScene(new utils.CocosScene());
      }, this);
    };
    return cc.game.run("gameCanvas");
  };

}).call(this);

//# sourceMappingURL=main.js.map
