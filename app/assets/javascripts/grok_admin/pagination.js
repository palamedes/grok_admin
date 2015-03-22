// Once turbo links has fired, then do stuff.
$(document).on('ready page:load', function () {

  // On click of a pagination item
  $(document).on('click', '.ui.pagination.menu a.item:not(.disabled):not(.active)', function() {

    var route = $(this).data('route');
    var model = $(this).data('model');
    var page = $(this).data('page');
    var data = "model=" + model + "&page=" + page;
    var $dis = $(this);

    // Create an ajax put to the route to get the next batch of records for our paginator
    $.ajax({
      type: "GET",
      dataType: "JSON",
      url: route,
      data: data,
      success: function(resp) {
        // Clear the way for the new information
        $dis.parent().parent().parent().siblings().not('.clone').remove();

      },
      error: function() {
        console.error(arguments);
      }
    });

  });

});