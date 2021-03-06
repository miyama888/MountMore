$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: false,           // 自動スライド
    speed: 3000,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 3000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
    slideWidth: 1100,      // 各スライドの幅
	randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
    slideMargin: 0
  });
});