// var url = location.href
// console.log(url);
  


// $(document).on('turbolinks:load', function() {
  if(document.URL.match("/post_list")) {
    //指定する文字列がURLに含まれる場合に実行する内容
    var favorite = gon.all_favorite;
  }
  
// });
  // favorite = gon.all_favorite
  function appendUnLikeArea() {
    var favorite_area = $(".favorite_area");
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
    var favorite_area = $(".favorite_area");
    var unlike_area = `<a class="favorite_btn" data-remote="true" href="/maintitles/fav/${gon.maintitle_id}", remote: :true>
                        <div class="like_area">
                          <div class="like", id="${gon.maintitle_id}">
                            お気に入り
                          </div>
                        </div>
                      </a>`
  favorite_area.append(unlike_area);
  };
  
  function appendFavorite(favorite) {
    var heart = $(".fa-heart-o");
    var favorite = `<i class="posli_all_favorite">
                      ${favorite}
                    </i>`
    return heart.append(favorite);
  };

  
  $(function() {
    $(document).on("ajax:success", ".favorite_btn", function(e) {
      e.preventDefault();
      
      
      if ($('#' + e.detail[0]).hasClass('like')) {
        // favorite = gon.all_favorite;
        $('.like_area').remove();
        appendUnLikeArea();
        $('.posli_all_favorite').remove();
        favorite ++;
        appendFavorite(favorite);
        
        $('.posli_all_favorite').css({'font-family':"'M PLUS Rounded 1c', sans-serif"});
        // $('#' + e.detail[0]).removeClass('like').addClass('unlike');
      } else {
        $('.unlike_area').remove();
        appendFavoriteArea();
        $('.posli_all_favorite').remove();
        // favorite = gon.all_favorite;
        if (favorite == 0){
          favorite = 0
        }else {
          favorite --
        };
        // favorite = favorite - 1;

        appendFavorite(favorite);
        $('.posli_all_favorite').css({'font-family':"'M PLUS Rounded 1c', sans-serif"});
    // $('#' + e.detail[0]).removeClass('unlike').addClass('like');
      }
    });
  });
// });
