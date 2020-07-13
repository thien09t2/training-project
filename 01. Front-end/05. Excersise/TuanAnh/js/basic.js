/*event open & close province */
$(document).ready(function() {
    $(".province").click(function() {
        $("#full-modal").css("display", "block");
    });
});

$(document).ready(function() {
    $(".close-modal").click(function() {
        $("#full-modal").css("display", "none");
    });
});
$(document).ready(function() {
    $(".accept").click(function() {
        $("#full-modal").css("display", "none");
    });
});