//= require 'semantic'

$(document)
  .ready(function() {

    // fix menu when passed
    $('.masthead .ui.menu')
      .visibility({
        once: false,
        onBottomPassed: function() {
          $('.fixed.menu').transition('fade in');
        },
        onBottomPassedReverse: function() {
          $('.fixed.menu').transition('fade out');
        }
      })
    ;

    // create sidebar and attach to menu open
    $('.ui.sidebar')
      .sidebar('attach events', '.toc.item')
    ;

    $('.tabular.activity_list .item').tab();

    $('.ui.embed').embed();
  })
;
