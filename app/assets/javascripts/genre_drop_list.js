
$(document).on('turbolinks:load', function(){
  $("#genre_area").hover(function() {
    $(this).children('ul').slideDown('fast');
  }, function() {
    $(this).children('ul').slideUp('fast');
  })
});