//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(document).ready(function() {

// var $this = $(this);
// var $form = $this.closest('form');
//   $form.submit(function() {  
//     var valuesToSubmit = $this.serialize();
// 	// $('.record-button').click(function(event) {
// 		$.ajax({
//       url: $(this).attr('record'),
//       type: 'POST',
//       data: valuesToSubmit
//     })
//     return false;
// 	});


  if ($('body').hasClass('show_page')) {
    $('.show-radio-button').on('keyup change', function(e){
      var $this = $(this);
      var $form = $this.closest('form');
      var $button = $form.find('.record-button');
      var disabled = $this.val() == ''; 
        if ($this.val() == '' ) {
          $button.prop('disabled', true);
          $button.css("background-color", "");
        } else {
          $button.prop('disabled', false);
          $button.css("background-color", "#008C00");
        }
    });
  };
	
});
