//リロードしなくてもjsが動くようにする
$(document).on('turbolinks:load', function(){
    $(document).on('keyup', '#form_search', function(e){
      e.preventDefault(); //キャンセル可能なイベントをキャンセル
      var preFunc;
      var preInput = "";
      var input = $.trim($(this).val());

      var ajaxPost = function(input){
        $.ajax({
            url: '/preference/search', //urlを指定
            type: 'GET', //メソッドを指定
            data: ('keyword=' + input), //コントローラーに渡すデータを'keyword=input(入力された文字のことですね)'にするように指定
            processData: false, //おまじない
            contentType: false, //おまじない
            dataType: 'json' //データ形式を指定
        })

        //ここから追記
      .done(function(data){
        //データを受け取ることに成功したら、dataを引数に取って以下のことする(dataには@usersが入っている状態ですね)
      $('#images_line').find('li').remove();  //idがresultの子要素のliを削除する
      $(data).each(function(i, user){ 
        //dataをuserという変数に代入して、以下のことを繰り返し行う(単純なeach文ですね)
        var html = '<li>';
        html += '<label class="panel_label">';
        html += '<img src="/assets/city/' + user.city_en + '.jpg">';
        html += '<p class="label_text">';
        html += user.city;
        html += '<input type="checkbox" value=' + user.city + ' name="answer[city][]" class="panel_form">'
        html += '</p>';
        html += '</label>';
        html += '</li>';
        
        $('#images_line').append(html); 
        
      });
    })
      }

      if (preInput !== input){
        // console.log(input);
        clearTimeout(preFunc);
        preFunc = setTimeout(ajaxPost(input), 500);
      }

      preInput = input;
    });
  });