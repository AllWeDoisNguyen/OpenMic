$(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    $('[data-toggle="tooltip"]').tooltip();


// Demo code beg
    $('button').click(function(e) {
        e.preventDefault();
        alert("This is a demo.\n :-)");
    });
// Demo code end

});

$(document).ready(function() {
  $('.comedian-hover-box').hover(function() {
      // On MouseOver Actions for Comedian Panels
      $(this).addClass('col-lg-5 comedian-panel-container-outer-hover')
      .removeClass('col-lg-2 comedian-panel-container-outer');
      $(this).find('.comedian-panel-container-body')
        .addClass('comedian-panel-container-body-hover')
        .removeClass('comedian-panel-container-body');
      $(this).find('.comedian-panel-container-inner')
        .addClass('comedian-panel-container-inner-hover')
        .removeClass('comedian-panel-container-inner');
  }, function() {
      // On MouseLeave Actions for Comedian Panels
      $(this).removeClass('col-lg-5 comedian-panel-container-outer-hover')
      .addClass('col-lg-2 comedian-panel-container-outer');
      $(this).find('.comedian-panel-container-body-hover')
        .removeClass('comedian-panel-container-body-hover')
        .addClass('comedian-panel-container-body');
      $(this).find('.comedian-panel-container-inner-hover')
        .removeClass('comedian-panel-container-inner-hover')
        .addClass('comedian-panel-container-inner');
    });

});
