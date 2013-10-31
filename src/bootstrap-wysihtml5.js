!function($, wysi) {
    "use strict";

    var toolbarTemplates = {
        "font-styles": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li class='dropdown'>" +
              "<a class='btn btn-default btn" + size + " dropdown-toggle' data-toggle='dropdown' href='#' tabindex='-1'>" +
              "<i class='glyphicon glyphicon-font'></i>&nbsp;<span>" + locale.font_styles.normal + "</span>&nbsp;<b class='caret'></b>" +
              "</a>" +
              "<ul class='dropdown-menu'>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='p'>" + locale.font_styles.normal + "</a></li>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h1'>" + locale.font_styles.h1 + "</a></li>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h2'>" + locale.font_styles.h2 + "</a></li>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h3'>" + locale.font_styles.h3 + "</a></li>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h4'>" + locale.font_styles.h4 + "</a></li>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h5'>" + locale.font_styles.h5 + "</a></li>" +
                "<li><a data-wysihtml5-command='formatBlock' data-wysihtml5-command-value='h6'>" + locale.font_styles.h6 + "</a></li>" +
              "</ul>" +
            "</li>";
        },

        "emphasis": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li>" +
              "<div class='btn-group'>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='bold' title='CTRL+B' tabindex='-1'>" + locale.emphasis.bold + "</a>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='italic' title='CTRL+I' tabindex='-1'>" + locale.emphasis.italic + "</a>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='underline' title='CTRL+U' tabindex='-1'>" + locale.emphasis.underline + "</a>" +
              "</div>" +
            "</li>";
        },

        "lists": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li>" +
              "<div class='btn-group'>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='insertUnorderedList' title='" + locale.lists.unordered + "' tabindex='-1'><i class='glyphicon glyphicon-list'></i></a>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='insertOrderedList' title='" + locale.lists.ordered + "' tabindex='-1'><i class='glyphicon glyphicon-th-list'></i></a>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='Outdent' title='" + locale.lists.outdent + "' tabindex='-1'><i class='glyphicon glyphicon-indent-right'></i></a>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='Indent' title='" + locale.lists.indent + "' tabindex='-1'><i class='glyphicon glyphicon-indent-left'></i></a>" +
              "</div>" +
            "</li>";
        },

        "link": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li>" +
              "<div class='bootstrap-wysihtml5-insert-link-modal modal fade'>" +
                "<div class='modal-dialog'>" +
                  "<div class='modal-content'>" +
                    "<div class='modal-header'>" +
                      "<a class='close' data-dismiss='modal'>&times;</a>" +
                      "<h3 class='modal-title'>" + locale.link.insert + "</h3>" +
                    "</div>" +
                    "<div class='modal-body'>" +
                      "<input value='http://' class='bootstrap-wysihtml5-insert-link-url form-control'>" +
                      "<label class='checkbox'> <input type='checkbox' class='bootstrap-wysihtml5-insert-link-target' checked>" + locale.link.target + "</label>" +
                    "</div>" +
                    "<div class='modal-footer'>" +
                      "<a href='#' class='btn btn-default' data-dismiss='modal'>" + locale.link.cancel + "</a>" +
                      "<a href='#' class='btn btn-primary' data-dismiss='modal'>" + locale.link.insert + "</a>" +
                    "</div>" +
                  "</div>" +
                "</div>" +
              "</div>" +
              "<a class='btn btn-default" + size + "' data-wysihtml5-command='createLink' title='" + locale.link.insert + "' tabindex='-1'><i class='glyphicon glyphicon-share'></i></a>" +
            "</li>";
        },

        "image": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li>" +
              "<div class='bootstrap-wysihtml5-insert-image-modal modal fade'>" +
                "<div class='modal-dialog'>" +
                  "<div class='modal-content'>" +
                    "<div class='modal-header'>" +
                      "<a class='close' data-dismiss='modal'>&times;</a>" +
                      "<h3 class='modal-title'>" + locale.image.insert + "</h3>" +
                    "</div>" +
                    "<div class='modal-body'>" +
                      "<input value='http://' class='bootstrap-wysihtml5-insert-image-url form-control'>" +
                    "</div>" +
                    "<div class='modal-footer'>" +
                      "<a href='#' class='btn btn-default' data-dismiss='modal'>" + locale.image.cancel + "</a>" +
                      "<a href='#' class='btn btn-primary' data-dismiss='modal'>" + locale.image.insert + "</a>" +
                    "</div>" +
                  "</div>" +
                "</div>" +
              "</div>" +
              "<a class='btn btn-default btn" + size + "' data-wysihtml5-command='insertImage' title='" + locale.image.insert + "' tabindex='-1'><i class='glyphicon glyphicon-picture'></i></a>" +
            "</li>";
        },

        "html": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li>" +
              "<div class='btn-group'>" +
                "<a class='btn btn-default btn" + size + "' data-wysihtml5-action='change_view' title='" + locale.html.edit + "' tabindex='-1'><i class='glyphicon glyphicon-pencil'></i></a>" +
              "</div>" +
            "</li>";
        },

        "color": function(locale, options) {
            var size = (options && options.size) ? ' btn-'+options.size : '';
            return "<li class='dropdown'>" +
              "<a class='btn btn-default dropdown-toggle" + size + "' data-toggle='dropdown' href='#' tabindex='-1'>" +
                "<span>" + locale.colours.black + "</span>&nbsp;<b class='caret'></b>" +
              "</a>" +
              "<ul class='dropdown-menu'>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='black'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='black'>" + locale.colours.black + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='silver'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='silver'>" + locale.colours.silver + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='gray'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='gray'>" + locale.colours.gray + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='maroon'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='maroon'>" + locale.colours.maroon + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='red'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='red'>" + locale.colours.red + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='purple'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='purple'>" + locale.colours.purple + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='green'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='green'>" + locale.colours.green + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='olive'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='olive'>" + locale.colours.olive + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='navy'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='navy'>" + locale.colours.navy + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='blue'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='blue'>" + locale.colours.blue + "</a></li>" +
                "<li><div class='wysihtml5-colors' data-wysihtml5-command-value='orange'></div><a class='wysihtml5-colors-title' data-wysihtml5-command='foreColor' data-wysihtml5-command-value='orange'>" + locale.colours.orange + "</a></li>" +
              "</ul>" +
            "</li>";
        }
    };

    var Wysihtml5 = function(el, options) {
        this.el = el;
        options = $.extend({}, options, defaultOptions);

        this.toolbar = this.createToolbar(el, options);
        this.editor =  this.createEditor(options);

        // Override addClass to update menus
        var _addClass = wysi.dom.addClass,
            _removeClass = wysi.dom.removeClass,
            selected_menu_item = null,
            self = this;

        // Update dropdown menus
        wysi.dom.addClass = function(el, className){
            var $el = $(el);
            if ($el.parent().parent('.dropdown-menu').length) {
              selected_menu_item = $el[0];
              self.updateCurrentMenuText($el);
            }
            _addClass.apply(this, arguments);
        };
        wysi.dom.removeClass = function(el, className){
            var $el = $(el);
            if (selected_menu_item && selected_menu_item === el && className === 'wysihtml5-command-active') {
                selected_menu_item = null;
                self.updateCurrentMenuText($el.parent().parent().find('a').first());
            }
            _removeClass.apply(this, arguments);
        };

        if (options.enableAutoResize)
            this.editor.on('load', $.proxy(function(){this.initAutoResize(options)}, this));

        $('iframe.wysihtml5-sandbox').each(function(i, el){
            $(el.contentWindow).off('focus.wysihtml5').on({
                'focus.wysihtml5' : function(){
                    $('li.dropdown').removeClass('open');
                }
            });
        });
    };

    Wysihtml5.prototype = {

        constructor: Wysihtml5,

        createEditor: function(options) {
            options = options || {};

            // Add the toolbar to a clone of the options object so multiple instances
            // of the WYISYWG don't break because "toolbar" is already defined
            options = $.extend(true, {}, options);
            options.toolbar = this.toolbar[0];

            var editor = new wysi.Editor(this.el[0], options);

            if(options && options.events) {
                for(var eventName in options.events) {
                    editor.on(eventName, options.events[eventName]);
                }
            }
            return editor;
        },

        createToolbar: function(el, options) {
            var toolbar = $("<ul/>", {
                'class' : "wysihtml5-toolbar",
                'style': "display:none"
            });

            // Add custom templates
            for (var key in options.customTemplates) {
              toolbarTemplates[key] = options.customTemplates[key];
            }

            // Build toolbar
            for (var key in options) {
                if (!toolbarTemplates[key])
                    continue;
                var tpl = toolbarTemplates[key]($.fn.wysihtml5.locale[options.locale], options);
                toolbar.append(tpl);
                if (this.toolbarHelpers[key])
                    this.toolbarHelpers[key](toolbar, this);
            }

            // Special handling for drop down menus
            toolbar.find(".dropdown").find("a[data-wysihtml5-command]").click($.proxy(function(e) {
                this.updateCurrentMenuText($(e.target || e.srcElement));
            }, this));

            // Attach to DOM
            options.toolbar && toolbar.appendTo(options.toolbar) || this.el.before(toolbar);

            return toolbar;
        },

        toolbarHelpers: {
            html: function(toolbar, self) {
                var changeViewSelector = "a[data-wysihtml5-action='change_view']";
                toolbar.find(changeViewSelector).click(function(e) {
                    toolbar.find('a.btn').not(changeViewSelector).toggleClass('disabled');
                });
            },

            image: function(toolbar, self) {
                var insertImageModal = toolbar.find('.bootstrap-wysihtml5-insert-image-modal');
                var urlInput = insertImageModal.find('.bootstrap-wysihtml5-insert-image-url');
                var insertButton = insertImageModal.find('a.btn-primary');
                var initialValue = urlInput.val();
                var caretBookmark;

                var insertImage = function() {
                    var url = urlInput.val();
                    urlInput.val(initialValue);
                    self.editor.currentView.element.focus();
                    if (caretBookmark) {
                      self.editor.composer.selection.setBookmark(caretBookmark);
                      caretBookmark = null;
                    }
                    self.editor.composer.commands.exec("insertImage", url);
                    if (self.isAutoResizeEnabled())
                        $(self.editor.currentView.element).imagesLoaded().done($.proxy(self.resize, self));
                };

                urlInput.keypress(function(e) {
                    if(e.which == 13) {
                        insertImage();
                        insertImageModal.modal('hide');
                    }
                });

                insertButton.click(insertImage);

                insertImageModal.on('shown', function() {
                    urlInput.focus();
                });

                insertImageModal.on('hide', function() {
                    self.editor.currentView.element.focus();
                });

                toolbar.find('a[data-wysihtml5-command=insertImage]').click(function() {
                    var activeButton = $(this).hasClass("wysihtml5-command-active");

                    if (!activeButton) {
                        self.editor.currentView.element.focus(false);
                        caretBookmark = self.editor.composer.selection.getBookmark();
                        insertImageModal.appendTo('body').modal('show');
                        insertImageModal.on('click.dismiss.modal', '[data-dismiss="modal"]', function(e) {
                            e.stopPropagation();
                        });
                        return false;
                    } else {
                        return true;
                    }
                });
            },

            link: function(toolbar, self) {
                var insertLinkModal = toolbar.find('.bootstrap-wysihtml5-insert-link-modal');
                var urlInput = insertLinkModal.find('.bootstrap-wysihtml5-insert-link-url');
                var targetInput = insertLinkModal.find('.bootstrap-wysihtml5-insert-link-target');
                var insertButton = insertLinkModal.find('a.btn-primary');
                var initialValue = urlInput.val();
                var caretBookmark;

                var insertLink = function() {
                    var url = urlInput.val();
                    urlInput.val(initialValue);
                    self.editor.currentView.element.focus();
                    if (caretBookmark) {
                      self.editor.composer.selection.setBookmark(caretBookmark);
                      caretBookmark = null;
                    }

                    var newWindow = targetInput.prop("checked");
                    self.editor.composer.commands.exec("createLink", {
                        'href' : url,
                        'target' : (newWindow ? '_blank' : '_self'),
                        'rel' : (newWindow ? 'nofollow' : '')
                    });
                };
                var pressedEnter = false;

                urlInput.keypress(function(e) {
                    if(e.which == 13) {
                        insertLink();
                        insertLinkModal.modal('hide');
                    }
                });

                insertButton.click(insertLink);

                insertLinkModal.on('shown', function() {
                    urlInput.focus();
                });

                insertLinkModal.on('hide', function() {
                    self.editor.currentView.element.focus();
                });

                toolbar.find('a[data-wysihtml5-command=createLink]').click(function() {
                    var activeButton = $(this).hasClass("wysihtml5-command-active");

                    if (!activeButton) {
                        self.editor.currentView.element.focus(false);
                        caretBookmark = self.editor.composer.selection.getBookmark();
                        insertLinkModal.appendTo('body').modal('show');
                        insertLinkModal.on('click.dismiss.modal', '[data-dismiss="modal"]', function(e) {
                            e.stopPropagation();
                        });
                        return false;
                    }
                    else {
                        return true;
                    }
                });
            }
        },

        updateCurrentMenuText: function($elem) {
            $elem.parent().parent().parent().find('.dropdown-toggle span').text($elem.text());
        },

        getScrollable: function(elem){
            var isWin = !elem.nodeName || $.inArray( elem.nodeName.toLowerCase(), ['iframe','#document','html','body'] ) != -1;
            if (!isWin)
                return elem;
            var doc = (elem.contentWindow || elem).document || elem.ownerDocument || elem;
            return /webkit/i.test(navigator.userAgent) || doc.compatMode == 'BackCompat' ?
                doc.body :
                doc.documentElement;
        },

        // Dynamically expand and contract editor to content size
        getRange: function(iframe) {
            var rng, win = iframe.contentWindow;
            if (!win)
                return null
            var doc = win.document,
                sel = win.getSelection && win.getSelection();
            if (sel && sel.getRangeAt && sel.rangeCount) {
                rng = sel.getRangeAt(0);
            } else if (doc.selection && doc.selection.createRange) {
                rng = doc.selection.createRange();
            }
            return rng && rng.endContainer || null;
        },

        initAutoResize: function(options) {
            if (typeof($('body')[0].scrollHeight) === 'undefined' || !this.editor.composer)
                return false;
            options = options || {};

            var c, resizeFunc = $.proxy(this.resize, this);

            // Cache vars for performance
            c = this._resize = {
                options: options || {}
            };

            c.$iframe = $(this.editor.composer.iframe),
            c.$body = c.$iframe.contents().find('body'),
            c.minHeight = c.$iframe.height(),
            c.$scrollElem = $(this.getScrollable(window)),
            c.resizeScrollThreshold = parseInt(c.options.resizeScrollThreshold) || 0;
            c.topPadding = options.paddingTop || ((parseInt(c.$scrollElem.css('padding-top')) || 0) + 30);

            c.$body.on('keyup', _.debounce(resizeFunc, 300));
            c.$body.on('blur focus', resizeFunc);
            c.$body.on('paste', function(evt){
                imagesLoaded(c.$iframe[0], resizeFunc);
                resizeFunc(evt);
            });
            imagesLoaded(c.$iframe[0], resizeFunc);
            this.resize($.Event('load'));
        },

        isAutoResizeEnabled: function() {
            return !!this._resize;
        },

        resize: function(evt) {
            // Delay resize to make sure dom has updated
            if (evt instanceof imagesLoaded)
                return setTimeout($.proxy(function(){this.resize($.Event('images_loaded'));}, this), 20);

            var c = this._resize,
                $range = $(this.getRange(c.$iframe[0])),
                delHeight, height, scrollHeight;

            if ($range.length && $range[0].nodeType === 3)
              $range = $range.parent(); // Use parent of text node

            // Check for DELETE
            if (evt.type === 'keyup' && (evt.keyCode === wysi.BACKSPACE_KEY || evt.keyCode === wysi.DELETE_KEY)) {
                $range.nextAll().find('br:only-child').parent().remove();
                delHeight = c.$iframe.height();
                c.$iframe.height(c.minHeight); // Force recalc of scrollHeight
            }

            height = c.$iframe.height();
            scrollHeight = c.$body[0].scrollHeight;

            // Check if height reset is needed
            if (scrollHeight > c.minHeight && height < scrollHeight) {
                // Reset height
                c.$iframe.height(scrollHeight + 15);

                // Only scroll if cursor is at the bottom and user is typing
                var seHeight = c.$scrollElem.height(),
                    seTop = c.$scrollElem.scrollTop(),
                    raTop = $range.length && $range.offset().top || 0,
                    fTop = c.$iframe.offset().top,
                    belowthefold = (seHeight + seTop) < (fTop + raTop),
                    abovethetop = seTop > fTop + scrollHeight - c.topPadding,
                    newTop = seTop;

                // Scroll up if deleting and caret is above viewport
                if (delHeight && abovethetop) {
                    newTop = seTop + scrollHeight - delHeight;
                // Scroll down if caret is below viewport or user is interacting with the editor
                } else if (belowthefold || (!delHeight && (evt.type === 'keyup' || evt.type === 'paste'))) {
                    newTop = seTop + scrollHeight - height;
                }
                // Only scroll if needed
                if (Math.abs(seTop - newTop) > c.resizeScrollThreshold)
                    c.$scrollElem.scrollTop(newTop);
            }
        }
    };

    // these define our public api
    var methods = {
        resetDefaults: function() {
            $.fn.wysihtml5.defaultOptions = $.extend(true, {}, $.fn.wysihtml5.defaultOptionsCache);
        },
        bypassDefaults: function(options) {
            return this.each(function () {
                var $this = $(this);
                $this.data('wysihtml5', new Wysihtml5($this, options));
            });
        },
        shallowExtend: function (options) {
            var settings = $.extend({}, $.fn.wysihtml5.defaultOptions, options || {}, $(this).data());
            var that = this;
            return methods.bypassDefaults.apply(that, [settings]);
        },
        deepExtend: function(options) {
            var settings = $.extend(true, {}, $.fn.wysihtml5.defaultOptions, options || {});
            var that = this;
            return methods.bypassDefaults.apply(that, [settings]);
        },
        init: function(options) {
            var that = this;
            return methods.shallowExtend.apply(that, [options]);
        }
    };

    $.fn.wysihtml5 = function ( method ) {
        if ( methods[method] ) {
            return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.wysihtml5' );
        }
    };

    $.fn.wysihtml5.Constructor = Wysihtml5;

    var defaultOptions = $.fn.wysihtml5.defaultOptions = {
        "font-styles": true,
        "color": true,
        "emphasis": true,
        "link": true,
        "lists": true,
        "image": true,
        "html": true,
        "useLineBreaks": false,
        "enableAutoResize": true,
        "resizeScrollThreshold": 5,
        parserRules: {
            classes: {
                // (path_to_project/lib/css/wysiwyg-color.css)
                "wysiwyg-color-silver" : 1,
                "wysiwyg-color-gray" : 1,
                "wysiwyg-color-white" : 1,
                "wysiwyg-color-maroon" : 1,
                "wysiwyg-color-red" : 1,
                "wysiwyg-color-purple" : 1,
                "wysiwyg-color-fuchsia" : 1,
                "wysiwyg-color-green" : 1,
                "wysiwyg-color-lime" : 1,
                "wysiwyg-color-olive" : 1,
                "wysiwyg-color-yellow" : 1,
                "wysiwyg-color-navy" : 1,
                "wysiwyg-color-blue" : 1,
                "wysiwyg-color-teal" : 1,
                "wysiwyg-color-aqua" : 1,
                "wysiwyg-color-orange" : 1
            },
            tags: {
                "b":  {},
                "i":  {},
                "br": {},
                "ol": {},
                "ul": {},
                "li": {},
                "h1": {},
                "h2": {},
                "h3": {},
                "h4": {},
                "h5": {},
                "h6": {},
                "blockquote": {},
                "u": 1,
                "img": {
                    "check_attributes": {
                        "width": "numbers",
                        "alt": "alt",
                        "src": "url",
                        "height": "numbers"
                    }
                },
                "a":  {
                    check_attributes: {
                        'href': "url", // important to avoid XSS
                        'target': 'alt',
                        'rel': 'alt'
                    }
                },
                "span": 1,
                "p": 1,
                // to allow save and edit files with code tag hacks
                "code": 1,
                "pre": 1
            }
        },
        stylesheets: ["compiled/wysihtml5-styles.css"],
        locale: "en"
    };

    if (typeof $.fn.wysihtml5.defaultOptionsCache === 'undefined') {
        $.fn.wysihtml5.defaultOptionsCache = $.extend(true, {}, $.fn.wysihtml5.defaultOptions);
    }

    $.fn.wysihtml5.locale = {
        en: {
            font_styles: {
                normal: "Normal text",
                h1: "Heading 1",
                h2: "Heading 2",
                h3: "Heading 3",
                h4: "Heading 4",
                h5: "Heading 5",
                h6: "Heading 6"
            },
            emphasis: {
                bold: "Bold",
                italic: "Italic",
                underline: "Underline"
            },
            lists: {
                unordered: "Unordered list",
                ordered: "Ordered list",
                outdent: "Outdent",
                indent: "Indent"
            },
            link: {
                insert: "Insert link",
                cancel: "Cancel",
                target: "Open link in new window"
            },
            image: {
                insert: "Insert image",
                cancel: "Cancel"
            },
            html: {
                edit: "Edit HTML"
            },
            colours: {
                black: "Black",
                silver: "Silver",
                gray: "Grey",
                maroon: "Maroon",
                red: "Red",
                purple: "Purple",
                green: "Green",
                olive: "Olive",
                navy: "Navy",
                blue: "Blue",
                orange: "Orange"
            }
        }
    };

}(window.jQuery, window.wysihtml5);

