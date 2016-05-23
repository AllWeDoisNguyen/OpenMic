// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var buttons;
buttons = function() {
    var $btnSets = $('#responsive'),
    $btnLinks = $btnSets.find('a');

    $btnLinks.click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.user-menu>div.user-menu-content").removeClass("active");
        $("div.user-menu>div.user-menu-content").eq(index).addClass("active");
    });
};

var tooltip;
tooltip = function() {
    $("[rel='tooltip']").tooltip();

    $('.view').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );
};

// Raty stuff here
function reviewRating() {
  $('.review-rating').raty({
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    },
    path: '/assets/'
  });
};
// <!-- this displays the star images for the average rating -->
function averageReviewRating() {
  $('.average-review-rating').raty({
    readOnly: true,
    path: '/assets/',
    score: function() {
      return $(this).attr('data-score')
    }
  });
};

function ratingForm() {
  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
};

// Raty stuff end

// Make JS available
$(document).on('page:load ready page:change', buttons);
$(document).on('page:load ready page:change', tooltip);
$(document).on('page:load ready page:change', reviewRating);
$(document).on('page:load ready page:change', averageReviewRating);
$(document).on('page:load ready page:change', ratingForm);
