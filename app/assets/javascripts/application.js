//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .


$(document).ready(function() {

	// $('.record-button').click(function(event) {
	// 	$.ajax({
 //      type: "POST",
 //      url: record,
 //    });
	// });

	// var $radioButtons = $(".show-radio-button");

	// $radioButtons.change(function(){
 //    var anyRadioButtonHasValue = false;
    
 //    $radioButtons(function(){
 //      if(this.val() > 1) {
 //        anyRadioButtonHasValue = true;
 //        return false;
 //      }
 //    });
    
 //    if(anyRadioButtonHasValue){
 //      $(".record-button").removeAttr("disabled");
 //      $(".record-button").css("background-color", "#008C00");
 //    }
	// });


  // $('.record-button').attr('disabled', 'disabled');

  // function updateFormEnabled() {
  //   if (verifyAdSettings()) {
  //       $('.record-button').attr('disabled', '');
  //   } else {
  //       $('.record-button').attr('disabled', 'disabled');
  //   }
  // }

  // function verifyAdSettings() {
  //   if ($('#show_box_id').val() != '' ) {
  //       return true;
  //   } else {
  //       return false
  //   }
  // }

  // $('.record-button').change(updateFormEnabled);


  // $('#show_box_id').on('keyup change', function(){
  //   if ($('#show_box_id').val() == '' ) {
  //     $('.record-button').prop('disabled', true);
  //     $(".record-button").css("background-color", "");
  //   } else {
  //     $('.record-button').prop('disabled', false);
  //     $(".record-button").css("background-color", "#008C00");
  //   }
  // });

$('.show-radio-button').on('keyup change', function(e){
  var $this = $(this);
  var $form = $this.closest('form');
  var $button = $form.find('.record-button');
  var disabled = $this.val() == ''; 
  $button.prop('disabled', disabled); 
  $button.css("background-color", disabled ? "" : "#008C00");
});

	
});






