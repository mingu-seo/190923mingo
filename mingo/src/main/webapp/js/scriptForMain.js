/**
 * 
 * 작성자 :홍동우
 * 
 */
$(document).ready(function(){
	
	var option = $('option[value=-1]').attr('selected','selected');
	/* 시도 타입 클릭시 시군구 리스트 동적으로 변경 ajax이용 */
	$('#sido_code').change(function(){
		var value = $('#sido_code option:selected').val();
		$('.start1').nextAll().remove();
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
   
    
    
});
