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
   $('.datepick').datepicker({ });
   $("#date").datepicker( "setDate" , new Date() );
});

