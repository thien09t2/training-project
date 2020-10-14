// For dmx-----------------
$(document).ready(function () {
    $("#info").on( "mouseenter", function(e) {
        e.preventDefault();
        $("#show-hide").removeClass("fa-caret-down");
        $("#show-hide").addClass("fa-caret-up");

    });
    $("#info").on( "mouseleave", function(e) {
        e.preventDefault();
        $("#show-hide").removeClass("fa-caret-up");
        $("#show-hide").addClass("fa-caret-down");
    });

    $(".side-navbar .sup-menu").hover(function () {
        $(this).parent().find(".sub-menu").css("display", "flex");
        $(this).parent().find(".sub-menu:before").css("display", "flex");
    }, function () {
        $(this).parent().find(".sub-menu").css("display", "none");
    });

    $(".group-tabs .nav-tab-item .nav-link").on("click", function (e) {
        e.preventDefault();
        var $parent = $(this).parent();
        if (!$parent.hasClass("active")) {
            $parent.siblings().removeClass("active");
            $parent.addClass("active");
            var tabContentId = $(this).attr("href");
            $(tabContentId).siblings().removeClass("active");
            $(tabContentId).addClass("active");
        }
    });

    var $videoPlayer = $(".vid-player-modal .vid-player-body .vid-player");
    $('.btn-play').click(function (e) {
        e.preventDefault();
        let youtubeUrl = $(this).data("youtube-url");
        if (youtubeUrl) {
            $videoPlayer.empty();
            $videoPlayer.append("<iframe width='100%' height='100%' src='" + youtubeUrl + " '" +
                "frameborder='0' allowfullscreen=''></iframe>");
            $(".vid-player-modal").removeClass("d-none");
        }
    });

    $(".vid-player-modal").on("click", ".close-btn", function () {
        $(".vid-player-modal").addCLass("d-none");
        $videoPlayer.empty();
    });
    $("body").on("click", ".vid-player-modal:not(.vid-player-body)," +
        ".vid-player-modal:not(.vid-player)", function () {
        $(".vid-player-modal").addClass("d-none");
        $videoPlayer.empty();
    });


});
/* w3School Top button */
// Get the Button:
var mybutton = document.getElementById("myTopBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; //for Safari
    document.documentElement.scrollTop = 0; //Chrome, IE, ...
}


