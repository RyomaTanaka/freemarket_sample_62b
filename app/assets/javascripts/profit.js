$(function(){
  $('#price_calc').on('input', function(){
    
    var data = $('#price_calc').val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    if( 300 <= data && data <= 9999999) {
    $('.fee-label__a ' ).html(fee)
    $('.fee-label__a  ').prepend('¥')
    $('.price-lists__profit__label__a ').html(profit)
    $('.price-lists__profit__label__a ').prepend('¥')
    $('#price').val(profit)
    }
    if(profit == '') {
    $('.price-lists__profit__label__a ').html('');
    $('.fee-label__a ').html('')
    
    }})
})