
class Block extends utils.EntityBase
  constructor: (config) ->
    super

    @setTag("Block")

    config = config ? {}
    w = config.width ? 30
    h = config.height ? 30
    show_center_point = config.show_center_point ? false
    dynamic = config.dynamic ? false

    this._world = config.world
    this._width = w
    this._height = h

    node = cc.DrawNode.create()
    node.drawPoly([
      cc.p(-w/2, -h/2),
      cc.p(-w/2, h/2),
      cc.p(w/2, h/2),
      cc.p(w/2, -h/2),
    ], cc.color(255,0,0,128), 0.5, cc.color(255,0,0,255))
    node.drawDot(cc.p(0,0), 5, cc.color.RED) if show_center_point

    this.setRenderer(node)

    if this._world
      if dynamic
        this._world.add(this)
      else
        this._world.addStatic(this)

  update: (dt) ->
    super

  getBBox: ->
    pos = this.getPosition()
    w = this._width
    h = this._height
    [pos.x-w/2, pos.y-h/2, w, h]

(exports ? this).Block = Block
