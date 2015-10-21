
window.onload = ->
  cc.game.onStart = ->
    cc.LoaderScene.preload(Resources, ->
      cc.director.runScene(new utils.CocosScene())
    this)

  cc.game.run("gameCanvas")
