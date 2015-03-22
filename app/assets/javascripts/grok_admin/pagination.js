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
        // Get our clone and parent table
        $clone = $dis.parent().parent().parent().siblings('.clone').first();
        $table = $dis.parents('table');
        // Clone the clone, iterate through the results and inject!
        for (i=0;i<resp.records.length;i++) {
console.log(resp.records[i]);
          // Copy our clone
          var $copy = $clone.removeClass('clone');
          // Iterate through each key in the resp.record and dump it in the correct column
          for (column in resp.records[i]) {
            $copy.children('.' + column).html(resp.records[i][column]);
          }
          // Prepend to the table
          $copy.prependTo($table);
        }

      },
      error: function() {
        console.error(arguments);
      }
    });

  });

});