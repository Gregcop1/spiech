$ ->
  $(window).load ->
    $('html').addClass('loaded')
    sm = new gc.slice.SliceManager({ selector: '#slices .slice', contentsSelector: '#contents .content', bulletContainer: '#mainNav li' })
    