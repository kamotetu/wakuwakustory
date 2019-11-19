function appendLikeReviewBtnMore() {
  var like_review_area = $(".like_review_area");
  var like_review_btn_more = `<a class="like_review_btn" data-remote="true" rel="nofollow" data-method="post" href="/maintitles/${gon.maintitle_id}/like_review_more">
                                <div class="like_review_more_link">
                                  <div class="like_review_more" id="${gon.maintitle_id}">
                                    面白かった数だけクリック！
                                  </div>
                                </div>
                              </a>`
  like_review_area.append(like_review_btn_more);
};

$(function() {
  $(document).on("ajax:success", ".like_review_btn", function(e) {
    e.preventDefault();
    
      $('.like_review_btn').remove();
      appendLikeReviewBtnMore();
  });
});