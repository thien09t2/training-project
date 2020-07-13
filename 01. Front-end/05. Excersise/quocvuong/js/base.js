$(document).ready(function() {
    $(".danhmuc .dropdown-menu").hover(function() {
        $(this).parent().find(".sub-menu").css("display", "flex");
    }, function() {
        $(this).parent().find(".sub-menu").css("display", "none");
    });
});