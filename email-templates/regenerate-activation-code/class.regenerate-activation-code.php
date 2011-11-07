<?php

Class Regenerate_activation_codeEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'etm_member',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Here is your new activation code for {$website-name}';
	public $reply_to_name = 'Organization';
	public $reply_to_email_address = 'hello@example.com';
	public $recipients = '{/data/etm-member/entry/name} <{/data/etm-member/entry/email-address}>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Regenerate Activation Code',
		'version' => '1.0',
		'author' => array(
			'name' => 'Organization',
			'website' => 'http://example.com',
			'email' => 'hello@example.com'
		),
		'release-date' => '2011-05-11T16:22:00+00:00'
	);	
}