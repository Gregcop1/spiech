$ ->
  $.lastDisplay = {}
  $.initAccordion = ()->
    $.hideAccordionItems()
    $('.slice-1 li').on('click', $.showAccordionItems)
    return @

  $.hideAccordionItems = ()->
    $('.slice-1 li')
      .addClass('fold')
      .removeClass('unfold')
      .find('p').slideUp()
    return @

  $.showAccordionItems = (e)=>
    $.hideAccordionItems()
    target = $(e?.target).closest('li')
    if(!$.lastDisplay.length || ( target.get(0) != $.lastDisplay.get(0)) )
      target.addClass('unfold')
        .removeClass('fold')
        .find('p').slideDown()
      $.lastDisplay = target
    else
      $.lastDisplay = {}
    return @

  $(window).ready ->
    $.initAccordion();

  $(window).load ->
    $('html').addClass('loaded')
    sm = new gc.slice.SliceManager({ selector: '#slices .slice', contentsSelector: '#contents .content', bulletContainer: '#subNav li' })
