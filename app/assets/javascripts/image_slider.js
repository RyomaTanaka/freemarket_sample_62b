window.addEventListener('DOMContentLoaded', function() {
  var swiperImageMain = new Swiper ('.item-detail__contents .main', {
    loop: false,
  })

  var swiperImageThumb = new Swiper ('.item-detail__contents .thumbnail', {
    loop: false,
    centeredSlides: true,
    slidesPerView: 5,
    slideToClickedSlide: true,
  });
  swiperImageMain.params.control = swiperImageThumb;
  swiperImageThumb.params.control = swiperImageMain;
}, false);