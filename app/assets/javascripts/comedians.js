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

$(document).ready(buttons);
$(document).on('page:load', buttons);
$(document).ready(tooltip);
$(document).on('page:load', tooltip);
