
$(document).on('turbolinks:load', function() {
  
  function buildHTML(comment) {
    var html = `<div class="like_area">
                  <%= link_to "お気に入り", maintitle_like_path(@maintitle),method: :post, class: :favorite_btn, id: :favorite_like_btn %>
                </div>`
  }
  $('#favorite_like_btn').on('click', function() {
    
  })

});
