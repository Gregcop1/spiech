(function() {
  $(function() {
    $.initPlan = function() {
      if ($('body').hasClass('espaces-de-travail')) {
        $('.arrowLeft').on('click', $.previousSlide);
        $('.arrowRight').on('click', $.nextSlide);
      }
      return this;
    };
    $.nextSlide = (function(_this) {
      return function() {
        var current;
        current = $('.slide').not('.future,.past');
        if (current.next('.slide').length) {
          return current.addClass('past').next().removeClass('future');
        }
      };
    })(this);
    $.previousSlide = (function(_this) {
      return function() {
        var current;
        current = $('.slide').not('.future,.past');
        if (current.prev('.slide').length) {
          return current.addClass('future').prev().removeClass('past');
        }
      };
    })(this);
    return $(window).load(function() {
      var sm;
      $('html').addClass('loaded');
      sm = new gc.slice.SliceManager({
        selector: '#slices .slice',
        contentsSelector: '#contents .content',
        bulletContainer: '#subNav li'
      });
      return $.initPlan();
    });
  });

}).call(this);

//# sourceMappingURL=newBusinessSolutions.js.map
