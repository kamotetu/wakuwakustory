// $(function() {
//   var $textarea = $('.input_story_new_form');
//   var lineHeight = parseInt($textarea.css('lineHeight'));
//   $textarea.on('input', function(evt) {
//     var lines = ($(this).val() + '\n').match(/\n/g).length;
//     $(this).height(lineHeight * lines);
//   });
//   console.log($textarea)
// });

// function coloeSet(argObj){
//     // ==============================================
//     //	入力済み時の背景色設定
//     // ==============================================
//        if(argObj.value==""){
//            argObj.style.backgroundColor = "";
//        }else{
//            argObj.style.backgroundColor = "rgba(30, 107, 185, 0.20)";
//        }
//    }
   
//    function colorReset(argObj){
//     // ==============================================
//     //	フォーカス時の背景色リセット
//     // ==============================================
//        argObj.style.backgroundColor = "";
//    }
   
//    function textAreaHeightSet(argObj){
//     // ==============================================
//     //	フォーカス時の背景色リセット
//     // ==============================================
//      // 一旦テキストエリアを小さくしてスクロールバー（縦の長さを取得）
//      argObj.style.height = "10px";
//      var wSclollHeight = parseInt(argObj.scrollHeight);
//      // 1行の長さを取得する
//      var wLineH = parseInt(argObj.style.lineHeight.replace(/px/, ''));
//      // 最低2行の表示エリアにする
//      if(wSclollHeight < (wLineH * 2)){wSclollHeight=(wLineH * 2);}
//      // テキストエリアの高さを設定する
//      argObj.style.height = wSclollHeight + "px";
//    }
   

$( document ).on('turbolinks:load',(function(){
    $('textarea').autosize();
  }));