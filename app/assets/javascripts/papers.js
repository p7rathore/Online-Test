// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('click', '.check_box', function() {
	var question = $(this).parents('.fields')[1];
	var q_type = $(question).children().find('.q_type').val();
	if(q_type == 'MCQ'|| q_type=="True/False") {
		check_boxes = $(question).children().find('.check_box')
		check_boxes.each(function() {
			$(this).prop("checked", false);
		})

		$(this).prop("checked", true);
	}
})



$(document).on('click', '.option', function() {
	var value = $(this).parents().children().eq(0).prop("checked");
	if(value)
		$(this).parents().children().eq(0).prop("checked",false);
	else 
		$(this).parents().children().eq(0).prop("checked",true);
});



