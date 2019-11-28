
$(function(){
  var input_area = $('.dropzone-box');


  $(document).on('change', 'input[type= "file"].dropbox__input',function(event) {
    var new_input1 = $(`<input multiple= "multiple" name="item[images_attributes][1]][image]" class="dropbox__input1" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input1);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input1',function(event) {
    var new_input2 = $(`<input multiple= "multiple" name="item[images_attributes][2]][image]" class="dropbox__input2" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input2);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input2',function(event) {
    var new_input3 = $(`<input multiple= "multiple" name="item[images_attributes][3]][image]" class="dropbox__input3" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input3);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input3',function(event) {
    var new_input4 = $(`<input multiple= "multiple" name="item[images_attributes][4]][image]" class="dropbox__input4" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input4);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input4',function(event) {
    var new_input5 = $(`<input multiple= "multiple" name="item[images_attributes][5]][image]" class="dropbox__input5" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input5);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input5',function(event) {
    var new_input6 = $(`<input multiple= "multiple" name="item[images_attributes][6]][image]" class="dropbox__input6" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input6);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input6',function(event) {
    var new_input7 = $(`<input multiple= "multiple" name="item[images_attributes][7]][image]" class="dropbox__input7" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input7);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input7',function(event) {
    var new_input8 = $(`<input multiple= "multiple" name="item[images_attributes][8]][image]" class="dropbox__input8" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input8);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input8',function(event) {
    var new_input9 = $(`<input multiple= "multiple" name="item[images_attributes][9]][image]" class="dropbox__input9" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input9);
  });
  $(document).on('change', 'input[type= "file"].dropbox__input9',function(event) {
    var new_input10 = $(`<input multiple= "multiple" name="item[images_attributes][10]][image]" class="dropbox__input10" type="file" id="dropbox__input" >`);
    input_area.prepend(new_input10);
  });
});
