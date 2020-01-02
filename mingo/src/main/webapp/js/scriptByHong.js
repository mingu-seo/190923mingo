/**
 * 
 * 작성자 :홍동우
 * 
 */
$(document).ready(function () {
    //initialize swiper when document ready
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