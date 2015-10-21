
class BumpWorld extends lib.Bump
  collision: (item1, item2, dx, dy) ->
    cc.log("collision " + dx + ", " + dy)
    pos = item1.getPosition()
    item1.setPosition(pos.x + dx, pos.y + dy)

  endCollision: (item1, item2) ->
    cc.log("end collision")

  shouldCollide: (item1, item2) ->
    tag1 = item1.getTag()
    tag2 = item2.getTag()
    if tag1 == "Player" and tag2 == "Block"
      true
    else
      false

  getBBox: (item) -> item.getBBox()

  update: (dt, x, y, w, h) ->
    this.collide(x, y, w, h)

utils.BumpWorld = BumpWorld
