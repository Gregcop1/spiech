(function() {
  $(function() {
    $.lastDisplay = {};
    $.initAccordion = function() {
      $.hideAccordionItems();
      $('.slice-1 li').on('click', $.showAccordionItems);
      return this;
    };
    $.hideAccordionItems = function() {
      $('.slice-1 li').addClass('fold').removeClass('unfold').find('p').slideUp();
      return this;
    };
    $.showAccordionItems = (function(_this) {
      return function(e) {
        var target;
        $.hideAccordionItems();
        target = $(e != null ? e.target : void 0).closest('li');
        if (!$.lastDisplay.length || (target.get(0) !== $.lastDisplay.get(0))) {
          target.addClass('unfold').removeClass('fold').find('p').slideDown();
          $.lastDisplay = target;
        } else {
          $.lastDisplay = {};
        }
        return _this;
      };
    })(this);
    $(window).ready(function() {
      return $.initAccordion();
    });
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

//# sourceMappingURL=performancesTechniques.js.map
