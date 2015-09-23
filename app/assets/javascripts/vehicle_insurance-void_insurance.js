$(document).on('ready page:load', function () {
  if($('#vehicle_insurance_insurance_void').val() === 'true') {
    $('input').each(function() {
      $(this).attr('disabled', 'disabled');
    });
    $('select').each(function() {
      $(this).attr('disabled', 'disabled');
    });
    $('textarea').each(function() {
      $(this).attr('disabled', 'disabled');
    });
    $('#find_client').each(function() {
      $(this).attr('disabled', 'disabled');
    });
  }

  $('#insurance_void_link_to').click(function() {
    this.href = this.href + '?insurance_void_date=' + $('#vehicle_insurance_insurance_void_date').val();
  });
});