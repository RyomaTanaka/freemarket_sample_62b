$(function(){
  if (document.getElementById("token_submit") != null) {
    // 公開キーをセット
    Payjp.setPublicKey("pk_test_2d696b91fc98a607fd355936");
  
    // id:charge-form要素の中のid:token_submit要素がクリックされたらイベントを発火
    $("#charge-form").on("click", "#token_submit", function(e) {
      e.preventDefault();
  
      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      };
  
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          document.inputForm.submit();
        }
      });
    });
  }
});