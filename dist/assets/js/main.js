(function() {
  $(function() {
    return $(window).ready(function() {
      $('#mainNav .item-4 a').fancybox({
        width: 800,
        height: 455,
        openEffect: 'none',
        closeEffect: 'none',
        helpers: {
          media: {}
        }
      });
      console.log($('.fancybox'));
      $('.fancybox').fancybox({
        maxWidth: 800,
        maxHeight: 600,
        fitToView: false,
        width: '70%',
        height: '70%',
        autoSize: false,
        closeClick: false,
        openEffect: 'none',
        closeEffect: 'none',
        type: 'ajax'
      });
      $(".no-touch img.hover").hoverSrc();
      if (!Modernizr.input.placeholder) {
        return $("input").each(function() {
          if ($(this).attr("placeholder") !== "") {
            return $(this).placeholder();
          }
        });
      }
    });
  });

}).call(this);

//# sourceMappingURL=main.js.map
