/**
 * 
 */
$(document).ready(function () {

    var $button = $('#add');
    var $grid = $('.grid').masonry({
        itemSelector: '.grid-item'

    });

    $button.click(function () {
        var $items = getItems();
        $grid.masonryImagesReveal($items);
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
        // .progress(function (imgLoad, image) {
        //     // get item
        //     // image is imagesLoaded class, not <img>, <img> is image.img
        //     var $item = $(image.img).parents(itemSelector);
        //     // un-hide item
        //     $item.show();
        //     // masonry does its thing
        //     msnry.appended($item);
        // });
        .always(function(){
            $items.show();
            $('#test').removeClass('spinner-border text-primary');
            $('#test').parent().removeClass('is-loading');
            msnry.appended($items);
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
    $(window).scroll(function () {

        if ($(window).scrollTop() + 1 >= $(document).height() - $(window).height()) {
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
/* 평점순으로 카페검색 정렬 */

function listByScore(sido_code, sigungu_code, dong_code, name){

	$('.grid').empty();
	$.ajax({  
		url: 'listByScore.do',
		//async: false,
		data: { sido_code : sido_code,
				sigungu_code : sigungu_code,  
				dong_code : dong_code,
				name : name},  
		dataType : 'HTML',
	}).done(function(data){
		data = data.trim();
		$('.grid').append(data);  
	});
	
}
