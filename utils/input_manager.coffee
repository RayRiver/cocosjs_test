
M = {
  _keydown_callbacks: {} # keycode -> { callback map }
  _keyup_callbacks: {} # keycode -> { callback map }
  _pressed_keys: {}
  _generated_id: 0
  _ids: {}

  _generateId: ->
    this._generated_id += 1
    this._generated_id

  update: (dt) ->

  onKeyPressed: (keycode, event) ->
    # already pressed
    return if this._pressed_keys[keycode]

    this._pressed_keys[keycode] = true

    callbacks = this._keydown_callbacks[keycode]
    return if !callbacks

    for keycode, info of callbacks
      callback = info.callback
      args = info.args
      if callback
        callback(args...)

    return

  onKeyReleased: (keycode, event) ->
    return if !this._pressed_keys[keycode]

    this._pressed_keys[keycode] = null

    callbacks = this._keyup_callbacks[keycode]
    return if !callbacks

    for keycode, info of callbacks
      callback = info.callback
      args = info.args
      if callback
        callback(args...)

    return

  registerKeyDownCallback: (keycode, callback, args...) ->
    this._keydown_callbacks[keycode] = this._keydown_callbacks[keycode] ? {}

    id = this._generateId()
    this._keydown_callbacks[keycode][id] =
      callback: callback
      args: args
    this._ids[id] = this._keydown_callbacks[keycode]

    id

  registerKeyUpCallback: (keycode, callback, args...) ->
    this._keyup_callbacks[keycode] = this._keyup_callbacks[keycode] ? {}

    id = this._generateId()
    this._keyup_callbacks[keycode][id] =
      callback: callback
      args: args
    this._ids[id] = this._keyup_callbacks[keycode]

    id

  unregisterCallback: (id) ->
    t = self._ids[id]

    if !t
      cc.assert(false)
      return

    t[id] = null
    this._ids[id] = null
}

utils.InputManager = M
