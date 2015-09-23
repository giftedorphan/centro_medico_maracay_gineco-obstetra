$(document).on('ready page:load', function () {
  $('#coverage').change(function() {
    if($(this).val()==='comprehensive_coverage'){
      $('#vehicle_insurance_total_loss').attr('name', 'vehicle_insurance[comprehensive_coverage]');
      $('#vehicle_insurance_total_loss').attr('id', 'vehicle_insurance_comprehensive_coverage');
    }
    else {
      $('#vehicle_insurance_comprehensive_coverage').attr('name', 'vehicle_insurance[total_loss]');
      $('#vehicle_insurance_comprehensive_coverage').attr('id', 'vehicle_insurance_total_loss');
    }
  });
});