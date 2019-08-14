//= require rails_com/footer
//= require default_form/footer
//= require rails_org/footer
$('#navbar_dropdown').dropdown();
$('#worker_dropdown').dropdown();

$('.message .close').on('click', function() {
  $(this).closest('.message').fadeOut();
});
$('.ui.toggle.checkbox').checkbox();
$('.ui.accordion').accordion({selector: {trigger: '.title'}});
