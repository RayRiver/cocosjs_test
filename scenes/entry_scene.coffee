
class EntryScene extends utils.SceneBase
  constructor: ->
    super

    size = cc.director.getWinSize()

#    renderer = this.getRenderer()
#
#    # add background
#    sprite = cc.Sprite.create("data/HelloWorld.png")
#    sprite.setPosition(size.width / 2, size.height / 2)
#    sprite.setScale(0.8)
#    renderer.addChild(sprite, 0)
#
#    # sprite action
#    action = cc.MoveBy.create(5, 100, 100)
#    sprite.runAction(action)
#
#    # add label
#    label = cc.LabelTTF.create("hello", "Arial", 40)
#    label.setPosition(size.width / 2, size.height / 2)
#    renderer.addChild(label, 1)

    world = new utils.BumpWorld()
    this._world = world

    # create edges
    edge_border = 30
    edge_dynamic = true

    edge = new Block({world: world, dynamic: edge_dynamic, width: edge_border, height: size.height})
    edge.setPosition(edge_border/2, size.height/2)
    this.addChild(edge)

    edge = new Block({world: world, dynamic: edge_dynamic, width: edge_border, height: size.height})
    edge.setPosition(size.width - edge_border/2, size.height/2)
    this.addChild(edge)

    edge = new Block({world: world, dynamic: edge_dynamic, width: size.width - 2 * edge_border, height: edge_border})
    edge.setPosition(size.width/2, edge_border/2)
    this.addChild(edge)

    edge = new Block({world: world, dynamic: edge_dynamic, width: size.width - 2 * edge_border, height: edge_border})
    edge.setPosition(size.width/2, size.height - edge_border/2)
    this.addChild(edge)

    # create player
    player = new Player({world: world, dynamic: true, width: 30, height: 30})
    player.setPosition(300, 300)
    this.addChild(player)
    this._player = player

    # keyboard callbacks
    speed = 200
    utils.InputManager.registerKeyDownCallback(cc.KEY.w, ()->player.setVelocity(null, speed))
    utils.InputManager.registerKeyUpCallback(cc.KEY.w, ()->player.setVelocity(null, 0))
    utils.InputManager.registerKeyDownCallback(cc.KEY.s, ()->player.setVelocity(null, -speed))
    utils.InputManager.registerKeyUpCallback(cc.KEY.s, ()->player.setVelocity(null, 0))
    utils.InputManager.registerKeyDownCallback(cc.KEY.a, ()->player.setVelocity(-speed, null))
    utils.InputManager.registerKeyUpCallback(cc.KEY.a, ()->player.setVelocity(0, null))
    utils.InputManager.registerKeyDownCallback(cc.KEY.d, ()->player.setVelocity(speed, null))
    utils.InputManager.registerKeyUpCallback(cc.KEY.d, ()->player.setVelocity(0, null))

  update: (dt) ->
    this._player.update(dt) if this._player

    size = cc.director.getWinSize()
    this._world.update(dt, 0, 0, size.width, size.height) if this._world

(exports ? this).EntryScene = EntryScene
