
class SceneBase
  constructor: ->
    this._renderer = null

    layer = cc.Layer.create()
    this.setRenderer(layer)

  destroy: ->
    this.setRenderer(null)
    this

  update: (dt) ->

  getRenderer: ->
    this._renderer

  setRenderer: (renderer) ->
    if this._renderer
      if this._renderer.getParent()
        this._renderer.removeFromParent()

      this._renderer.release()
      this._renderer = null

    if renderer
      scene = cc.director.getRunningScene()
      scene.addChild(renderer)

      this._renderer = renderer
      this._renderer.retain()

    this

  addChildRenderer: (child_renderer, args...) ->
    cc.assert(child_renderer)
    cc.assert(this._renderer)
    this._renderer.addChild(child_renderer, args...)
    this

  addChild: (child, args...) ->
    cc.assert(child)
    child_renderer = child.getRenderer()
    cc.assert(child_renderer)
    this.addChildRenderer(child_renderer, args...)
    this

utils.SceneBase = SceneBase
