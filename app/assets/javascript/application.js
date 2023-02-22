//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require select2

$(document).ready(function() {
  $(document).ready(function() {
    $('.select2').each(function() {
      $(this).select2({
        placeholder: $(this).data('placeholder')
      });
    });
  });
});
