// swiperを生成
var swiperMain = new Swiper('.swiper-container', {
  speed: 600,
  loop: true,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});

// slideToメソッドを実行する関数を定義
function slideThumb(index) {
	swiperMain.slideTo(index);
}