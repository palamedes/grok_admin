// Once turbo links has fired, then do stuff.
$(document).on('ready page:load', function () {
  // Turn on all dropdowns
  $('.ui.dropdown').dropdown();
  // Turn on all radio buttons
  $('.ui.checkbox').checkbox();
  // Turn on all accordions
  $('.ui.accordion').accordion();
  // Turn on all popups
  $('.popup').popup();
  // Tabs
  $('.tabular.menu .item').tab();
  // Date pickers
  $('.datepicker').datepicker({"dateFormat": "DD, d MM, yy"});


  // Set the initial state of the undo and save buttons (hide them)
  $('i.save.icon').hide();
  $('i.undo.icon').hide();

  // When the user clicks the edit icon for a row do things!
  $(document).on('click', 'i.edit.icon', function(e) {
    // Get the columns for this edit icon based on its siblings (so we dont get it)
    $columns = $(this).parent().siblings();
    $columns.each(function(index, td) {
      // Get our col size so we know how big to make the input
      var colSize = $(td).outerWidth();
      // Get our column data
      var value = $(td).text();
      // Store the original data just incase
      $(td).data('original-value', value);
      // Lets figure out the input type
      switch($(td).data('type')) {
        case 'integer':
          var type = 'number';
          break;
        case 'date':
          var type = 'date';
          break;
        default :
          var type = 'text';
      }
      // Build our input
      // todo build it based on the type of input in data-type
      var html = "<input class='editor' type='" + type + "' value='" + value + "' />";
      // Inject the input and focus it.
      $(td).html(html);
      $(td).find('input').css('width', colSize - 20);
    });

    // Hide the edit and delete button.
    $(this).hide();
    $(this).siblings().hide();
    // Show the save and undu icons
    $(this).siblings('i.save.icon').show();
    $(this).siblings('i.undo.icon').show();

  });

});