// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regex, new_id));
}

$('#addButton').on('click', function() {
    // Get a handle on the input fields and remove them from the DOM (so we can add them as a table row later).
    var inputFields = $('#new-pilot-fields input[type="text"]');
    inputFields.detach();

    var newRow = $("<tr />");
    inputFields.map(function () {
        return $('<td/>').append(this);
    }).appendTo(newRow);

//      inputFields.each(function(index) {
//          var newCell = $("<td>" + inputFields[index] + "</td>");
//          newCell.appendTo(newRow);
//      });

    // Get a handle on the last table row
    var lastRow = $('#pilots-table tr:last');
    lastRow.after(newRow);

    $('#new-pilot-fields').modal('hide');
});