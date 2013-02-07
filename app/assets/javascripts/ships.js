// Set up the UI/UX for the ships screens.  This object sets up all the functionality we need to:
//  1.  Bind to the "click" event of the "#addButton" on the modal form.
//  2.  Append data from the modal form to the Pilots table.
//  3.  Hide the modal form when the user is done entering data.
//
// If any other events need to be wired up, the init function would be the place to put them.
var pilotFieldsUI = {
    init: function() {
        $('#addButton').on('click', function() {
            formHandler.appendFields();
            formHandler.hideForm();
        });
    }
};

// Configuration for the Add/Edit Ship screen's functionality:
//  formId:  The ID of the <FORM> that contains the input fields that need to be captured and appended to the table of Pilots.
//  tableId:  The ID of the <TABLE> that represents the Pilots assigned to fly a particular ship.
//  inputFieldClassSelector:  The CSS class that is assigned to all the data entry/input fields that need to be collected
//      for appending to th Pilots table (and ultimately for saving to the database).
//  getTBodySelector:  A VERY simple method that concatenates the cfg.tableId and " tbody" to build the selector we need
//      to identify the <TABLE> where we'll be appending rows.
var cfg = {
    formId: '#new-pilot-fields',
    tableId: '#pilots-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function() {
        return this.tableId + ' tbody';
    }
};

// Provides functionality to append new rows to the Pilots table and hide the modal form for adding new Pilots.
// NOTE:  The "appendFields" function depends on the rowBuilder to handle building the HTML for the new row.
var formHandler = {
    // Public method for adding a new row to the table.
    appendFields: function () {
        // Get a handle on all the input fields in the form and detach them from the DOM (we'll attach them later).
        var inputFields = $(cfg.formId + ' ' + cfg.inputFieldClassSelector);
        inputFields.detach();

        // Build the row and add it to the end of the table.
        rowBuilder.addRow(cfg.getTBodySelector(), inputFields);

        // Add the "Remove" link to the last cell.
        rowBuilder.link.appendTo($('tr:last td:last'));
    },

    // Public method for hiding the data entry fields.
    hideForm: function() {
        $(cfg.formId).modal('hide');
    }
};

// Provides functionality for building the HTML that represents a new <TR> for the Pilots table.
var rowBuilder = function() {
    // Private property that define the default <TR> element text.
    var row = $('<tr>', { class: 'fields' });

    // Public property that describes the "Remove" link.
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this Pilot.'
    }).append($('<i>', { class: 'icon-remove' }));

    // A private method for building a <TR> w/the required data.
    var buildRow = function(fields) {
        var newRow = row.clone();

        $(fields).map(function() {
            $(this).removeAttr('class');
            return $('<td/>').append($(this));
        }).appendTo(newRow);

        return newRow;
    }

    // A public method for building a row and attaching it to the end of a <TBODY> element.
    var attachRow = function(tableBody, fields) {
        var row = buildRow(fields);
        $(row).appendTo($(tableBody));
    }

    // Only expose public methods/properties.
    return {
        addRow: attachRow,
        link: link
    }
}();