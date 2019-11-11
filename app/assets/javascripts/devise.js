$(function(){
  
  $("#checkbox").change(function(){
    if($(this).prop("checked")){
      $('#realText').show();
    }else{
      $('#realText').hide();
    }
  });
  $("#user_password").on("keyup", function(){ 
    let input= $("#user_password").val();
    $("#realText").val(input);  
  });
});
