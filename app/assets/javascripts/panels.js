var comPanels = function() {
  var timed_actions
  $('.comedian-hover-box').hover(function() {
    var comedianHoverBox = $(this)
    // On MouseOver Actions for Comedian Panels
    comedianHoverBox.addClass('col-lg-5 comedian-panel-container-outer-hover')
      .removeClass('col-lg-2 comedian-panel-container-outer');
    comedianHoverBox.find('.comedian-panel-container-body')
      .addClass('comedian-panel-container-body-hover')
      .removeClass('comedian-panel-container-body');
    comedianHoverBox.find('.comedian-panel-container-inner')
      .addClass('comedian-panel-container-inner-hover')
      .removeClass('comedian-panel-container-inner');
    comedianHoverBox.find('.comedian-panel-body-line')
      .addClass('comedian-panel-body-line-hover')
      .removeClass('comedian-panel-body-line')
    comedianHoverBox.find('panel-image')
      .addClass('panel-image-hover')
      .removeClass('panel-image')
    timed_actions = window.setTimeout(function() {
      comedianHoverBox.find('.hidden')
        .removeClass('hidden')
        .addClass('was-hidden');
    }, 1200);
  }, function() {
    var comedianHoverBox = $(this)

    // On MouseLeave Actions for Comedian Panels
    comedianHoverBox.find('.was-hidden')
      .removeClass('was-hidden')
      .addClass('hidden');
    comedianHoverBox.removeClass('col-lg-5 comedian-panel-container-outer-hover')
      .addClass('col-lg-2 comedian-panel-container-outer');
    comedianHoverBox.find('.comedian-panel-container-body-hover')
      .removeClass('comedian-panel-container-body-hover')
      .addClass('comedian-panel-container-body');
    comedianHoverBox.find('.comedian-panel-container-inner-hover')
      .removeClass('comedian-panel-container-inner-hover')
      .addClass('comedian-panel-container-inner');
    comedianHoverBox.find('.comedian-panel-body-line-hover')
      .addClass('comedian-panel-body-line')
      .removeClass('comedian-panel-body-line-hover')
    comedianHoverBox.find('panel-image-hover')
      .addClass('panel-image')
      .removeClass('panel-image-hover')

    window.clearTimeout(timed_actions);
  });
};

$(document).ready(comPanels);
$(document).on('page:load', comPanels);
