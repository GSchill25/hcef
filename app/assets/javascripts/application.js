// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery_readyselector
//= require jquery_nested_form
//= require rails.validations
//= require_tree .

$('.dropdown-toggle').dropdown();



$(function() {
	$('#select_all').click(function(event) {
	  if(this.checked) {
	      // Iterate each checkbox
	      $(':checkbox').each(function() {
	          this.checked = true;
	      });
	  }
	  else {
	    $(':checkbox').each(function() {
	          this.checked = false;
	      });
	  }
	});
});

window.ClientSideValidations.callbacks.element.fail = function(element, message, callback) {
  callback();
  if (element.data('valid') !== false) {
    element.parent().find('.message').hide().show('slide', {direction: "left", easing: "easeOutBounce"}, 500);
  }
}

window.ClientSideValidations.callbacks.element.pass = function(element, callback) {
  // Take note how we're passing the callback to the hide()
  // method so it is run after the animation is complete.
  element.parent().find('.message').hide('slide', {direction: "left"}, 500, callback);
}
