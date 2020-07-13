$(document).ready(function() {
    $(".local-nav .sup-menu").hover(function() {
        $(this).parent().find(".sub-menu").css("display", "flex");
    }, function() {
        $(this).parent().find(".sub-menu").css("display", "none");
    });

    $(".group-tabs .nav-tab-item .nav-link").on( "click", function(e) {
        e.preventDefault();
        var $parent = $(this).parent();
        if(!$parent.hasClass("active")) {
            $parent.siblings().removeClass("active");
            $parent.addClass("active");
            var tabContentId = $(this).attr("href");
            $(tabContentId).siblings().removeClass("active");
            $(tabContentId).addClass("active");
        }
    });

    
});