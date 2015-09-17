$.fn.swapWithDataOthers = function(){
  var orig_text = this.text();
  var orig_class = this.attr('class');
  var other_text = this.data('other-text');
  var other_class = this.data('other-class');

  this.data('other-text', orig_text).data('other-class', orig_class);
  this.text(other_text).attr('class', other_class);

  return this;
}


$(document).ready(function(){

  $('.btn-toggle').on("ajax:success", function(){
    $(this).swapWithDataOthers();

  }).on("ajax:error", function(){
    alert('Unable to toggle');
  });

});
