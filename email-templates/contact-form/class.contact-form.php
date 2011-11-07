<?php

Class Contact_formEmailTemplate extends EmailTemplate{

		
	public $datasources = Array();
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Contact Form: {/data/events/send-message/post-values/*[name() = ../subject]}';
	public $reply_to_name = '';
	public $reply_to_email_address = '';
	public $recipients = '{/data/events/send-message/post-values/subject}';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Contact Form',
		'version' => '1.0',
		'author' => array(
			'name' => 'Organization',
			'website' => 'http://example.com',
			'email' => 'hello@example.com'
		),
		'release-date' => '2011-04-20T00:01:24+00:00'
	);	
}