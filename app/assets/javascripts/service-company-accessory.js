$(document).on('ready page:load', function () {
  var pathname = window.location.pathname;

  $( "#add_service-company-accessory" ).click(function() {
    var address = "/services";
    var ajax_data = { service: {name: $('#service-company-accessory_name').val()} };

    if(pathname.indexOf('/companies') > -1){
      address = "/companies";
      ajax_data = { company: {name: $('#service-company-accessory_name').val()} };
    }
    else if(pathname.indexOf('/accessories') > -1){
      address = "/accessories";
      ajax_data = { accessory: {name: $('#service-company-accessory_name').val()} };
    }

    $.ajax({
      type:'POST',
      url: address,
      data: ajax_data,
      dataType: 'json',
      success:function(data){
        $('#ajax-refresh').load(document.URL +  ' #ajax-refresh');
        $('#ajax-refresh-flash').load(document.URL +  ' #ajax-refresh-flash');
      },
      error:function(data){
        $('#ajax-refresh-flash').load(document.URL +  ' #ajax-refresh-flash');
      }
    });
    $('#service-company-accessory_name').val('');
  });
});