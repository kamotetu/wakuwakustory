function appendFaThoumbsOUpMore(my_review_count) {
  var fa_thumbs_o_up_more = $(".review_my_count_area");
  var my_count_more = `<i class="my_count">
                        ${my_review_count}
                        </i>`
  fa_thumbs_o_up_more.append(my_count_more);
};

function appendFaThoumbsOUpAll(all_review_count) {
  var fa_thumbs_o_up_all = $(".review_all_count_area");
  var all_count = `<i class="all_count">
                        ${all_review_count}
                        </i>`
  fa_thumbs_o_up_all.append(all_count);
};

$(function() {
  $(document).on("ajax:success", ".like_review_btn", function(e) {
    e.preventDefault();
    $(".my_count").remove();
    $(".all_count").remove();
    var my_review_count = gon.my_review_count++ ;
    var all_review_count = gon.review_all_count++ ;
    appendFaThoumbsOUpMore(my_review_count);
    appendFaThoumbsOUpAll(all_review_count);
  });
});

function appendFaThoumbsOUpMoreAfterRemove(my_review_count_js) {
  var fa_thumbs_o_up_more = $(".review_my_count_area");
  var my_count_more = `<i class="my_count">
                        ${my_review_count_js}
                        </i>`
  fa_thumbs_o_up_more.append(my_count_more);
};

function appendFaThoumbsOUpAllAfterRemove(all_review_count_js) {
  var fa_thumbs_o_up_all = $(".review_all_count_area");
  var all_count = `<i class="all_count">
                        ${all_review_count_js}
                        </i>`
  fa_thumbs_o_up_all.append(all_count);
};


function appendLikeReviewBtn() {
  var like_review_area_new = $(".like_review_area");
  var like_review_btn_new = `<a class="like_review_btn_new" data-remote="true" rel="nofollow" data-method="post" href="/maintitles/${gon.maintitle_id}/stories/${gon.story_id}/like_review">
                              <div class="like_review_link">
                                <div class="like_review" id="${gon.maintitle_id}">
                                  面白かった数だけここをクリック！
                                </div>
                              </div>
                             </a>`
  like_review_area_new.append(like_review_btn_new);
};

$(function() {
  $(document).on("ajax:success", ".unlike_review_btn", function(e) {
    e.preventDefault();
    $(".my_count").remove();
    $(".all_count").remove();
    $(".like_review_btn").remove();
    $(".like_review_btn_new").remove();
    
    my_review_count_js = 0 ;
    all_review_count_js = gon.review_all_count - gon.my_review_count ;

    appendLikeReviewBtn();
    appendFaThoumbsOUpMoreAfterRemove(my_review_count_js);
    appendFaThoumbsOUpAllAfterRemove(all_review_count_js);

  });
});


  


// var my_review_count = 0;
// var all_review_count = gon.review_all_count ;
$(function() {
  $(document).on("ajax:success", ".like_review_btn_new", function(e) {
    e.preventDefault();
    $(".my_count").remove();
    $(".all_count").remove();
    // $(".like_review_btn").remove();
    
    
    my_review_count_js++;
    all_review_count_js++;
    
    console.log(my_review_count_js); 
    // appendLikeReviewBtn();
    appendFaThoumbsOUpMoreAfterRemove(my_review_count_js);
    appendFaThoumbsOUpAllAfterRemove(all_review_count_js);
    // review_reset();
  });
});