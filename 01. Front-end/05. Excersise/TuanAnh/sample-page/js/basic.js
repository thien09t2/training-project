$(document).ready(function() {
    // cài đặt sự kiện
    setupEvent();
});
// cài đặt sự kiện
function setupEvent() {
    //show
    $("#show").click(function() {
        $(".image").fadeIn(2000);
    });
    //hide
    $("#hide").click(function() {
        $(".image").fadeOut(2000);
    });
    //toggle
    $("#toggle").click(function() {
        $(".image").fadeToggle(500);
    });
    $("#ft").change(function() {
        var x = parseFloat($(this).val());
        $(".image").fadeTo(500, x);

    });

}