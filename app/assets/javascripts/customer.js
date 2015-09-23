$(document).on('ready page:load', function () {
  var pathname = window.location.pathname;

  if((pathname.indexOf('/edit') > -1) && (pathname.indexOf('/customers') > -1)){
    if($("#customer_type_of_id").val() === 'J' || $("#customer_type_of_id").val() === 'G' ){
      $("#customer_last_name").prop('disabled', true);
      $("#customer_birth").prop('disabled', true);
      $("#customer_sex").prop('disabled', true);
      $("#customer_marital_status").prop('disabled', true);
    }
    $.ajax({
      type:'POST',
      url: "/customers/cities",
      data: { selectedState : $('#customer_state_id').val()
            },
      dataType: 'json',
      success:function(data){
        var listItems= "";
        for (var i = 0; i < data.length; i++){
          listItems+= "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
        }
        $("#customer_city_id").html(listItems);
        $('#customer_city_id option[value="<%= if @customer_city; @customer_city.id; end %>"]').attr("selected",true);
      }
    });
  }

  $( "#customer_type_of_id" ).change(function() {
    if($(this).val() === 'J' || $(this).val() === 'G'){
      $("#customer_last_name").prop('disabled', true);
      $("#customer_last_name").val('');
      $("#customer_birth").prop('disabled', true);
      $("#customer_birth").val('');
      $("#customer_sex").prop('disabled', true);
      $("#customer_sex").val('');
      $("#customer_marital_status").prop('disabled', true);
      $("#customer_marital_status").val('');
    }
    else{
      $("#customer_last_name").prop('disabled', false);
      $("#customer_birth").prop('disabled', false);
      $("#customer_sex").prop('disabled', false);
      $("#customer_marital_status").prop('disabled', false);
    }
  });

  $( "#customer_state_id" ).change(function() {
    if($(this).val() === ''){
      $("#customer_city").html('<option value=> Debe seleccionar un estado </option>');
    }
    else{
      $.ajax({
        type:'POST',
        url: "/customers/cities",
        data: { selectedState : $(this).val()
              },
        dataType: 'json',
        success:function(data){
          var listItems= "";
          for (var i = 0; i < data.length; i++){
            listItems+= "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
          }
          $("#customer_city_id").html(listItems);
        }
      });
    }
  });
});