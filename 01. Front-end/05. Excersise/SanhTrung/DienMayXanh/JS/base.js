/**Choose Province */
$(document).ready(function () {
  $(".province__option").click(function () {
    $(".modal").css("display", "flex");
  });
});
/**Modal */
$(document).ready(function () {
  $(".btn-close").click(function () {
    $(".modal").css("display", "none");
    $(".btn-close").css("outline", "none");
    $(".btn-close").css("border", "0");
  });
});
/**Carousel */
$(".carousel").carousel({
  interval: 1000 * 5,
});
/**Slide show */
// var slideIndex = [1, 1];
// var slideId = ["mySlides"];
// showSlides(1, 0);
// showSlides(1, 1);

// function plusSlides(n, no) {
//   showSlides((slideIndex[no] += n), no);
// }

// function showSlides(n, no) {
//   var i;
//   var x = document.getElementsByClassName(slideId[no]);
//   if (n > x.length) {
//     slideId[no] = 1;
//   }
//   if (n < 1) {
//     slideId[no] = x.length;
//   }
//   for (i = 0; i < x.length; i++) {
//     x[i].style.display = "none";
//   }
//   x[slideIndex[no] - 1].style.display = "block";
// }
