(function() {
  $(function() {
    return $(window).load(function() {
      var sm;
      $('html').addClass('loaded');
      return sm = new gc.slice.SliceManager({
        selector: '#slices .slice',
        contentsSelector: '#contents .content',
        bulletContainer: '#subNav li'
      });
    });
  });

}).call(this);

//# sourceMappingURL=contact.js.map
