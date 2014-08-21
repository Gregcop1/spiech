class Content
  # _sm
  # _target
  # _slices

  constructor: (options)->
    @_initVars(options)
      ._binds()
    return @

  _initVars: (options)->
    @_sm = options?.sm || null
    @_target = options?.target || null
    if(@_target)
      @_target = $(@_target)
      @_slices = @_target.attr('data-slices').split(',')
    return @

  _show: (e, data)=>
    if $.inArray(data.index.toString(), @_slices) != -1
      @_target.addClass('current')
    else
      @_target.removeClass('current')
    return @

  _binds: ()->
    @_sm.dispatcher.on('showSlice', @_show)
    return @

window.gc.slice.Content = Content