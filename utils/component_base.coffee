
class ComponentBase
  constructor: ->
    @_owner = null

  getOwner: ->
    return @_owner

  attach: (owner) ->
    cc.assert(owner)
    @_owner = owner
    @onAttached()

  detach: ->
    @onDetached()

  update: (dt) ->
    @onUpdate(dt)

  # override these functions
  onAttached: ->
  onDetached: ->
  onUpdate: (dt) ->

utils.ComponentBase = ComponentBase
