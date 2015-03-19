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
});