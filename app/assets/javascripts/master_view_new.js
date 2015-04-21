$(document).ready(function() {
  $('.parent-button').click(function() {
    /* Button about to be made active */
    if (!$(this).hasClass('active')) {
      $(this).next().find($('.btn')).each(function() {
        if (!$(this).hasClass('active')) {
          $(this).trigger('click');
        }
      });
    }
    /* Button about to be made inactive */
    else {
      $(this).next().find($('.btn')).each(function() {
        if ($(this).hasClass('active')) {
          $(this).trigger('click');
        }
      });
    }
  });

  $('#locations-all').click(function() {
    if (!$(this).hasClass('active')) {
      $('#locations').find($('.parent-button')).each(function() {
        if (!$(this).hasClass('active')) {
          $(this).trigger('click');
        }
      });
    }
    else {
      $('#locations').find($('.parent-button')).each(function() {
        if ($(this).hasClass('active')) {
          $(this).trigger('click');
        }
      });
    }
  });

  $('#afterSchoolButton').click(function() {
    toggleTables(document.getElementById('after_schools'),
                 document.getElementById('enrichments'),
                 document.getElementById('field_trips'));
  });

  $('#enrichmentButton').click(function() {
    toggleTables(document.getElementById('enrichments'),
                 document.getElementById('after_schools'),
                 document.getElementById('field_trips'));
  });

  $('#fieldTripButton').click(function() {
    toggleTables(document.getElementById('field_trips'),
                 document.getElementById('enrichments'),
                 document.getElementById('after_schools'));
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
    var after_schools = response.after_schools
    var enrichments = response.enrichments
    var field_trips = response.field_trips
    if (response) {
      populateTables(after_schools, enrichments, field_trips);
    }
  });
return false;
}

function populateTables(after_schools, enrichments, field_trips) {
  /* Gather all table bodies */
  var after_schools_table = document.getElementById('after_schools').getElementsByTagName('tbody')[0];
  var enrichments_table = document.getElementById('enrichments').getElementsByTagName('tbody')[0];
  var field_trips_table = document.getElementById('field_trips').getElementsByTagName('tbody')[0];

  /* Remove all previous table body data */
  enrichments_table.innerHTML = '';
  after_schools_table.innerHTML = '';
  field_trips_table.innerHTML = '';

  if (after_schools) {
      for (var i = 0; i < after_schools.length; i++) {
        var tr = document.createElement('tr');
        var td = document.createElement('td');
        var a = document.createElement('a');
        a.setAttribute('href','/programs/' + after_schools[i].id);
        a.innerHTML = after_schools[i].name;
        td.appendChild(a);
        tr.appendChild(td);
        after_schools_table.appendChild(tr);
      }
  }

  if (enrichments) {
      for (var i = 0; i < enrichments.length; i++) {
        var tr = document.createElement('tr');
        var td = document.createElement('td');
        var a = document.createElement('a');
        a.setAttribute('href','/programs/' + enrichments[i].id);
        a.innerHTML = enrichments[i].name;
        td.appendChild(a);
        tr.appendChild(td);
        enrichments_table.appendChild(tr);
      }
  }

  if (field_trips) {
      for (var i = 0; i < field_trips.length; i++) {
        var tr = document.createElement('tr');
        var td = document.createElement('td');
        var a = document.createElement('a');
        a.setAttribute('href','/programs/' + field_trips[i].id);
        a.innerHTML = field_trips[i].name;
        td.appendChild(a);
        tr.appendChild(td);
        field_trips_table.appendChild(tr);
      }
  }
  toggleTables(document.getElementById('after_schools'),
               document.getElementById('enrichments'),
               document.getElementById('field_trips'));
}

function toggleTables(showTable, hideTable1, hideTable2) {
  showTable.style.display = 'block';
  hideTable1.style.display = 'none';
  hideTable2.style.display = 'none';
}
