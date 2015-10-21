
CocosScene = cc.Scene.extend
  onEnter: ->
    this._super()

    director = cc.director
    utils.SceneManager.enterScene("EntryScene")

    this.scheduleUpdate()

    # keyboard callbacks
    listener = cc.EventListener.create({event: cc.EventListener.KEYBOARD})
    listener.onKeyPressed = (keycode, event) -> utils.InputManager.onKeyPressed(keycode, event)
    listener.onKeyReleased = (keycode, event) -> utils.InputManager.onKeyReleased(keycode, event)
    cc.eventManager.addListener(listener, this)

  update: (dt) ->
    this._super()

    utils.InputManager.update(dt)
    utils.SceneManager.update(dt)

utils.CocosScene = CocosScene