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
