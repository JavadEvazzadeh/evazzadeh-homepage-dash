

$(document).ready(function()
{
	setTimeout(function(){
		$('body').addClass('loaded').removeClass('loading');
		$('body').addClass('loaded');

		playRainAudio();
	}, 3000);
});




