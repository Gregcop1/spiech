(function() {
  $(function() {
    $.replaceMenuLinks = function() {
      var $item;
      $item = $('#mainNav a').each(function() {
        return $(this).attr('href', $(this).attr('href').replace('/', '/#').replace('.html', ''));
      });
      return this;
    };
    return $(window).load(function() {
      var sm;
      $('html').addClass('loaded');
      sm = new gc.slice.SliceManager({
        selector: '#slices .slice',
        contentsSelector: '#contents .content',
        bulletContainer: '#subNav li'
      });
      return $.replaceMenuLinks();
    });
  });

}).call(this);

//# sourceMappingURL=interne.js.map
