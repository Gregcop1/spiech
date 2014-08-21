(function() {
  var Content, MenuItem, Slice, SliceManager,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  SliceManager = (function() {
    SliceManager.prototype._slices = [];

    SliceManager.prototype._contents = [];

    SliceManager.prototype._menuItems = [];

    SliceManager.prototype._currentSlice = -1;

    SliceManager.prototype.dispatcher = $({});

    function SliceManager(options) {
      this._manageKey = __bind(this._manageKey, this);
      this._manageWheel = __bind(this._manageWheel, this);
      this.gotoSlice = __bind(this.gotoSlice, this);
      this.gotoNextSlice = __bind(this.gotoNextSlice, this);
      this.gotoPreviousSlice = __bind(this.gotoPreviousSlice, this);
      this._initVars(options)._binds()._build()._detectAnchor();
      return this;
    }

    SliceManager.prototype._initVars = function(options) {
      this._selector = (options != null ? options.selector : void 0) || null;
      this._contentsSelector = (options != null ? options.contentsSelector : void 0) || null;
      this._bulletContainer = (options != null ? options.bulletContainer : void 0) || null;
      if (this._selector) {
        this._selector = $(this._selector);
      }
      if (this._bulletContainer) {
        this._bulletContainer = $(this._bulletContainer);
      }
      return this;
    };

    SliceManager.prototype._build = function() {
      this._buildContents()._buildSlices();
      return this;
    };

    SliceManager.prototype._detectAnchor = function() {
      if (window.location.hash && $(window.location.hash).length) {
        this.dispatcher.trigger('showSlice', {
          index: $(window.location.hash).index()
        });
      }
      return this;
    };

    SliceManager.prototype._buildSlices = function() {
      var that;
      that = this;
      $(this._selector).each(function() {
        that._slices.push(new gc.slice.Slice({
          sm: that,
          target: this
        }));
        return that._menuItems.push(new gc.slice.MenuItem({
          sm: that,
          title: $(this).attr('data-title'),
          el: that._bulletContainer.eq($(this).index())
        }));
      });
      this.gotoSlice(0);
      return this;
    };

    SliceManager.prototype._buildContents = function() {
      var that;
      that = this;
      $(this._contentsSelector).each(function() {
        return that._contents.push(new gc.slice.Content({
          sm: that,
          target: this
        }));
      });
      return this;
    };

    SliceManager.prototype.gotoPreviousSlice = function() {
      var currentIndex;
      currentIndex = $(this._selector).filter('.current').index();
      this.gotoSlice(currentIndex - 1);
      return this;
    };

    SliceManager.prototype.gotoNextSlice = function() {
      var currentIndex;
      currentIndex = $(this._selector).filter('.current').index();
      this.gotoSlice(currentIndex + 1);
      return this;
    };

    SliceManager.prototype.gotoSlice = function(index) {
      if (index >= 0 && index < this._slices.length) {
        this.dispatcher.trigger('showSlice', {
          index: index
        });
      }
      return this;
    };

    SliceManager.prototype._manageWheel = function(e) {
      var currentIndex;
      currentIndex = $(this._selector).filter('.current').index();
      if ((e != null ? e.deltaY : void 0) < 0) {
        this.gotoNextSlice();
      } else {
        this.gotoPreviousSlice();
      }
      return this;
    };

    SliceManager.prototype._manageKey = function(e) {
      if ($.inArray(e.which, [32, 39, 40]) !== -1) {
        this.gotoNextSlice();
      } else if ($.inArray(e.which, [37, 38]) !== -1) {
        this.gotoPreviousSlice();
      }
      return this;
    };

    SliceManager.prototype._binds = function() {
      $(window).on('mousewheel', _.debounce(this._manageWheel, 100, true));
      $(window).on('keydown', this._manageKey);
      if ($('html').hasClass('touch')) {
        $('body').swipe({
          swipeLeft: this.gotoNextSlice,
          swipeUp: this.gotoNextSlice,
          swipeRight: this.gotoPreviousSlice,
          swipeDown: this.gotoPreviousSlice
        });
      }
      return this;
    };

    return SliceManager;

  })();

  if (!window.gc) {
    window.gc = {};
  }

  if (!window.gc.slice) {
    window.gc.slice = {};
  }

  window.gc.slice.SliceManager = SliceManager;

  Slice = (function() {
    function Slice(options) {
      this._show = __bind(this._show, this);
      this._initVars(options)._binds();
      return this;
    }

    Slice.prototype._initVars = function(options) {
      this._sm = (options != null ? options.sm : void 0) || null;
      this._target = (options != null ? options.target : void 0) || null;
      if (this._target) {
        this._target = $(this._target);
      }
      return this;
    };

    Slice.prototype._show = function(e, data) {
      if (this._target.index() === data.index) {
        this._target.addClass('current').removeClass('past').removeClass('future');
      } else if (this._target.index() < data.index) {
        this._target.addClass('past').removeClass('future').removeClass('current');
      } else {
        this._target.addClass('future').removeClass('past').removeClass('current');
      }
      return this;
    };

    Slice.prototype._binds = function() {
      this._sm.dispatcher.on('showSlice', this._show);
      return this;
    };

    return Slice;

  })();

  window.gc.slice.Slice = Slice;

  Content = (function() {
    function Content(options) {
      this._show = __bind(this._show, this);
      this._initVars(options)._binds();
      return this;
    }

    Content.prototype._initVars = function(options) {
      this._sm = (options != null ? options.sm : void 0) || null;
      this._target = (options != null ? options.target : void 0) || null;
      if (this._target) {
        this._target = $(this._target);
        this._slices = this._target.attr('data-slices').split(',');
      }
      return this;
    };

    Content.prototype._show = function(e, data) {
      if ($.inArray(data.index.toString(), this._slices) !== -1) {
        this._target.addClass('current');
      } else {
        this._target.removeClass('current');
      }
      return this;
    };

    Content.prototype._binds = function() {
      this._sm.dispatcher.on('showSlice', this._show);
      return this;
    };

    return Content;

  })();

  window.gc.slice.Content = Content;

  MenuItem = (function() {
    function MenuItem(options) {
      this._show = __bind(this._show, this);
      this._click = __bind(this._click, this);
      this._initVars(options)._binds();
      return this;
    }

    MenuItem.prototype._initVars = function(options) {
      this._sm = (options != null ? options.sm : void 0) || null;
      this._title = (options != null ? options.title : void 0) || null;
      this._el = (options != null ? options.el : void 0) || null;
      return this;
    };

    MenuItem.prototype.getEl = function() {
      return this._el;
    };

    MenuItem.prototype._click = function(e) {
      this._sm.dispatcher.trigger('showSlice', {
        index: this._el.index()
      });
      e.preventDefault();
      return this;
    };

    MenuItem.prototype._show = function(e, data) {
      if (this._el.index() === data.index) {
        this._el.addClass('active');
      } else {
        this._el.removeClass('active');
      }
      return this;
    };

    MenuItem.prototype._binds = function() {
      this._el.on('click', this._click);
      this._sm.dispatcher.on('showSlice', this._show);
      return this;
    };

    return MenuItem;

  })();

  window.gc.slice.MenuItem = MenuItem;

}).call(this);
