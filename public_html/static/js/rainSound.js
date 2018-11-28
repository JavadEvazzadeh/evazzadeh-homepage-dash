
var myRain = document.getElementById('audioplayer');
function playRainAudio()
{
	if (myRain.paused)
	{
		myRain.play();
	}
	else
	{
		myRain.pause();
	}
}

function setVolume(volume)
{
	myRain.volume = volume;
}

