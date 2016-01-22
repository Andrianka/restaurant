//= require jquery.ui.totop.js

$(document).ready(function(){
  $("#notifications").find("button").click('on', function(){
    $(".modal#notifications").removeClass('in');
  });
  $(".bt-menu-trigger").click(function(){
    $('.bt-menu').toggleClass('bt-menu-open');
  });
  $( ".block1" ).mouseover(function() {
    $(this).addClass( "blur" );
  });
  $( ".block1" ).mouseout(function() {
    $(this).removeClass( "blur" );
  });
  $().UItoTop({ easingType: 'easeOutQuart' });
});
