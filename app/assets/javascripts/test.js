$('.timer').ready(function(){
	$('.timer').startTimer({
		 	onComplete: function(element){
	 			$(".submit").click()
			}
		})
})
