<?php

	header('Expires: Mon, 12 Dec 1982 06:14:00 GMT');
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
	header('Cache-Control: no-cache, must-revalidate, max-age=0');
	header('Pragma: no-cache');

	function __errorHandler($errno=NULL, $errstr, $errfile=NULL, $errline=NULL, $errcontext=NULL){
		return;
	}

	if(!defined('PHP_VERSION_ID')){
    	$version = PHP_VERSION;
    	define('PHP_VERSION_ID', ($version{0} * 10000 + $version{2} * 100 + $version{4}));
	}

	if (PHP_VERSION_ID >= 50300){
	    error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
	}
	else{
	    error_reporting(E_ALL ^ E_NOTICE);
	}

	set_error_handler('__errorHandler');

	// Show PHP Info
	if(isset($_REQUEST['info'])){
		phpinfo();
		exit();
	}

	// Set the current timezone, should that not be available
	// default to GMT.
	if(!date_default_timezone_set(@date_default_timezone_get())) {
		date_default_timezone_set('GMT');
	}

	// Defines
	define('kVERSION', '2.2.4');
	define('kINSTALL_ASSET_LOCATION', './symphony/assets/installer');
	define('kINSTALL_FILENAME', basename(__FILE__));
	define('DOCROOT', rtrim(dirname(__FILE__), '\\/'));

	// Required system components
	require_once(DOCROOT . '/symphony/lib/boot/func.utilities.php');
	require_once(DOCROOT . '/symphony/lib/boot/defines.php');
	require_once(TOOLKIT . '/class.lang.php');
	require_once(TOOLKIT . '/class.general.php');
	require_once(CORE . '/class.errorhandler.php');

	// Initialize system language
	function setLanguage() {
		$lang = 'en';

		// Fetch language requests
		if(!empty($_REQUEST['lang'])){
			$lang = preg_replace('/[^a-zA-Z\-]/', NULL, $_REQUEST['lang']);
		}

		// Set language
		try{
			Lang::initialize();
			Lang::set($lang, false);
		}
		catch(Exception $s){
			return NULL;
		}

		return true;
	}

	/***********************
	         TESTS
	************************/

	// Check and set language
	if(setLanguage() === NULL){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Outstanding Requirements') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css"/>
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Outstanding Requirements') . '</h2>
			<p>' . __('Symphony needs at least one language file to be present before installation can proceed.') . '</p>

		</body>

</html>';

		die($code);

	}

	// Check for PHP 5.2+
	if(version_compare(phpversion(), '5.2', '<=')){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Outstanding Requirements') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css"/>
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Outstanding Requirements') . '</h2>
			<p>' . __('Symphony needs the following requirements satisfied before installation can proceed.') . '</p>

			<dl>
				<dt>' . __('%s 5.2 or above', array('<abbr title="PHP: Hypertext Pre-processor">PHP</abbr>')) . '</dt>
				<dd>' . __('Symphony needs a recent version of %s.', array('<abbr title="PHP: Hypertext Pre-processor">PHP</abbr>')) . '</dd>
			</dl>

		</body>

</html>';

		die($code);

	}

	// Make sure the install.sql file exists
	if(!file_exists('install.sql') || !is_readable('install.sql')){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Missing File') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css"/>
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Missing File') . '</h2>
			<p>' . __('It appears that <code>install.sql</code> is either missing or not readable. This is required to populate the database and must be uploaded before installation can commence. Ensure that <code>PHP</code> has read permissions.') . '</p>

		</body>

</html>';

		die($code);

	}

	// Check if Symphony is already installed
	if(file_exists('manifest/config.php')){

		$code = '<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>' . __('Existing Installation') . '</title>
		<link rel="stylesheet" type="text/css" href="' . kINSTALL_ASSET_LOCATION . '/main.css"/>
		<script type="text/javascript" src="' . kINSTALL_ASSET_LOCATION . '/main.js"></script>
	</head>
		<body>
			<h1>' . __('Install Symphony') .  '<em>' . __('Version') . ' ' . kVERSION . '</em></h1>
			<h2>' . __('Existing Installation') . '</h2>
			<p>' . __('It appears that Symphony has already been installed at this location.') . '</p>

		</body>

</html>';

		die($code);

	}

	function getDynamicConfiguration(){

		$conf = array();

		$conf['admin']['max_upload_size'] = '5242880';
		$conf['symphony']['pagination_maximum_rows'] = '17';
		$conf['symphony']['allow_page_subscription'] = '1';
		$conf['symphony']['lang'] = 'en';
		$conf['symphony']['pages_table_nest_children'] = 'yes';
		$conf['symphony']['version'] = '2.2.4';
		$conf['symphony']['strict_error_handling'] = 'yes';
		$conf['symphony']['session_gc_divisor'] = '10';
		$conf['log']['archive'] = '1';
		$conf['log']['maxsize'] = '102400';
		$conf['image']['cache'] = '1';
		$conf['image']['quality'] = '90';
		$conf['database']['character_set'] = 'utf8';
		$conf['database']['character_encoding'] = 'utf8';
		$conf['database']['runtime_character_set_alter'] = '1';
		$conf['database']['query_caching'] = 'default';
		$conf['public']['display_event_xml_in_source'] = 'no';
		$conf['general']['sitename'] = 'Organization';
		$conf['region']['time_format'] = 'g:i a';
		$conf['region']['date_format'] = 'd F Y';
		$conf['region']['datetime_separator'] = ' ';
		$conf['maintenance_mode']['enabled'] = 'no';
		$conf['dump_db']['path'] = '/workspace/sql';
		$conf['dump_db']['restore'] = 'yes';
		$conf['dump_db']['last_sync'] = '2011-11-06T15:00:48-08:00';
		$conf['openid-auth']['store-path'] = '/Users/stephen/Sites/sym/org/manifest/openid';
		$conf['openid-auth']['sreg-required-fields'] = '';
		$conf['openid-auth']['sreg-optional-fields'] = '';
		$conf['openid-auth']['login-redirect'] = '/dashboard/';
		$conf['openid-auth']['logout-redirect'] = '/login/';
		$conf['members']['cookie-prefix'] = 'sym-members';
		$conf['members']['section'] = '1';
		$conf['members']['reset-password-template'] = 'etm-reset-password';
		$conf['members']['regenerate-activation-code-template'] = 'etm-regenerate-activation-code';
		$conf['members']['generate-recovery-code-template'] = 'etm-reset-password';
		$conf['members']['activate-account-template'] = '';
		$conf['migrations']['enabled'] = 'yes';
		$conf['forum']['discussion-section'] = '2';
		$conf['forum']['comment-section'] = '3';
		$conf['forum']['created-by-field'] = '154';
		$conf['forum']['discussion-last-post-field'] = '155';
		$conf['forum']['discussion-last-active-field'] = '14';
		$conf['forum']['unread-cutoff-field'] = '19';
		$conf['forum']['pinned-field'] = '15';
		$conf['forum']['locked-field'] = '16';
		$conf['forum']['comment-discussion-link-field'] = '18';
		$conf['forum']['comment-created-by-field'] = '157';
		$conf['forum']['comment-creation-date-field'] = '19';
		$conf['forum']['comment-field'] = '68';
		$conf['content-type-mappings']['xml'] = 'text/xml; charset=utf-8';
		$conf['content-type-mappings']['text'] = 'text/plain; charset=utf-8';
		$conf['readonly_mode']['enabled'] = 'no';

		return $conf;

	}

	function getTableSchema(){
		return file_get_contents('install.sql');
	}

	function getWorkspaceData(){
		return file_get_contents('workspace/install.sql');
	}

	define('INSTALL_REQUIREMENTS_PASSED', true);
	include_once('./symphony/lib/toolkit/include.install.php');
