<?php
namespace ilib;
use \lib\router;

class main extends \lib\main
{
	/**
	 * check controller
	 *
	 * @param      <type>  $_controller_name  The controller name
	 *
	 * @return     string  ( description_of_the_return_value )
	 */
	function check_controller($_controller_name)
	{
		$default_controller = parent::check_controller($_controller_name);
		if(!$default_controller)
		{
			$controller_name = '\addons'. $_controller_name;
			if(!class_exists($controller_name))
			{
				return NULL;
			}
			else
			{
				return $controller_name;
			}
		}
		return $default_controller;
	}
}
?>