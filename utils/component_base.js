// Generated by CoffeeScript 1.10.0
(function() {
  var ComponentBase;

  ComponentBase = (function() {
    function ComponentBase() {
      this._owner = null;
    }

    ComponentBase.prototype.getOwner = function() {
      return this._owner;
    };

    ComponentBase.prototype.attach = function(owner) {
      cc.assert(owner);
      this._owner = owner;
      return this.onAttached();
    };

    ComponentBase.prototype.detach = function() {
      return this.onDetached();
    };

    ComponentBase.prototype.update = function(dt) {
      return this.onUpdate(dt);
    };

    ComponentBase.prototype.onAttached = function() {};

    ComponentBase.prototype.onDetached = function() {};

    ComponentBase.prototype.onUpdate = function(dt) {};

    return ComponentBase;

  })();

  utils.ComponentBase = ComponentBase;

}).call(this);

//# sourceMappingURL=component_base.js.map