$(document).ready(function() {
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
});

/* TODO: All button */

/* TODO: Selecting locations unselects Providers and vice versa */

/* TODO: Get sublocations on submit */

function submit() {
  var locations = [];
  $('#locations .parent-button').each(function(index) {
    if (this.classList.contains('active')) {
      locations.push(index);
    }
  });
  var params = {locations: locations};
  $.ajax({
    type: "POST",
    url: '/master_view_new/submit', 
    data: params,
    dataType: "JSON"
  }).success(function(response){
    var table_body = document.getElementById('table_body');
    table_body.innerHTML = '';
    var locationObjects = response.locations
    if (response && locationObjects) {
      for (var i = 0; i < locationObjects.length; i++) {
        var tr = document.createElement('tr');
        var td = document.createElement('td');
        td.innerHTML = locationObjects[i].name;
        tr.appendChild(td);
        table_body.appendChild(tr);
      }
    }
  });
return false;
}
