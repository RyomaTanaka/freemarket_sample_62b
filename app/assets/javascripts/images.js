window.addEventListener('DOMContentLoaded', function() {
  var swiper06Main = new Swiper ('.sample06 .main', {
    pagination: '.swiper-pagination',
    paginationClickable: true,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    spaceBetween: 10,
  })

  var swiper06Thumb = new Swiper('.sample06 .thumbnail', {
    spaceBetween: 10,
    centeredSlides: true,
    slidesPerView: 4,
    slideToClickedSlide: true
  });
  swiper06Main.params.control = swiper06Thumb;
  swiper06Thumb.params.control = swiper06Main;
}, false);