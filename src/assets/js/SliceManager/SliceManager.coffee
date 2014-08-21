class SliceManager
  _slices       : []
  _contents     : []
  _menuItems    : []
  _currentSlice : -1
  dispatcher    : $({})
  # _selector
  # _contentsSelector
  # _bulletContainer

  constructor: (options)->
    @_initVars(options)
      ._binds()
      ._build()
      ._detectAnchor()
    return @

  _initVars: (options)->
    @_selector = options?.selector || null
    @_contentsSelector = options?.contentsSelector || null
    @_bulletContainer = options?.bulletContainer || null
    if(@_selector)
      @_selector = $(@_selector)
    if(@_bulletContainer)
      @_bulletContainer = $(@_bulletContainer)
    return @

  _build: ()->
    @_buildContents()
      ._buildSlices()
    return @

  _detectAnchor: ()->
    if(window.location.hash && $(window.location.hash).length)
      @dispatcher.trigger('showSlice', { index: $(window.location.hash).index() })
    return @

  _buildSlices: ()->
    that = this
    $(@_selector).each(()->
      that._slices.push( new gc.slice.Slice({ sm: that, target: this }) )
      that._menuItems.push( new gc.slice.MenuItem({ sm: that, title: $(this).attr('data-title'), el: that._bulletContainer.eq($(this).index()) }) )
    )
    @gotoSlice( 0 )
    return @

  _buildContents: ()->
    that = this
    $(@_contentsSelector).each(()->
      that._contents.push( new gc.slice.Content({ sm: that, target: this }) )
    )
    return @

  gotoPreviousSlice: ()=>
    currentIndex = $(@_selector).filter('.current').index()
    @gotoSlice( currentIndex-1 )
    return @

  gotoNextSlice: ()=>
    currentIndex = $(@_selector).filter('.current').index()
    @gotoSlice( currentIndex+1 )
    return @

  gotoSlice: (index)=>
    if index >= 0 && index < @_slices.length
      @dispatcher.trigger('showSlice', { index: index })
    return @

  _manageWheel: (e)=>
    currentIndex = $(@_selector).filter('.current').index()
    if(e?.deltaY < 0)
      @gotoNextSlice()
    else
      @gotoPreviousSlice()
    return @

  _manageKey: (e)=>
    if $.inArray(e.which, [32,39,40]) != -1 # space, right arrow, bottom arrow
      @gotoNextSlice()
    else if $.inArray(e.which, [37,38]) != -1 # top arrow, left arrow
      @gotoPreviousSlice()
    return @


  _binds: ()->
    $(window).on('mousewheel',  _.debounce(@_manageWheel, 100, true))
    $(window).on('keydown', @_manageKey)
    if $('html').hasClass('touch')
      $('body').swipe({
        swipeLeft: @gotoNextSlice,
        swipeUp: @gotoNextSlice,
        swipeRight: @gotoPreviousSlice,
        swipeDown: @gotoPreviousSlice
      });
    return @


if( !window.gc )
  window.gc = {}
if( !window.gc.slice )
  window.gc.slice = {}
window.gc.slice.SliceManager = SliceManager