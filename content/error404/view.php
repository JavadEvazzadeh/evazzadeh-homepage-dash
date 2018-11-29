<?php
namespace content\error404;

class view
{
	public static function config()
	{
		\dash\data::include_css(false);
		\dash\data::include_js(false);
		\dash\data::siftalJS('off');

	}
}
?>