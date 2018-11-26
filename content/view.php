<?php
namespace content;

class view
{
	public static function config()
	{
		// define default value for global
		\dash\data::site_title(T_("Javad Evazzadeh Kakroudi"));
		\dash\data::site_desc(T_("Trust Me, I'm an Engineer").' '.  T_('Place to share knowledge of a human on earth!'));
		\dash\data::site_slogan(T_("Software Solution Designer"));
		\dash\data::page_desc(\dash\data::site_desc(). ' | '. \dash\data::site_slogan());
	}
}
?>