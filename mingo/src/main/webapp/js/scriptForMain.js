/**
 * 
 * 작성자 :홍동우
 * 
 */
$(document).ready(function(){
    
	/* 시도 타입 클릭시 시군구 리스트 동적으로 변경 ajax이용 */
	$('#sido_code').change(function(){
		var value = $('#sido_code option:selected').val();
		
		$('#sigungu_code').empty();
		$('#sigungu_code').append('<option value="-1">시/군/구</option>');
		
		$.ajax({
			url: 'getSigungu.do',
			//async: false,
			data: { sido_code : value },
			dataType : 'HTML',
		}).done(function(data){
			$('#sigungu_code').append(data);
		});
		
	});
	/* 시군구 타입 클릭시 행정동 리스트 동적으로 변경 ajax이용 */
	$('#sigungu_code').change(function(){
		
		var value = $('#sigungu_code option:selected').val();
		
		$('#dong_code').empty();
		$('#dong_code').append('<option value="-1">행정동</option>');
		
		$.ajax({
			url: 'getDong.do',
			//async: false,
			data: { sigungu_code : value },
			dataType : 'HTML',
		}).done(function(data){
			$('#dong_code').append(data);
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