var Programme = {
  init: function(){
    $.each($('.venue_col'), function( index, value ) {
      var venueCol = $(this);
      var maxLeftPosition = 0;
      $.each(venueCol.children('.session'), function(index, session) {
        if ($(session).position().left > maxLeftPosition) {
          maxLeftPosition = $(session).position().left;
        }
      });
      venueCol.width(maxLeftPosition + 150);
      venueCol.find('.col_title').width(maxLeftPosition + 150);
    });
    var width = 0;
    $.each($('.venue_col'), function( index, value ) {
      width += $(this).width();
    });
    width += 300; // A random number to make it wide enough!
    $('#prog_wrapper .venue_cols').width(width);
    Programme.minLeft = -width;
    $('.session').hover(
      function(){
        $('#prog_wrapper .session_hover').hide()
        $(this).children('.session_hover').show();
      },
      function(){
        $(this).children('.session_hover').hide();
      }
    );
    $('.session').mousemove(function(e){
        var sessPos = $(this).offset();
        var colPos = $(this).parents('.venue_col').position().left + $(this).parents('.venue_cols').position().left;
        if(colPos <= 480){
          $(this).children('.session_hover').css('left',(e.pageX - sessPos.left) + 15);
        } else {
          $(this).children('.session_hover').css('right',155 - (e.pageX - sessPos.left - 15));
        }
       $(this).children('.session_hover').css('top',(e.pageY - sessPos.top) + 15);
    });
    if(!(navigator.platform == 'iPad' || navigator.platform == 'iPhone' || navigator.platform == 'iPod')){
      $('.programme_list_item').hover(
        function(){$(this).children('.tags').addClass('hover');},
        function(){$(this).children('.tags').removeClass('hover');
      });
    }
  },
  scroll: function(right) {
    var newLeft = (right ? Programme.left - 160 : Programme.left + 160)
    if((newLeft >= Programme.minLeft) && (newLeft <= 0 )){
      $('.venue_cols').animate({'left':newLeft});
      Programme.left = newLeft;
      switch(newLeft){
        case 0:$('.prog_arrow_left').removeClass('active_arrow');$('.prog_arrow_right').addClass('active_arrow');break;
        case Programme.minLeft:$('.prog_arrow_right').removeClass('active_arrow');$('.prog_arrow_left').addClass('active_arrow');break;
        default:$('.prog_arrow').addClass('active_arrow');break;
      }
    }
  },
  left: 0
};
