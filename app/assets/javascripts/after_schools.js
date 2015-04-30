function showHot() {
  var hotContainer = document.getElementById('hot');
  var hot_sign_in_Container = document.getElementById('hot_sign_in');
  hotContainer.style.display = 'block';
  hot_sign_in_Container.style.display = 'none';
  return false;
}
function showHotSignIn() {
  var hotContainer = document.getElementById('hot');
  var hot_sign_in_Container = document.getElementById('hot_sign_in');
  hot_sign_in_Container.style.display = 'block';
  hotContainer.style.display = 'none';
  return false;
}

function checkIn(row, col) {
  var date = new Date();
  var hours = date.getHours();
  console.log(hours);
  var minutes = date.getMinutes();
  var meridiem = hours < 12 ? 'am' : 'pm';
  hours = hours % 12;
  hours = hours ? hours : 12 // Hour 0 should be 12am
  minutes = minutes < 10 ? '0' + minutes : minutes; //Add the preceding 0 if it's absent
  var currentTime = hours + ':' + minutes + ' ' + meridiem;
  window.hot_sign_in.setDataAtCell(row, col, currentTime);
  return false;
}

window.onload = function() {


var container = document.getElementById('hot');
var container_sign_in = document.getElementById('hot_sign_in');

var readOnlyRenderer = function(instance, td, row, col, prop, value, cellProperties) {
  Handsontable.renderers.TextRenderer.apply(this, arguments);
  td.style.backgroundColor = '#FAFAFA';
  td.style.color = 'black';
};
var createCellProperties = function(row, col, prop) {
  var cellProperties = {};
  if (col === 0) {
    cellProperties.readOnly = true;
    this.renderer = readOnlyRenderer;
  }
  return cellProperties;        
}
var createCellProperties_sign_in = function(row, col, prop) {
  var cellProperties = {};
  if (col === 0) {
    cellProperties.readOnly = true;
    this.renderer = readOnlyRenderer;
  }
  /* Sign in/out Buttons */
  if (col === 1 || col === 2) {
    cellProperties.readOnly = true;
    this.renderer = "html";
  }
  return cellProperties;        
}
var onChange = function(change, source) { 
  if (change) {
    var row = change[0][0];
    var col = change[0][1];
    var value = change[0][3];
    var url = '/after_schools/update_by_id/' + children_ids[row];
    var date = document.getElementById('date').value;
    var params = JSON.stringify({program_id: program_id, col: col, value: value, date: date});
    var request = new XMLHttpRequest();
    request.open("POST", url, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(params);
  }
}
var onChange_sign_in = function(change, source) { 
  if (change) {
    var row = change[0][0];
    var col = change[0][1];
    var value = change[0][3];
    var url = '/after_schools/update_sign_in_by_id/' + children_ids[row];
    var date = document.getElementById('date').value;
    var params = JSON.stringify({program_id: program_id, col: col, value: value, date: date});
    var request = new XMLHttpRequest();
    request.open("POST", url, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(params);
  }
}

var onSelection_sign_in = function(row, col) {
  /* Ensure is button column */
  if (col == 1 || col == 2) {
    checkIn(row, col+2);
  }
}


window.hot = new Handsontable(container,
    { data: data,
      colHeaders: ["Child", "Homework", "Literacy", "Technology", "Reading Specialist", "Physical", "Hands On", "Goal", "Notes"],
      colWidths: [130, 80, 60, 82, 130, 80, 80, 200, 400],
      cells: createCellProperties,
      afterChange: onChange
  });


data_sign_in.forEach( function(row, rowIndex) {
  var timeInCol  = 3;
  var timeOutCol = 4;
  row[1] = "<button class='btn btn-primary' style='width:70%'>Sign In</button>";
  row[2] = "<button class='btn btn-primary' style='width:70%'>Sign Out</button>";
});

window.hot_sign_in = new Handsontable(container_sign_in,
  { data: data_sign_in,
    colHeaders: ["Child", "", "", "Time in", "Time out"],
    colWidths: [130, 150, 150, 130, 130],
    cells: createCellProperties_sign_in,
    afterChange: onChange_sign_in,
    afterSelection: onSelection_sign_in,
    fillHandle: false
});

/* On change of date, load in data from this day */
$('.datepick').change(function(){
    var url = '/after_schools/load_data'
    var date = document.getElementById('date').value;
    var params = JSON.stringify({data: data, data_sign_in: data_sign_in, program_id: program_id, children_ids: children_ids, date: date});
    var request = new XMLHttpRequest();

    request.onreadystatechange = function() { 
      if (request.readyState == 4) { // `DONE`
        var status = request.status;
        if (status == 200) {
          var response = JSON.parse(request.responseText);
          data = response.data
          data_sign_in = response.data_sign_in

          hot.loadData(data);
          hot_sign_in.loadData(data_sign_in);
        }
      }
    }

    request.open("POST", url, true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(params);
});

} /* end window.onload */

$(document).on('click', '.custom_btn', function() {
   $(".custom_btn").removeClass('active');
   $(this).addClass('active');
 });
