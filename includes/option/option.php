<?php
/**
 * save logs in other database
 */

include_once('social.php');

/**
@ In the name Of Allah
* The base configurations of the dashsample.
*/
self::$language =
[
	'default' => 'fa',
	'list'    => ['fa','en',],
];

self::$url['root']     = 'evazzadeh';
// self::$url['tld']      = 'com';
self::$url['protocol'] = 'https';

/**
 * system default lanuage
 */
self::$config['site']['title']           = "Javad Evazzadeh Kakroudi";
self::$config['site']['desc']            = "Trust Me, I'm an Engineer | وب شخصی من جایی برای انتشار دانسته های یک انسان. این وب سایت بیشتر جنبه آموزشی داره. پس احتمالا چیزی هم برای شما پیدا میشه!";
self::$config['site']['slogan']          = "Software Solution Designer";
self::$config['site']['googleAnalytics'] = "UA-29692827-1";


self::$config['debug']                 = true;
self::$config['enter']['force_verify'] = false;

?>