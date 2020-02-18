/**
 * 
 * 작성자 :홍동우

 * 
 */

var $grid;  
$(document).ready(function(){
	//디버깅용 변수
	//var sido_code=-1;
	//var sigungu_code=-1;
	//var dong_code=-1;
	listByFilter2(1,null);
	showSlides(slideIndex);
	/* 툴팁을 위한 초기화 */
	$('[data-toggle="tooltip"]').tooltip();
	
	/* masonry 객체 생성 */
	$grid = $('.grid').masonry({
        itemSelector: '.grid-item'

	});
	
	var option = $('option[value=-1]').attr('selected','selected');
	/* 시도 타입 클릭시 시군구 리스트 동적으로 변경 ajax이용 */
	$('#sido_code').change(function(){
		var value = $('#sido_code option:selected').val();
		$('.start1').nextAll().remove();
		$('.start2').nextAll().remove();
		$.ajax({
			url: 'getSigungu.do',
			async: false,
			data: { sido_code : value },
			dataType : 'HTML',
		}).done(function(data){
			data = data.trim();
			$('#sigungu_code').append(data);
		});
		
		
	});
	
	/* 시군구 타입 클릭시 행정동 리스트 동적으로 변경 ajax이용 */
	$('#sigungu_code').change(function(){
		
		var value = $('#sigungu_code option:selected').val();
		$('.start2').nextAll().remove();
		$.ajax({
			url: 'getDong.do',
			//async: false,
			data: { sigungu_code : value },
			dataType : 'HTML',
		}).done(function(data){
			data = data.trim();
			$('#dong_code').append(data);
		});
		
	});
	
	$('#dong_code').change(function(){
		var value = $('#dong_code option:selected').val();
		
	});
	
    var mySwiper = new Swiper('.swiper-container', {
        // Optional parameters
        loop: true,

        // If we need pagination
        pagination: {
            el: '.swiper-pagination',
        },  

        // Navigation arrows
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        }
    });
    
    /* 디버깅용 출력 함수 */
    function print(){
    	console.log("시도:"+sido_code+", 시군구:"+sigungu_code+", 동:"+dong_code);
    }
    
    
});
$.fn.masonryImagesReveal = function ($items) {
    var msnry = this.data('masonry');
    var itemSelector = msnry.options.itemSelector;
    // hide by default
    $items.hide();
    $('#test').addClass('spinner-border text-primary');
    $('#test').parent().addClass('is-loading');
    
    // append to container
    this.append($items);
    $items.imagesLoaded()
    .always(function(){
        $items.show();
        $('#test').removeClass('spinner-border text-primary');
        $('#test').parent().removeClass('is-loading');
        msnry.appended($items);
        msnry.layout();
    });

    return this;
};
function listByFilter2(type,obj){
	
	//버튼 활성화 되어있을시 호출 안함
	if( $(obj).hasClass('active')){
		return false;
	}else{
		var type = type;
		var items='';
		
		//$('.grid').empty();
		$.ajax({
			url: 'rankCafeAjax.do?',
			data: { filter_type : type},
			dataType : 'HTML',
		}).done(function(data){
			data = data.trim();
			items += data;
			
			$grid.masonry('remove', $grid.children());
		    $grid.masonryImagesReveal($(items));
		    
			//$('.grid').children().remove();
			//$('.grid').append($(items));
			
		});
		
	}
}

/* 리뷰 슬라이드를 위한 함수 */
var slideIndex = 1;


function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  slides[slideIndex-1].style.display = "block";  
}
