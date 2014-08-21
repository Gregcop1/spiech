class MenuItem
  #_sm
  # _el
  # _title

  constructor: (options)->
    @_initVars(options)
      ._binds()
    return @

  _initVars: (options)->
    @_sm = options?.sm || null
    @_title = options?.title || null
    @_el = options?.el || null
    return @

  getEl: ()->
    return @_el

  _click: (e)=>
    @_sm.dispatcher.trigger('showSlice', { index: @_el.index() })
    e.preventDefault()
    return @

  _show: (e, data)=>
    if @_el.index() == data.index
      @_el.addClass('active')
    else
      @_el.removeClass('active')
    return @

  _binds: ()->
    @_el.on('click', @_click)
    @_sm.dispatcher.on('showSlice', @_show)
    return @

window.gc.slice.MenuItem = MenuItem