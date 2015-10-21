
global = this

class GameObject
  constructor: ->
    this._renderer = null
    this._components = {}
    @_tag = "Default"

  destroy: ->
    this.removeAllComponents()
    this.setRenderer(null)

  update: (dt) ->
    com.update(dt) for name, com of self._components

  addComponent: (name, config) ->
    if this._components[name]
      cc.assert(false, "component [" + name + "] already exists")
      return

    com_class = global.components[name]
    if !com_class
      cc.assert(false, "component class not exist: " + name)
      return

    com = new com_class()
    cc.asert(com)
    this._components[name] = com
    com.attach(this)

    this

  removeComponent: (name) ->
    com = this._components[name]
    if !com
      cc.assert(false, "cannot remove component not exist: " + name)
      return

    this._components.remove(name)
    com.detach()

    this

  removeAllComponents: ->
    com.detach() for name, com of this._components
    this._components.clear()

  getComponent: (name) ->
    this._components[name]

  getRenderer: ->
    return this._renderer

  setRenderer: (renderer) ->
    if this._renderer
      if this._renderer.getParent()
        this._renderer.removeFromParent()

      this._renderer.release()
      this._renderer = null

    if renderer
      this._renderer = renderer
      this._renderer.retain()

  setTag: (tag) -> @_tag = tag
  getTag: -> @_tag

utils.GameObject = GameObject
