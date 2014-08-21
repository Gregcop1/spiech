$ ->
  $(window).ready ->
    # Handle the video popin
    $('#mainNav .item-4 a').fancybox({
      width       : 800,
      height       : 455,
      openEffect  : 'none',
      closeEffect : 'none',
      helpers : {
        media : {}
      }
    });
    console.log $('.fancybox')
    $('.fancybox').fancybox({
      maxWidth  : 800,
      maxHeight : 600,
      fitToView : false,
      width   : '70%',
      height    : '70%',
      autoSize  : false,
      closeClick  : false,
      openEffect  : 'none',
      closeEffect : 'none',
      type: 'ajax'
    });
    # Handle src update on hover event
    $(".no-touch img.hover").hoverSrc()

    # Enable placeholder management for updated browsers
    unless Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder()  unless $(this).attr("placeholder") is ""
