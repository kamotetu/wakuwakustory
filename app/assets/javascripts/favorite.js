
// $(document).on('turbolinks:load', function() {
  function appendUnLikeArea() {
    var favorite_area = $(".favorite_area")
    var unlike_area = `<a class="favorite_btn" data-remote="true" href="/maintitles/fav/${gon.maintitle_id}", remote: :true>
                        <div class="unlike_area">
                          <div class="unlike", id="${gon.maintitle_id}">
                            お気に入り解除
                          </div>
                        </div>
                      </a>`
  favorite_area.append(unlike_area);
  };

  function appendFavoriteArea() {
    var favorite_area = $(".favorite_area")
    var unlike_area = `<a class="favorite_btn" data-remote="true" href="/maintitles/fav/${gon.maintitle_id}", remote: :true>
                        <div class="like_area">
                          <div class="like", id="${gon.maintitle_id}">
                            お気に入り
                          </div>
                        </div>
                      </a>`
  favorite_area.append(unlike_area);
  };
  
  $(function() {
    $(document).on("ajax:success", ".favorite_btn", function(e) {
      e.preventDefault();
      
      
      if ($('#' + e.detail[0]).hasClass('like')) {
        $('.like_area').remove();
        appendUnLikeArea();
        
        // $('#' + e.detail[0]).removeClass('like').addClass('unlike');
      } else {
        $('.unlike_area').remove();
        appendFavoriteArea();
    // $('#' + e.detail[0]).removeClass('unlike').addClass('like');
      }
    });
  });
// });
