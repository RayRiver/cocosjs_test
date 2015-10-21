
class ComponentBase
  constructor: ->
    this._owner = null

  getOwner: ->
    return _owner

  attach: (owner) ->
    this._owner = owner
    this.onAttached()

  detach: ->
    this.onDetached()

  update: (dt) ->
    this.onUpdate(dt)

  # override these functions
  onAttached: ->
  onDetached: ->
  onUpdate: (dt) ->

utils.ComponentBase = ComponentBase
