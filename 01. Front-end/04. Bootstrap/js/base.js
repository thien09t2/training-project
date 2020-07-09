$(document).ready(function() {
    $(".local-nav .sup-menu").hover(function() {
        $(this).parent().find(".sub-menu").css("display", "flex");
    }, function() {
        $(this).parent().find(".sub-menu").css("display", "none");
    });
});