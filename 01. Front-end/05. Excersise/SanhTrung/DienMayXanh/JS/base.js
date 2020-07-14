/**Choose Province */
$(document).ready(function () {
  $(".province__option").click(function () {
    $(".modal").css("display", "flex");
  });
});

$(document).ready(function () {
  $(".btn-close").click(function () {
    $(".modal").css("display", "none");
  });
});
/** Kinh nghiệm hay hover */
// $(document).ready(function () {
//   $(".kinhnghiemhay").hover(
//     function () {
//       $(".kinhnghiemhay__sub").css("display", "block");
//       // $(".icon-sort-down").css("display", "none");
//       // $(".icon-sort-up").css("display", "block");
//     },
//     function () {
//       $(".kinhnghiemhay__sub").css("display", "none");
//       // $(".icon-sort-down").css("display", "block");
//       // $(".icon-sort-up").css("display", "none");
//     }
//   );
// });
/**Sub menu  */
$(document).ready(function () {
  $("#sup-menu-1").hover(
    function () {
      $("#sub-menu-1").css("display", "flex");
    },
    function () {
      $("#sub-menu-1").css("display", "none");
    }
  );
});

$(document).ready(function () {
  $("#sup-menu-2").hover(
    function () {
      $("#sub-menu-2").css("display", "flex");
    },
    function () {
      $("#sub-menu-2").css("display", "none");
    }
  );
});
