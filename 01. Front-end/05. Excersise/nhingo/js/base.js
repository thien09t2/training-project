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

/* w3School Top button */

function knhFunction() {
    x.classList.toggle("fa-caret-up")
}