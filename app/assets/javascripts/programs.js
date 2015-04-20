$(function() {
  $(document).on('change', '#program_location_id', function() {
    // this == the element that fired the change event
    console.log($(this));
  });
});

