// Once turbo links has fired, then do stuff.
$(document).on('ready page:load', function () {

  // Set the initial state of the undo and save buttons (hide them)
  $('i.save.icon').hide();
  $('i.undo.icon').hide();

  // When the user clicks the edit icon for a row do things!
  $(document).on('click', 'i.edit.icon', function(e) {
    // Get the columns for this edit icon based on its siblings (so we dont get it)
    $columns = $(this).parent().siblings();
    $columns.each(function(index, td) {
      // If this column isn't editable, skip it.
      if (!$(td).hasClass('editable')) {
        return true;
      }
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
      var column = $(td).data('column');
      var html = "<input class='editor' type='" + type + "' name='resource[" + column + "]' value='" + value + "' />";
      // Inject the input and focus it.
      $(td).html(html);
      $(td).find('input').css('width', colSize - 20);
    });

    // Hide the edit and delete button.
    $(this).hide();
    $(this).siblings().hide();
    // Show the save and undo icons
    $(this).siblings('i.save.icon').show();
    $(this).siblings('i.undo.icon').show();
  });

  // When a user clicks the undo icon, undo!
  $(document).on('click', 'i.undo.icon', function(e) {
    // Get the columns for this edit icon based on its siblings (so we dont get it)
    $columns = $(this).parent().siblings();
    $columns.each(function(index, td) {
      $(td).html($(td).data('original-value'));
    });

    // Hide the save and undo button.
    $(this).hide();
    $(this).siblings().hide();
    // Show the edit and delete icons
    $(this).siblings('i.edit.icon').show();
    $(this).siblings('i.delete.icon').show();
  });

  // When a user clicks the save icon, save!
  $(document).on('click', 'i.save.icon', function(e) {
    // Get our route
    var route = $(this).parents('tr').data('route');
    // Get our model
    var model = $(this).parents('table').data('model');
    // Get our ID & primary key
    var key = $(this).parents('tr').data('key');
    var id = $(this).parents('tr').data('id');
    // Get our serialized data for this object starting with the resource, key and id info
    var data = 'resource=' + model + '&key=' + key + '&id=' + id;
    data += $(this).parents('tr').find('input').serialize();
    // Fire off a patch to update the data
    $.ajax({
      type: "PATCH",
      dataType: "JSON",
      url: route,
      data: data,
      success: function(resp) {
        console.log(arguments);
      },
      error: function() {
        console.error(arguments);
      }
    });

  });

});