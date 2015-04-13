window.onload = function() {
  $('.parent-button').click(function() {

    /* Button about to be made active */
    if (!$(this).hasClass('active')) {
      $(this).find($('.btn')).each(function() {
        $(this).addClass('active');
      });
    }
    /* Button about to be made inactive */
    else {
      $(this).find($('.btn')).each(function() {
        $(this).removeClass('active');
      });
    }
  });
}
