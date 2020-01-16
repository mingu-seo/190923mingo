/**
 * 
 * 작성자 :홍동우
 * 
 */
$(document).ready(function(){
    
	/* 시도 타입 클릭시 시군구 리스트 동적으로 변경 ajax이용 */
	$('#sido-type').change(function(){
		
		var value = $('#sido-type option:selected').val();
		
		$('#sigungu-type').empty();
		$('#sigungu-type').append('<option>시/군/구</option>');
		
		$.ajax({
			url: 'getSigungu.do',
			//async: false,
			data: { sido_code : value },
			dataType : 'HTML',
		}).done(function(data){
			$('#sigungu-type').append(data);
		});
		
	});
	/* 시군구 타입 클릭시 시군구 리스트 동적으로 변경 ajax이용 */
	$('#sigungu-type').change(function(){
		
		var value = $('#sigungu-type option:selected').val();
		
		$('#dong-type').empty();
		$('#dong-type').append('<option>행정동</option>');
		
		$.ajax({
			url: 'getDong.do',
			//async: false,
			data: { dong_code : value },
			dataType : 'HTML',
		}).done(function(data){
			$('#dong-type').append(data);
		});
		
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
    
    
});