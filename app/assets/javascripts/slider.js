document.addEventListener("turbolinks:load", function(){
  let mySwiper = new Swiper ('.swiper-container', {
    effect: "slide",
    loop: true,
    pagination: '.swiper-pagination',
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
  })
});