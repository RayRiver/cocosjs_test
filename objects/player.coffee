
class Player extends utils.EntityBase
  constructor: (config) ->
    super

    @setTag("Player")

    config = config ? {}
    w = config.width ? 30
    h = config.height ? 30
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
    ], cc.color(0,255,0,128), 0.5, cc.color(0,255,0,255))
    node.drawDot(cc.p(0,0), 5, cc.color.GREEN)

    this.setRenderer(node)

    pos = this.getPosition()
    @_desired_box = [pos.x-w/2, pos.y-h/2, w, h]

    if this._world
      if dynamic
        this._world.add(this)
      else
        this._world.addStatic(this)

  update: (dt) ->
    super

    pos = this.getPosition()
    velocity = this.getVelocity()

    x = pos.x
    y = pos.y
    vx = velocity.x
    vy = velocity.y

    x += vx * dt
    y += vy * dt

    @_desired_box[0] = x - @_width/2
    @_desired_box[1] = y - @_height/2

    this.setPosition(x, y)
    return

  getBBox: -> @_desired_box

(exports ? this).Player = Player