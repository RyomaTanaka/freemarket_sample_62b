$(function(){
  if (/.*edit.*/.test(location.pathname)) {
    $(document).on('turbolinks:load', function(){
      let dropzone = $('.dropzone-area');
      let dropzone2 = $('.dropzone-area2');
      let preview = $('#preview');
      let preview2 = $('#preview2');
      let input_area = $('.input_area');
      let hidden_area = $('.hidden_area');
      let images = [];
      let inputs = [];

      const createHtml = (imagesLength) => {
        if(imagesLength <= 5) {
          preview.empty();
          dropzone.css({'display':'block'});
          dropzone2.css({'display': 'none'});
          if(imagesLength === 0){dropzone.css({'width':'100%'})};
          $.each(images, function(index, image) {
            image.attr('data-image', index);
            preview.append(image);
          });
          dropzone.css({ 'width': `calc(100% - (121px * ${imagesLength}))` });
          if(imagesLength === 5){
            dropzone.css({'display': 'none'})
            dropzone2.css({'display': 'block'})
            dropzone2.css({'width':'100%'})
          }
        } else {
          preview.empty();
          preview2.empty();
          dropzone.css({'display': 'none'});
          dropzone2.css({'display': 'block'});
          $.each(images, function(index, image) {
            image.attr('data-image', index);
            if(image.data('image') >= 5){
              preview2.append(image);
              dropzone2.css({ 'width': `calc(100% - (121px * ${imagesLength - 5}))` });
            } else {
              preview.append(image);
              dropzone.css({ 'width': `calc(100% - (121px * ${imagesLength}))` });
            }
          });
          if(imagesLength == 10) {
            dropzone2.css({ 'display': 'none' })
            return;
          }
        }
      }


      $.each(gon.item_images_binary_datas, function(index, binary) {
        let img = $(`<div class= "img_view">
                        <img width="114" height="114">
                        <div class= "btn_wrapper">
                          <div class="btn edit">
                          編集
                          </div>
                          <div class="btn delete2">
                          削除
                          </div>
                        </div>
                      </div>`);
        img.find('img').attr({src: "data:image/jpeg;base64," + binary});
        img.attr('data-image', index);
        images.push(img)
        // console.log(images[index].find('img').attr('src'))
      })


      createHtml(images.length)

      $(document).on('click', '.delete2', function() {
        // console.log(gon.item_images_binary_datas.length);
        let delete_image = $(this).parent().parent();

        images.some(function(image, index){
          if (image.data('image') == delete_image.data('image')){
            images.splice(index, 1);
          }
        })

        console.log(gon.item_images_binary_datas.length)
        console.log(delete_image.find('img').attr('src'))
        // gon.item_images_binary_datas.som(function(binary, index){
        //   if(binary == delete_image.find('img').attr('src')){
        //     gon.item_images_binary_datas.splice(index, 1)
        //   }
        // })
        $.each(gon.item_images_binary_datas, function(index, binary){
          if("data:image/jpeg;base64," + binary == delete_image.find('img').attr('src')){
            gon.item_images_binary_datas.splice(index, 1);
            // alert('ビンゴ！')
          }
        })

        console.log(gon.item_images_binary_datas.length)

        createHtml(images.length);
        // console.log(gon.item_images_binary_datas.length);
      })

      $(document).on('change', 'input[type= "file"].upload-image',function() {
        let file = $(this).prop('files')[0];
        let reader = new FileReader();
        let img = $(`<div class= "img_view">
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
        inputs.push($(this));
        reader.readAsDataURL(file);
        reader.onload = function(e){img.find('img').attr({ src: e.target.result })};
        images.push(img);
        createHtml(images.length);
        let new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
        input_area.prepend(new_image);
      });

      $(document).on('click', '.delete', function() {
        let delete_target_image = $(this).parent().parent();
        $.each(inputs, function() {
          if($(this).data('image') == delete_target_image.data('image')){
            $(this).remove();
            delete_target_image.remove();
            let num = $(this).data('image');
            images.splice(num, 1);
            inputs.splice(num, 1);
            if(inputs.length == 0) { $('input[type= "file"].upload-image').attr({ 'data-image': 0}) }
          }
        })
        createHtml(images.length);
      })

      $('.sell-btn').on('click', function(){
        $.each(gon.item_images_binary_datas, function(index, binary){
          let hidden_image = $(`<input name="image_already[]" type="hidden">`).val(binary);
          hidden_area.append(hidden_image);
        })
        // $('.hidden').value = gon.item_images_binary_datas;
      })
    });
  }
});