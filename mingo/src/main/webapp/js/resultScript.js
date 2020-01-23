

var $grid;
$(document).ready(function () {
	
	var $button = $('#add');
	if( page >= maxPage){
		$button.hide();
	}
	$grid = $('.grid').masonry({
	        itemSelector: '.grid-item'

	});
	
	
    $button.click(function () {
    	getCafeItems();
        
    });
    
    $(window).scroll(function () {

        if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
            $button.trigger('click');
        }
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
function getItems() {
    var items = '';
    for (var i = 0; i < 8; i++) {
        items += getItem();
    }
    return $(items);
    
}
function getItem() {
    var size = Math.random() * 3 + 1;
    var width = Math.random() * 110 + 100;
    width = Math.round(width * size);
    var height = Math.round(140 * size);
    var rando = Math.ceil(Math.random() * 1000);
    // 10% chance of broken image src
    // random parameter to prevent cached images
    /*이미지 제공 사이트 주소 */
    var src = rando < 100 ? '//foo/broken-' + rando + '.jpg' :
        // use lorempixel for great random images
        'http://lorempixel.com/' + width + '/' + height + '/' + '?' + rando;
    /* placehold 주소 */
    var src2 = 'http://placehold.it/500x280';
    var src3 = 'https://picsum.photos/'+width+'/'+height;
    var src4 = '/img/cafe.jpg';
    var item = '<div class="grid-item"><div class="cafe cafe-img">';
    
    item += '<img src="' + src2 + '"></div>';
    item += '<div class="cafe cafe-name">스타벅스 자양2점</div>';
    item += '<div class="cafe cafe-address">서울시 광진구 자양 3동</div>';
    item += '<div class="cafe cafe-score">평점 3.9</div></div>';


    return item;
}
function getCafeItems(){
	//테스트용 로그 찍기
	
	if( ++page <= maxPage){
		var items = '';
		$.ajax({
			url: 'searchCafeAjax.do?',
			data: { sido_code : sido_code,
							sigungu_code : sigungu_code,
							dong_code : dong_code,
							name : name,
							page : page},
							//filter_type : type},
			dataType : 'HTML',
		}).done(function(data){
			if( page == maxPage){
				$('#add').hide();
			}
			data = data.trim();
			items += data;
			$grid.masonryImagesReveal($(items));
		});
		
		 //페이지수 하나 증가
	}
}
function listByFilter(type,obj){
	
	//버튼 활성화 되어있을시 호출 안함
	if( $(obj).hasClass('active')){
		return false;
	//검색결과가 1건 이하면 정렬 안함
	}else if( listCount <= 1){
		return false;
	}else{
		var type = type;
		var items='';
		
		//$('.grid').empty();
		$.ajax({
			url: 'searchCafeAjax.do?',
			data: { sido_code : sido_code,
							sigungu_code : sigungu_code,
							dong_code : dong_code,
							name : name,
							page : 1,
							filter_type : type},
			dataType : 'HTML',
		}).done(function(data){
			data = data.trim();
			items += data;
			$grid.masonry('remove', $grid.children());
		    $grid.masonryImagesReveal($(items));
		    
			
			//$('.grid').append(data);
		});
	}
}
