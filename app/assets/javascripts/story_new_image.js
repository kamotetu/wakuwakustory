$( document ).on('turbolinks:load', function() {  //turbolinksを指定しないと、画像アップしても反映されない時がある
  // var signup_right_content = $(".signup_right_content");
  $(".input_story_file_btn").change(function(){  //(".input_my_image"はfile_fieldのid,classを指定)
      readURL(this);
      // $("#signup_my_image_icon_preview").remove();  //これはプレビューと記述しているid,classを削除する記述
    });
  function readURL(input) {                  //ここから
      if (input.files && input.files[0]) {
        
      var reader = new FileReader();
      reader.onload = function (e) {         //ここまでは、呪文みたいなものだと覚える
        // var btn_wrapper = $(`<div class="btn_wrapper"><div class="btn delete">削除</div></div>`);

      $(".story_file_view_image").attr({src: e.target.result,  //("#img_prev")は画像アップ後表示させたいiamge_tagなどのid,classを指定
                            width: 'auto',   //表示させたい画像の大きさを指定
                            height: '100%'
                          });  //指定しない場合めちゃ大きくなる
      // $(".signup_my_image_area").append(btn_wrapper);
      }
      reader.readAsDataURL(input.files[0]);
      
      }
  }

});