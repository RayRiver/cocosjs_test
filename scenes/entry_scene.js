// Generated by CoffeeScript 1.10.0
(function() {
  var EntryScene,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  EntryScene = (function(superClass) {
    extend(EntryScene, superClass);

    function EntryScene() {
      var edge, edge_border, edge_dynamic, player, size, speed, world;
      EntryScene.__super__.constructor.apply(this, arguments);
      size = cc.director.getWinSize();
      world = new utils.BumpWorld();
      this._world = world;
      edge_border = 30;
      edge_dynamic = true;
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: edge_border,
        height: size.height
      });
      edge.setPosition(edge_border / 2, size.height / 2);
      this.addChild(edge);
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: edge_border,
        height: size.height
      });
      edge.setPosition(size.width - edge_border / 2, size.height / 2);
      this.addChild(edge);
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: size.width - 2 * edge_border,
        height: edge_border
      });
      edge.setPosition(size.width / 2, edge_border / 2);
      this.addChild(edge);
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: size.width - 2 * edge_border,
        height: edge_border
      });
      edge.setPosition(size.width / 2, size.height - edge_border / 2);
      this.addChild(edge);
      player = new Player({
        world: world,
        dynamic: true,
        width: 30,
        height: 30
      });
      player.setPosition(300, 300);
      this.addChild(player);
      this._player = player;
      speed = 200;
      utils.InputManager.registerKeyDownCallback(cc.KEY.w, function() {
        return player.setVelocity(null, speed);
      });
      utils.InputManager.registerKeyUpCallback(cc.KEY.w, function() {
        return player.setVelocity(null, 0);
      });
      utils.InputManager.registerKeyDownCallback(cc.KEY.s, function() {
        return player.setVelocity(null, -speed);
      });
      utils.InputManager.registerKeyUpCallback(cc.KEY.s, function() {
        return player.setVelocity(null, 0);
      });
      utils.InputManager.registerKeyDownCallback(cc.KEY.a, function() {
        return player.setVelocity(-speed, null);
      });
      utils.InputManager.registerKeyUpCallback(cc.KEY.a, function() {
        return player.setVelocity(0, null);
      });
      utils.InputManager.registerKeyDownCallback(cc.KEY.d, function() {
        return player.setVelocity(speed, null);
      });
      utils.InputManager.registerKeyUpCallback(cc.KEY.d, function() {
        return player.setVelocity(0, null);
      });
    }

    EntryScene.prototype.update = function(dt) {
      var size;
      if (this._player) {
        this._player.update(dt);
      }
      size = cc.director.getWinSize();
      if (this._world) {
        return this._world.update(dt, 0, 0, size.width, size.height);
      }
    };

    return EntryScene;

  })(utils.SceneBase);

  (typeof exports !== "undefined" && exports !== null ? exports : this).EntryScene = EntryScene;

}).call(this);

//# sourceMappingURL=entry_scene.js.map
