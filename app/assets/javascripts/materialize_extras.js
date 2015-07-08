$( document ).ready(function(){

	$(".button-collapse").sideNav();
  $('.slider').slider();

  $('a#button-dismiss').click(function() {
  $('#error-content').slideUp(300); // To hide all other contents
	});
})

$(document).on('ready page:change', function() {
  Waves.displayEffect();
});