$( document ).on('turbolinks:load', function() {  //turbolinksを指定しないと、画像アップしても反映されない時がある
  var signup_right_content = $(".signup_right_content");
  $(".input_my_image").change(function(){  //(".input_my_image"はfile_fieldのid,classを指定)
      readURL(this);
      // $("#signup_my_image_icon_preview").remove();  //これはプレビューと記述しているid,classを削除する記述
    });
  function readURL(input) {                  //ここから
      if (input.files && input.files[0]) {
        
      var reader = new FileReader();
      reader.onload = function (e) {         //ここまでは、呪文みたいなものだと覚える
        // var btn_wrapper = $(`<div class="btn_wrapper"><div class="btn delete">削除</div></div>`);

      $("#img_prev").attr({src: e.target.result,  //("#img_prev")は画像アップ後表示させたいiamge_tagなどのid,classを指定
                            width: '110px',   //表示させたい画像の大きさを指定
                            height: '110px'
                          });  //指定しない場合めちゃ大きくなる
      // $(".signup_my_image_area").append(btn_wrapper);
      }
      reader.readAsDataURL(input.files[0]);
      
      }
  }
  // $( document ).on('click', '.delete', function() {
  //   var target_image = $(this).parent().parent();
  //   console.log(target_image);

  //   $(function(index, input){
  //     if ($(this).data('image') == target_image.data('image')){
  //       $(this).remove();
  //       target_image.remove();
  //       var num = $(this).data('image');
  //       // images.splice(num, 1);
  //       // inputs.splice(num, 1);
  //       // if(inputs.length == 0) {
  //         $('input[type= "file"].upload-image').attr({
  //           'data-image': 0
  //         })
  //       // }
  //     }
  //   })
  //   // $(".btn_wrapper").remove();
  //   // $("#img_prev").remove();
  // });
  // function removeURL(input) {
  //   var html = (`<div class="signup_my_image_area_inner">
  //                 <p id="signup_my_image_icon_preview">プレビュー</p>
  //                 <%= image_tag "no_avatar.png", id: :img_prev %>
  //               </div>`)
  //   signup_right_content.append(html);
  // };
});
