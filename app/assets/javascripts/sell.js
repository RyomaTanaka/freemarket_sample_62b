$(function(){
  $(document).on('turbolinks:load', function(){
    var dropzone = $('.dropzone-area');
    var dropzone2 = $('.dropzone-area2');
    var images = [];
    var inputs = [];
    var input_area = $('.input_area');
    var preview = $('#preview');
    var preview2 = $('#preview2');
    
    // 新しい画像が投稿されるたびに処理が実行される
    $(document).on('change', 'input[type= "file"].upload-image',function(event) {
      // ファイル選択で最初に選択されたファイルをfile変数に入れている
      var file = $(this).prop('files')[0];

      // ファイルを取得する処理をreaderに定義している
      var reader = new FileReader();

      // inputs配列にinput[type= "file"]要素を入れている
      inputs.push($(this));

      // 画像を表示するhtmlを作っている
      var img = $(`<div class= "img_view">
                    <img width="114" height="114">
                    <div class= "btn_wrapper">
                      <div class="btn edit">
                        編集
                      </div>
                      <div class="btn delete">
                        削除
                      </div>
                    </div>
                  </div>`);

      // ファイルが正常に読み込まれたらimgで作ったhtmlのimg属性に画像を表示する
      reader.onload = function(e) {
        img.find('img').attr({ src: e.target.result });
      }

      // ファイルをurlとして読み込んでいるに変換している
      reader.readAsDataURL(file);
      
      // images配列にimgのhtmlを入れている
      images.push(img);
  
      // 画像が5枚以上かどうか判断している
      if(images.length >= 5) {
        dropzone.css({ 'display': 'none' })
        dropzone2.css({ 'display': 'block' })

        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview2.append(image);
          dropzone2.css({ 'width': `calc(100% - (135px * ${images.length - 5}))` })
        })
      } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        dropzone.css({ 'width': `calc(100% - (135px * ${images.length}))` })
      }

      if(images.length == 10) {
        dropzone2.css({ 'display': 'none' })
        return;
      }
      var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
      input_area.prepend(new_image);
    });


    $(document).on('click', '.delete', function() {
      var target_image = $(this).parent().parent();

      $.each(inputs, function(index, input){
        if ($(this).data('image') == target_image.data('image')){
          $(this).remove();
          target_image.remove();
          var num = $(this).data('image');
          images.splice(num, 1);
          inputs.splice(num, 1);
          if(inputs.length == 0) { $('input[type= "file"].upload-image').attr({ 'data-image': 0}) }
        }
      })

      $('input[type= "file"].upload-image:first').attr({ 'data-image': inputs.length })

      $.each(inputs, function(index, input) {
        var input = $(this)
        input.attr({ 'data-image': index })
        $('input[type= "file"].upload-image:first').after(input)
      })

      if (images.length >= 5) {
        dropzone2.css({ 'display': 'block' })
        dropzone2.css({ 'width': `calc(100% - (135px * ${images.length - 5}))` })
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview2.append(image);
        })
      } else {
        dropzone.css({'display': 'block'})
        dropzone.css({'width': `calc(100% - (135px * ${images.length}))`})
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
      }
      if(images.length == 4) {dropzone2.css({'display': 'none'})}
    })
  });
});