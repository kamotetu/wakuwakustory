
$(document).on('turbolinks:load', function() {

  function buildHTML(comment){
    var html = `<div class="story_show_comment_area">
                  <div class="show_user_image">
                    <img class="story_comment_user_icon" src=${comment.user_image} >
                  </div>
                  <div class="story_comment_area">
                    ${comment.user_name}:
                  <div class="story_comment_time">
                    ${comment.time}
                  </div>
                  </div><br />
                  <div class="story_user_comment">
                    ${comment.comment}
                  </div>
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    console.log(formData)
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
      $('.story_show_comment_content').prepend(html)
      $('.story_show_text_area').val('')
      $('.btn-primary').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
      $('.btn-primary').prop('disabled', false);
    })
  })
});
