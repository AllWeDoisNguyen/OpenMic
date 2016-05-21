var jumbotronIcons = function() {
  $('.bounce-on-hover').hover(function() {
    var containerDiv = $(this);
    containerDiv.addClass('animation-target');
  }, function() {
    var containerDiv = $(this);
    containerDiv.removeClass('animation-target');
  });
};

$(document).ready(jumbotronIcons);
$(document).on('page:load', jumbotronIcons);
