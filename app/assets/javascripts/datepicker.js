$(".programs.new").ready(function() {
   $('.datepick').datepicker({ });
   $("#start_date").datepicker( "setDate" , new Date() );
});


$(".after_schools.new").ready(function() {
   $('.datepick').datepicker({
     onSelect: function() {
       $("#toggleTables").show();
       /* Triggers reloading of table data */
       $(this).change();
     }
   });
});

$(".after_schools.edit").ready(function() {
  // Editing should trigger table to load immediately (we already have data)
   $("#toggleTables").show();
   $('.datepick').change();

   $('.datepick').datepicker({
     onSelect: function() {
       $("#toggleTables").show();
       /* Triggers reloading of table data */
       $(this).change();
     }
   });
});

$(".children.new").ready(function() {
   $('.datepick').datepicker({ changeYear: true, yearRange: "c-120:c+0", maxDate: "+0d" });
   $("#date").datepicker( "setDate" , new Date() );
});

// All enrichments should have regular datepickers
$(".enrichments").ready(function(){
  $('.datepick').datepicker({ });
});

// All field trips should have regular datepickers
$(".field_trips").ready(function(){
  $('.datepick').datepicker({ });
});


