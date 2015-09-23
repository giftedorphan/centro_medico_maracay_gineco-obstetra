$(document).on('ready page:load', function () {
  $('#vehicle_insurance_form').submit(function( event ) {
    $('#vehicle_insurance_insurance_during').val( '[' + $('#vehicle_insurance_insurance_during_1').val() + ', ' + $('#vehicle_insurance_insurance_during_2').val() + ')');
    $('#vehicle_insurance_receipt_during').val( '[' + $('#vehicle_insurance_receipt_during_1').val() + ', ' + $('#vehicle_insurance_receipt_during_2').val() + ')');
    $('#vehicle_insurance_comprehensive_coverage').val($('#vehicle_insurance_comprehensive_coverage').val().replace(/\./g, '').replace(/\,/g, '.'));
    $('#vehicle_insurance_amount_premium').val($('#vehicle_insurance_amount_premium').val().replace(/\./g, '').replace(/\,/g, '.'));
    $('#vehicle_insurance_deductible').val($('#vehicle_insurance_deductible').val().replace(/\./g, '').replace(/\,/g, '.'));
    $('#vehicle_insurance_commission').val($('#vehicle_insurance_commission').val().replace(/\./g, '').replace(/\,/g, '.'));
  });
});