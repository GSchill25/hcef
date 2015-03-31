$(".programs.new").ready(function() {
   $('.datepick').datepicker({ });
   $("#start_date").datepicker( "setDate" , new Date() );
});


$(".after_schools.new").ready(function() {
   $('.datepick').datepicker({ 
     onSelect: function() {
       $("#toggleTables").show();
     }
   });
   //$("#date").datepicker( "setDate" , new Date() );
   //$('#date').datepicker( "onSelect", alert("selected") );
});

$(".children.new").ready(function() {
   $('.datepick').datepicker({ });
   $("#date").datepicker( "setDate" , new Date() );
});

