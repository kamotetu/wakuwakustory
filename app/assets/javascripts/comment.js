$(document).on('turbolinks:load', function() {
  
  function buildHTML(comment){
    var html = `<div class="story_show_comment_area" , id="story_show_comment_area_${comment.comment_id}">
                  <div class="show_user_image">
                    <img class="story_comment_user_icon" src=${comment.user_image} >
                  </div>
                  <div class="story_comment_area">
                    ${comment.user_name}:
                    <div class="story_comment_time">
                      ${comment.time}
                    </div>
                  </div>
                  <a class="story_comment_delete_link" id="${comment.comment_id}" data-remote="true" rel="nofollow" data-method="delete" href="/maintitles/${gon.maintitle_id}/stories/${gon.story_id}/comments/${comment.comment_id}">
                    削除
                  </a>
                  <br />
                  <div class="story_user_comment">
                    ${comment.comment}
                  </div>
                </div>`
    return html;
  }
  function buildHTML_no(comment){
    var html_no = `<div class="story_show_comment_area" , id="story_show_comment_area_${comment.comment_id}">
                  <div class="show_user_image">
                    <img class="story_comment_user_icon" src="/assets/no_avatar-773f182a0fc1786e5b53345bc3dd134bb85e6891ebe27050526e4529b14ee225.png" >
                  </div>
                  <div class="story_comment_area">
                    ${comment.user_name}:
                    <div class="story_comment_time">
                      ${comment.time}
                    </div>
                  </div>
                  <a class="story_comment_delete_link" id="${comment.comment_id}" data-remote="true" rel="nofollow" data-method="delete" href="/maintitles/${gon.maintitle_id}/stories/${gon.story_id}/comments/${comment.comment_id}">
                    削除
                  </a>
                  <br />
                  <div class="story_user_comment">
                    ${comment.comment}
                  </div>
                </div>`
    return html_no;
  }

  function buildCommentUp(story_comment) {
    var commentUpArea = $(".comment_count_area")
    var commentUp = `<i class="comment_count">
                      ${story_comment}
                    </i>`
    commentUpArea.append(commentUp);
  }

  var story_comment = gon.story_comment_count;
  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    $(".comment_count").remove();
    story_comment++;
    buildCommentUp(story_comment);
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      var html_no = buildHTML_no(data)
      if(data.user_image == null){
        $('#story_show_comment_content').prepend(html_no)
      }else{
        $('#story_show_comment_content').prepend(html)
      }
      
      $('.story_show_text_area').val('')
      $('.btn-primary').prop('disabled', false);
      $("html,body").animate({scrollTop:$('#new_comment').offset().top});
    })
    .fail(function(){
      alert('コメントを入力してください');
      $('.btn-primary').prop('disabled', false);
    })
  })
  
  $('.story_comment_delete_link').click(function(e) {
    e.preventDefault();
    var id = this.id
    var class_name = 'story_show_comment_area_' + id
    $('#' + class_name).remove();
    $(".comment_count").remove();
    story_comment--;
    buildCommentUp(story_comment);
  })
  $('#story_show_comment_content').on('click', '.story_comment_delete_link', function(e) {
    e.preventDefault();
    var id = this.id
    var class_name = 'story_show_comment_area_' + id
    $('#' + class_name).remove();
    $(".comment_count").remove();
    story_comment--;
    buildCommentUp(story_comment);


  })
});
