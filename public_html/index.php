<?php
/**
 @ In the name Of Allah
**/

$myFirst = null;
if(isset($_SERVER['REQUEST_URI']))
{
	$myAddr  = $_SERVER['REQUEST_URI'];
	$myAddr  = trim($myAddr, '/');
	$myFirst = strtok($myAddr, '/');
}

switch ($myFirst)
{
	case 'a':
	case 'cp':
	case 'su':
	case 'hook':
	case 'enter':
	case 'dev':
	case 'error404':
	case 'en':
	case false:
		// run dash
		// if Dash exist, require it else show related error message
		if ( file_exists( '../dash/autoload.php') )
		{
			require_once( '../dash/autoload.php');
		}
		elseif ( file_exists( '../../dash/autoload.php') )
		{
			require_once( '../../dash/autoload.php');
		}
		else
		{   // A config file doesn't exist
			exit("<p>We can't find <b>Dash</b>! Please contact administrator!</p>");
		}

		break;

	default:
		// run wp
		define('WP_USE_THEMES', true);

		/** Loads the WordPress Environment and Template */
		require('./blog/wp-blog-header.php');
		break;
}
?>