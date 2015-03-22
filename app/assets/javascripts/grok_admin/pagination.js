// Once turbo links has fired, then do stuff.
$(document).on('ready page:load', function () {

  // On click of a pagination item
  $(document).on('click', '.ui.pagination.menu a.item:not(.disabled):not(.active)', function() {
    console.log(this);
  });

});