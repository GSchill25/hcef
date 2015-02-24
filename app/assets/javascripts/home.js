var name = 'Allegheny Elementary';
var students = ["Lorean Seybert",
"Lowell Brumfield",
"Vicki Hunley",
"Karole Riley",
"Doloris Steffy",  
"Sharda Patel",
"Elvira Bednar",  
"Lyndia Peil",
"Jesus Pennywell", 
"Sanford Duffie",
"Dana Jeon",
"Janean Hodnett",  
"Verna Hester",
"Annette Keating",
"Tatiana Sevilla",  
"Frank Towers",
"Gillian Frederick",  
"Philomena Cates",  
"Kyle Marnell",
"Berniece Ocallaghan"]

var students2 = ['Carlee Febres', 'Monserrate Lowrance', 'Rochelle Adelson', 'Usha Kampen', 'Margarett Hoose', 'Marguerite Dismukes', 'Lucia Oden', 'Delmar Gondek', 'Deloras Coram', 'Patrick Vickers', 'Claribel Disandro', 'Janetta Bonhomme', 'Alysha Cutshaw', 'Son Virgin', 'Cristy Bock', 'Felica Landa', 'Sammy Nishimura', 'Germaine Lannon', 'Loreta Bollin', 'Coralie Samuelson', 'Cher Bermejo', 'Pilar Cusson', 'Billi Ridinger', 'Letisha Aubry', 'Antione Barnhill'];

var students3 = ['Earle Lo', 'Melissa Mazzoni', 'Glinda Thach', 'Simone Bona', 'Elliott Wattley', 'Alexander Lapierre', 'Matha Hackbarth', 'Shanna Henault', 'Sherron Sandusky', 'Georgie Overland', 'Jarred Baldwin', 'Erich Marzano', 'Maribeth Stemm', 'Rex Durante', 'Elwood Fenton', 'Madeleine Tijerina', 'Terrance Ertle', 'Brittaney Dunklin', 'Charles Boller', 'Jacob Trunnell', 'Nathan Yarnell', 'Angel Dickey', 'Hugo Clarkson', 'Tina Trudel', 'Roberta Jennings'];

$(document).ready(function() {
  for (var i = 0; i < students.length; i++) {
    if (i < students.length/3) {
      $("#after_school-form #students").append(document.createElement('LI').innerHTML = students[i] + "<br />");
    }
    else if (i < 2*students.length/3) {
      $("#enrichment-form #students").append(document.createElement('li').innerHTML = students[i] + "<br />");
    }
    else {
      $("#field_trip-form #students").append(document.createElement('li').innerHTML = students[i] + "<br />");
    }
  }
  $("#slider").dateRangeSlider({
    bounds: {
      min: new Date(2012, 0, 1),
      max: (new Date).getTime()
    },
    defaultValues: {
      min: new Date(2012, 0, 1),
      max: (new Date).getTime()
    },
    arrows: false
  });

$('#sidebar li').click(function(){
  $('.sidebar-highlight').removeClass('sidebar-highlight');
  $(this).addClass('sidebar-highlight');
  var newTitle = $(this).html();
  $(".title").html(newTitle);
});


$('#info-nav li').click(function(){
  $('.nav-highlight').removeClass('nav-highlight');
  $(this).addClass('nav-highlight');
});

  $('#after_school').click(function() {
    $('#after_school-form').show();
    $('#enrichment-form').hide();
    $('#field_trip-form').hide();
  });

  $('#enrichment').click(function() {
    $('#after_school-form').hide();
    $('#enrichment-form').show();
    $('#field_trip-form').hide();
  });

  $('#field_trip').click(function() {
    $('#after_school-form').hide();
    $('#enrichment-form').hide();
    $('#field_trip-form').show();
  });

});



