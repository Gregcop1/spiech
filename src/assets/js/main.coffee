$ ->

  $(window).ready ->
    # Init the google map
    # $.initGmap()

    # Handle src update on hover event
    $(".no-touch img.hover").hoverSrc()

    # Enable placeholder management for updated browsers
    unless Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder()  unless $(this).attr("placeholder") is ""
