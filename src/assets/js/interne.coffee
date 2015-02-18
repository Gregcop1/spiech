$ ->
  $.replaceMenuLinks= ->
    $item = $('#mainNav a').each(->
      $(this).attr( 'href', $(this).attr('href')
        .replace('/', '/#')
        .replace('.html', '') )
    )
    return @
    
  $(window).load ->
    $('html').addClass('loaded')
    sm = new gc.slice.SliceManager({ selector: '#slices .slice', contentsSelector: '#contents .content', bulletContainer: '#subNav li' })
    $.replaceMenuLinks()
