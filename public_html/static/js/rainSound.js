
var myRain = document.getElementById('audioplayer');
function playRainAudio()
{
	if (myRain.paused)
	{
		myRain.play();
		// myRain.muted = false;
		playBtn.className = "";
		playBtn.className = "pause";
	}
	else
	{
		myRain.pause();
		playBtn.className = "";
		playBtn.className = "play";
	}
}

function setVolume(volume){myRain.volume = volume;}

