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

$(".children.new").ready(function() {
   $('.datepick').datepicker({ changeYear: true, yearRange: "c-120:c+0", maxDate: "+0d" });
   $("#date").datepicker( "setDate" , new Date() );
});

