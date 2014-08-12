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
	
});


$(window).load(function() {
  if ($('body').hasClass('show_page')) {
    $('.show-radio-button').on('keyup change', function(e){
      var $this = $(this);
      var $form = $this.closest('form');
      var $button = $form.find('.record-button');
      var disabled = $this.val() == ''; 
        $button.prop('disabled', disabled); 
        $button.css("background-color", disabled ? "" : "#008C00");
    });
  };
}); 





