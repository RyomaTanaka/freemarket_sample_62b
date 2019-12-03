$(function(){
  $('#item_cost_burden').change(function() {
    var method = $("#item_cost_burden").value;
    if (method != "---") {
        $("#method").fadeIn();
    }else{
      $("#method").fadeOut();
    }
  });
});