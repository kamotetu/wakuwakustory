// ジャンル
$(document).on('turbolinks:load', function(){
  $("#genre_area").hover(function() {
    $(this).children('ul').slideDown('fast');
  }, function() {
    $(this).children('ul').slideUp('fast');
  })
});

// 並び替え
$(document).on('turbolinks:load', function(){
  $("#order_area").hover(function() {
    $(this).children('ul').slideDown('fast');
  }, function() {
    $(this).children('ul').slideUp('fast');
  })
});