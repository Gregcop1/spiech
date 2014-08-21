class Slice
  # _sm
  # _target

  constructor: (options)->
    @_initVars(options)
      ._binds()
    return @

  _initVars: (options)->
    @_sm = options?.sm || null
    @_target = options?.target || null
    if(@_target)
      @_target = $(@_target)
    return @

  _show: (e, data)=>
    if @_target.index() == data.index
      @_target.addClass('current')
        .removeClass('past')
        .removeClass('future')
    else if @_target.index() < data.index
      @_target.addClass('past')
        .removeClass('future')
        .removeClass('current')
    else
      @_target.addClass('future')
        .removeClass('past')
        .removeClass('current')
    return @

  _binds: ()->
    @_sm.dispatcher.on('showSlice', @_show)
    return @

window.gc.slice.Slice = Slice