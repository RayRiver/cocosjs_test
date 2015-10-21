
window.onload = ->
  cc.game.onStart = ->
    cc.LoaderScene.preload(Resources, ->
      cc.director.runScene(new utils.CocosScene())
      return
    this)
    return

  cc.game.run("gameCanvas")
  return
