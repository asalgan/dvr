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

	var $radioButtons = $(".show-radio-button");

	$radioButtons.change(function(){
    var anyRadioButtonHasValue = false;
    
    $radioButtons.each(function(){
      if(this.checked){
        anyRadioButtonHasValue = true;
        return false;
      }
    });
    
    if(anyRadioButtonHasValue){
      $(".record-button").removeAttr("disabled");
      $(".record-button").css("background-color", "#008C00");
    }
	});

	
});






