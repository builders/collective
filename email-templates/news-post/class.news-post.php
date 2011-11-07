<?php

Class News_postEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'email_subscribers',
 			'etm_news',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = '[{$website-name} News] Re: {/data/etm-news/entry/title}';
	public $reply_to_name = 'Organization';
	public $reply_to_email_address = 'hello@example.com';
	public $recipients = 'Organization <team@example.com>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'News Post',
		'version' => '1.0',
		'author' => array(
			'name' => 'Organization',
			'website' => 'http://example.com',
			'email' => 'hello@example.com'
		),
		'release-date' => '2011-05-11T16:13:55+00:00'
	);	
}