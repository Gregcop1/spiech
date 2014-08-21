(function() {
  $(function() {
    return $(window).load(function() {
      var sm;
      $('html').addClass('loaded');
      return sm = new gc.slice.SliceManager({
        selector: '#slices .slice',
        contentsSelector: '#contents .content',
        bulletContainer: '#mainNav li:not(:nth-last-child(-n+3))'
      });
    });
  });

}).call(this);

//# sourceMappingURL=home.js.map
