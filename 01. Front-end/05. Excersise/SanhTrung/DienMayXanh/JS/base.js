/**Choose Province */
$(document).ready(function () {
  $(".province__option").click(function () {
    $(".modal").css("display", "flex");
  });
  /**Modal */
  $(".btn-close").click(function () {
    $(".modal").css("display", "none");
    $(".btn-close").css("outline", "none");
    $(".btn-close").css("border", "0");
  });
  /**Group promotion*/
  $(".group-promo-tabs .nav-tab-item .nav-link").on("click", function (e) {
    e.preventDefault();
    var $paren = $(this).parent();
    if (!$paren.hasClass("active")) {
      $paren.siblings().removeClass("active");
      $paren.addClass("active");
      var tabContentId = $(this).attr("href");
      $(tabContentId).siblings().removeClass("active");
      $(tabContentId).addClass("active");
    }
  });
});

/**Modal */
// $(document).ready(function () {
//   $(".btn-close").click(function () {
//     $(".modal").css("display", "none");
//     $(".btn-close").css("outline", "none");
//     $(".btn-close").css("border", "0");
//   });
// });
/**Carousel */
$(".carousel").carousel({
  interval: 1000 * 5,
});
