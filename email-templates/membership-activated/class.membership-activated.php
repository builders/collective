<?php

Class Membership_activatedEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'etm_member',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Welcome to {$website-name}';
	public $reply_to_name = 'Organization';
	public $reply_to_email_address = 'hello@example.com';
	public $recipients = '{/data/etm-member/entry/name} <{/data/etm-member/entry/email-address}>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Membership Activated',
		'version' => '1.0',
		'author' => array(
			'name' => 'Organization',
			'website' => 'http://example.com',
			'email' => 'hello@example.com'
		),
		'release-date' => '2011-05-11T16:21:39+00:00'
	);	
}