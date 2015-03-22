// Once turbo links has fired, then do stuff.
$(document).on('ready page:load', function () {

  // On click of a pagination item
  $(document).on('click', '.ui.pagination.menu a.item:not(.disabled):not(.active)', function() {

    var route = $(this).parent('table').data('route');
    var model = $(this).parent('table').data('model');
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
          // Copy our clone
          var $copy = $clone.clone().removeClass('clone');
          // Iterate through each key in the resp.record and dump it in the correct column
          for (column in resp.records[i]) {
            $copy.children('.' + column).html(resp.records[i][column]);
          }
          // Prepend to the table
          $copy.prependTo($table);
        }
        // Now make the page we clicked active
        $dis.siblings().removeClass('active');
        // Find the page we are on, and set it as active
        $dis.parent().children('a.item[data-page=' + resp.page + ']').not('.icon').addClass('active');
      },
      error: function() {
        console.error(arguments);
      }
    });

  });

});