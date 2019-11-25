$(function() {
  var input_area = $('.dropzone-box');

  // haitretu[0,1,2]

  // change

  // [1,2,3]

  // var = num
  $(document).on('change', 'input[type= "file"].dropbox__input',function(event) {
    var new_input = $(`<input multiple= "multiple" name="item[images_attributes][1][image]" class="dropbox__input" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input);
  });

});