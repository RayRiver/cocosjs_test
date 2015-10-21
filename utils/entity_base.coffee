
class EntityBase extends utils.GameObject
  constructor: ->
    super

    this._pos = cc.p(0, 0)
    this._velocity = cc.p(0, 0)

  setPosition: (x, y) ->
    x_changed = false
    y_changed = false

    if x? and x != this._pos.x
      this._pos.x = x
      x_changed = true

    if y? and y != this._pos.y
      this._pos.y = y
      y_changed = true

    if x_changed or y_changed
      renderer = this.getRenderer()
      renderer.setPosition(this._pos.x, this._pos.y) if renderer

  getPosition: ->
    cc.p(this._pos.x, this._pos.y)

  setVelocity: (vx, vy) ->
    this._velocity.x = vx if vx?
    this._velocity.y = vy if vy?

  getVelocity: ->
    cc.p(this._velocity.x, this._velocity.y)

utils.EntityBase = EntityBase
