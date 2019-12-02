$(function(){
  $('#arrow-top').hover(function(){
    
    $('.arrow').css({'display': 'block'});
  },(function(){
    $('.arrow').css({'display': 'none'})
    console.log(this)

    $('.arrow').hover(function(){
    $('.arrow').css({'display': 'block'}); 
  },(function(){
    $('.arrow').css({'display': 'none'})
    }));
  }));
});

