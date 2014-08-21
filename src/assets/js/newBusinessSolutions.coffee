$ ->
  $.initPlan = ()->
    if $('body').hasClass('espaces-de-travail')
      $('.arrowLeft').on('click', $.previousSlide)
      $('.arrowRight').on('click', $.nextSlide)

    return @

  $.nextSlide = ()=>
    current =  $('.slide').not('.future,.past')
    if current.next('.slide').length
      current.addClass('past')
        .next()
        .removeClass('future')

  $.previousSlide = ()=>
    current =  $('.slide').not('.future,.past')
    if current.prev('.slide').length
      current.addClass('future')
        .prev()
        .removeClass('past')

  $(window).load ->
    $('html').addClass('loaded')
    sm = new gc.slice.SliceManager({ selector: '#slices .slice', contentsSelector: '#contents .content', bulletContainer: '#subNav li' })

    $.initPlan()
