/*
window.onbeforeunload = function (e) {
  $('#main-container').addClass('container');
  console.log(message);
};
*/

$(document).ready(function() {
  /* $('#main-container').removeClass('container'); */

  /* Select sub-locations on parent click */
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

  /* All Locations button */
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
 
  /* Toggle visibility of tables on button click*/
  $('#afterSchoolButton').click(function() {
    $('#after_schools').toggle();
  });

  $('#enrichmentButton').click(function() {
    $('#enrichments').toggle();
  });

  $('#fieldTripButton').click(function() {
    $('#field_trips').toggle();
  });

});

function submit() {
  var locations = [];
  /* Check which locations are selected */
  $('#locations .parent-button').each(function(index) {
    if (this.classList.contains('active')) {
      locations.push(index);
    }
  });
  var params = {locations: locations};
  /* Request to get location data */
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

    var enrichments_days = response.enrichments_days
    var field_trips_days = response.field_trips_days

    var after_schools_children = response.after_schools_children
    var enrichments_children = response.enrichments_children
    var field_trips_children = response.field_trips_children


    if (response) {
      populateProgramTables(after_schools, enrichments, enrichments_days, field_trips, field_trips_days);
      populateChildrenTables(after_schools_children, enrichments_children, field_trips_children);
    }
  });
  return false;
}

function populateProgramTables(after_schools, enrichments, enrichments_days, field_trips, field_trips_days) {
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
      tr.setAttribute('data-toggle', 'collapse')
      tr.setAttribute('data-target', '#after-school' + i);

      var td = document.createElement('td');
      /* Add expandable indicator */
      var plus = document.createElement('span');
      plus.className = 'glyphicon glyphicon-plus';
      plus.setAttribute('aria-hidden', 'true');
      td.appendChild(plus);
      /* Name of program */
      var name = document.createElement('span');
      name.innerHTML = after_schools[i].name;
      td.appendChild(name);
      /* View program button */
      var a = document.createElement('a');
      a.setAttribute('href','/programs/' + after_schools[i].id);
      a.className = 'btn btn-default btn-xs view-button glyphicon glyphicon-search';
      a.setAttribute('aria-hidden', 'true');
      a.setAttribute('role', 'button');
      /* Ensure link opens to new tab/page to preserve current page */
      a.setAttribute('target', '_blank');
      td.appendChild(a);

      tr.appendChild(td);
      after_schools_table.appendChild(tr);

      /* Toggle expandable indicator */
      tr.addEventListener('click', function(e) {
        var symbol = this.firstChild.firstChild
        if ( $(symbol).hasClass('glyphicon-plus') ) {
          $(symbol).addClass('glyphicon-minus').removeClass('glyphicon-plus');
        } else {
          $(symbol).addClass('glyphicon-plus').removeClass('glyphicon-minus');
        }
      });

      /* Create program's empty child row */
      var tr_child = document.createElement('tr');
      var td_child = document.createElement('td');
      var div = document.createElement('div');
      td_child.className = 'hidden-row';
      div.className = 'collapse'
      div.id='after-school' + i;
      tr_child.appendChild(td_child);
      td_child.appendChild(div);
      after_schools_table.appendChild(tr_child);
    }
  }

  if (enrichments) {
    for (var i = 0; i < enrichments.length; i++) {
      /* Create program row */
      var tr = document.createElement('tr');
      tr.setAttribute('data-toggle', 'collapse')
      tr.setAttribute('data-target', '#enrichment' + i);
      
      var td = document.createElement('td');
      /* Add expandable indicator */
      var plus = document.createElement('span');
      plus.className = 'glyphicon glyphicon-plus';
      plus.setAttribute('aria-hidden', 'true');
      td.appendChild(plus);
      /* Name of program */
      var name = document.createElement('span');
      name.innerHTML = enrichments[i].name;
      td.appendChild(name);
      /* View program button */
      var a = document.createElement('a');
      a.setAttribute('href','/programs/' + enrichments[i].id);
      a.className = 'btn btn-default btn-xs';
      a.className += ' glyphicon glyphicon-search ';
      a.className += ' view-button';
      a.className += ' prevent-toggle';
      a.setAttribute('aria-hidden', 'true');
      a.setAttribute('role', 'button');
      /* Ensure link opens to new tab/page to preserve current page */
      a.setAttribute('target', '_blank');
      td.appendChild(a);
      /* Number of days for the program */
      var num_days = document.createElement('span')
      num_days.className = 'number_days';
      num_days.innerHTML = '(';
      num_days.innerHTML += enrichments_days[i]
      num_days.innerHTML += ' days)';
      td.appendChild(num_days);

      tr.appendChild(td);
      enrichments_table.appendChild(tr);

      /* Toggle expandable indicator */
      tr.addEventListener('click', function(e) {
        var symbol = this.firstChild.firstChild
        if ( $(symbol).hasClass('glyphicon-plus') ) {
          $(symbol).addClass('glyphicon-minus').removeClass('glyphicon-plus');
        } else {
          $(symbol).addClass('glyphicon-plus').removeClass('glyphicon-minus');
        }
      });

      /* Create program's empty child row */
      var tr_child = document.createElement('tr');
      var td_child = document.createElement('td');
      var div = document.createElement('div');
      td_child.className = 'hidden-row';
      div.className = 'collapse'
      div.id='enrichment' + i;
      tr_child.appendChild(td_child);
      td_child.appendChild(div);
      enrichments_table.appendChild(tr_child);
    }
  }

  if (field_trips) {
    for (var i = 0; i < field_trips.length; i++) {
      var tr = document.createElement('tr');
      tr.setAttribute('data-toggle', 'collapse')
      tr.setAttribute('data-target', '#field-trip' + i);

      var td = document.createElement('td');
      /* Add expandable indicator */
      var plus = document.createElement('span');
      plus.className = 'glyphicon glyphicon-plus';
      plus.setAttribute('aria-hidden', 'true');
      td.appendChild(plus);
      /* Name of program */
      var name = document.createElement('span');
      name.innerHTML = field_trips[i].name;
      td.appendChild(name);
      /* View program button */
      var a = document.createElement('a');
      a.setAttribute('href','/programs/' + field_trips[i].id);
      a.className = 'btn btn-default btn-xs view-button glyphicon glyphicon-search';
      a.setAttribute('aria-hidden', 'true');
      a.setAttribute('role', 'button');
      /* Ensure link opens to new tab/page to preserve current page */
      a.setAttribute('target', '_blank');
      td.appendChild(a);
      /* Number of days for the program */
      var num_days = document.createElement('span')
      num_days.className = 'number_days';
      num_days.innerHTML = '(';
      num_days.innerHTML += field_trips_days[i]
      num_days.innerHTML += ' days)';
      td.appendChild(num_days);

      tr.appendChild(td);
      field_trips_table.appendChild(tr);

      /* Toggle expandable indicator */
      tr.addEventListener('click', function(e) {
        var symbol = this.firstChild.firstChild
        if ( $(symbol).hasClass('glyphicon-plus') ) {
          $(symbol).addClass('glyphicon-minus').removeClass('glyphicon-plus');
        } else {
          $(symbol).addClass('glyphicon-plus').removeClass('glyphicon-minus');
        }
      });

      /* Create program's empty child row */
      var tr_child = document.createElement('tr');
      var td_child = document.createElement('td');
      var div = document.createElement('div');
      td_child.className = 'hidden-row';
      div.className = 'collapse'
      div.id='field-trip' + i;
      tr_child.appendChild(td_child);
      td_child.appendChild(div);
      field_trips_table.appendChild(tr_child);
    }
  }
}

function populateChildrenTables(as_children, e_children, ft_children) {
  if (as_children) {
    for (var i = 0; i < as_children.length; i++) {
      if (as_children[i] != null && typeof as_children[i] !== 'undefined' && as_children[i].length > 0) {
        var parentDiv = document.getElementById('after-school' + i);
        if (parentDiv) {
          parentDiv.appendChild(create_after_school_table(as_children[i]));
        }
      }
    }
  }
  if (e_children) {
    for (var i = 0; i < e_children.length; i++) {
      if (e_children[i] != null && typeof e_children[i] !== 'undefined' && e_children[i].length > 0) {
        var parentDiv = document.getElementById('enrichment' + i);
        if (parentDiv) {
          parentDiv.appendChild(create_enrichment_table(e_children[i]));
        }
      }
    }
  }
  if (ft_children) {
    for (var i = 0; i < ft_children.length; i++) {
      if (ft_children[i] != null && typeof ft_children[i] !== 'undefined' && ft_children[i].length > 0) {
        var parentDiv = document.getElementById('field-trip' + i);
        if (parentDiv) {
          parentDiv.appendChild(create_field_trip_table(ft_children[i]));
        }
      }
    }
  }
}

function create_after_school_table(children) {
  var table = document.createElement('table');
  table.className = 'table table-striped'

  /* thead */
  var thead = document.createElement('thead');
  var theadRow = document.createElement('tr');

  var th = document.createElement('th');
  th.innerHTML = 'Child';
  theadRow.appendChild(th);

  var th = document.createElement('th');
  th.innerHTML = 'Avg HW';
  theadRow.appendChild(th);

  var th = document.createElement('th');
  th.innerHTML = 'Avg Lit';
  theadRow.appendChild(th);

  var th = document.createElement('th');
  th.innerHTML = 'Avg Tech';
  theadRow.appendChild(th);

  var th = document.createElement('th');
  th.innerHTML = 'Avg Reading';
  theadRow.appendChild(th);

  var th = document.createElement('th');
  th.innerHTML = 'Avg Physical';
  theadRow.appendChild(th);
  
  var th = document.createElement('th');
  th.innerHTML = 'Avg HandsOn';
  theadRow.appendChild(th);

  var th = document.createElement('th');
  th.innerHTML = 'Total Time';
  theadRow.appendChild(th);

  thead.appendChild(theadRow);
  
  /* tbody */
  var tbody = document.createElement('tbody');
  /* Populate body with children info */
  for (var i = 0; i < children.length; i++) {
    var child = children[i][0];
    var avg_hw = children[i][1];
    var avg_lit = children[i][2];
    var avg_tech = children[i][3];
    var avg_read = children[i][4];
    var avg_physical = children[i][5];
    var avg_handson = children[i][6];
    var total_time = children[i][7];

    var tr = document.createElement('tr');

    var td = document.createElement('td');
    var a = document.createElement('a');
    a.setAttribute('href', '/children/' + child.id);
    a.innerHTML = child.first_name + " " + child.last_name;
    /* Ensure link opens to new tab/page to preserve current page */
    a.setAttribute('target', '_blank');
    td.appendChild(a);
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = avg_hw;
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = avg_lit;
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = avg_tech;
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = avg_read;
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = avg_physical;
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = avg_handson;
    tr.appendChild(td);
    
    var td = document.createElement('td');
    td.innerHTML = total_time;
    tr.appendChild(td);
    
    tbody.appendChild(tr);
  }
    table.appendChild(thead);
    table.appendChild(tbody);
    return table;
}

function create_enrichment_table(children) {
  var table = document.createElement('table');
  table.className = 'table table-striped'

  /* thead */
  var thead = document.createElement('thead');
  var theadRow = document.createElement('tr');
  var th = document.createElement('th');
  th.innerHTML = 'Child';
  theadRow.appendChild(th);
  thead.appendChild(theadRow);

  /* tbody */
  var tbody = document.createElement('tbody');
  /* Populate body with children info */
  for (var i = 0; i < children.length; i++) {
    var child = children[i];

    var tr = document.createElement('tr');
    var td = document.createElement('td');
    var a = document.createElement('a');
    a.setAttribute('href', '/children/' + child.id);
    a.innerHTML = child.first_name + " " + child.last_name;
    /* Ensure link opens to new tab/page to preserve current page */
    a.setAttribute('target', '_blank');
    td.appendChild(a);
    tr.appendChild(td);
    tbody.appendChild(tr);
  }
    table.appendChild(thead);
    table.appendChild(tbody);
    return table;
}

function create_field_trip_table(children) {
  var table = document.createElement('table');
  table.className = 'table table-striped'

  /* thead */
  var thead = document.createElement('thead');
  var theadRow = document.createElement('tr');
  var th = document.createElement('th');
  th.innerHTML = 'Child';
  theadRow.appendChild(th);
  thead.appendChild(theadRow);

  /* tbody */
  var tbody = document.createElement('tbody');
  /* Populate body with children info */
  for (var i = 0; i < children.length; i++) {
    var child = children[i];

    var tr = document.createElement('tr');
    var td = document.createElement('td');
    var a = document.createElement('a');
    a.setAttribute('href', '/children/' + child.id);
    a.innerHTML = child.first_name + " " + child.last_name;
    /* Ensure link opens to new tab/page to preserve current page */
    a.setAttribute('target', '_blank');
    td.appendChild(a);
    tr.appendChild(td);
    tbody.appendChild(tr);
  }
    table.appendChild(thead);
    table.appendChild(tbody);
    return table;
}
