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
  var minutes = date.getMinutes();
  minutes = minutes < 10 ? '0' + minutes : minutes;
  var currentTime = date.getHours() + ":" + minutes;
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
  if (col === 3 || col === 4) {
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

window.hot = new Handsontable(container,
    { data: data,
      colHeaders: ["Child", "Homework", "Literacy", "Technology", "Reading Specialist", "Goal"],
      colWidths: [130, 80, 60, 82, 130, 400],
      cells: createCellProperties,
      afterChange: onChange
  });


data_sign_in.forEach( function(row, rowIndex) {
  var timeInCol  = 1;
  var timeOutCol = 2;
  row[3] = "<button style='width:70%' onclick='return checkIn(" + rowIndex + ", " + timeInCol + ")'>Sign In</button>";
  row[4] = "<button style='width:70%' onclick='return checkIn(" + rowIndex + ", " + timeOutCol + ")'>Sign Out</button>";
});

window.hot_sign_in = new Handsontable(container_sign_in,
  { data: data_sign_in,
    colHeaders: ["Child", "Time in", "Time out", "", ""],
    colWidths: [130, 130, 130, 150, 150],
    cells: createCellProperties_sign_in,
    afterChange: onChange_sign_in
});

} /* end window.onload */
