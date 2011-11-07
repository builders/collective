<?php

Class Forum_commentEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'etm_comment',
 			'forum_discussion_subscribers',
 			'forum_subscription_members',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = '[Forum] Re: {/data/etm-comment/entry/parent-id/item}';
	public $reply_to_name = 'Organization';
	public $reply_to_email_address = 'hello@example.com';
	public $recipients = '{/data/forum-subscription-members/entry/name} <{/data/forum-subscription-members/entry/email-address}>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Forum Comment',
		'version' => '1.0',
		'author' => array(
			'name' => 'Organization',
			'website' => 'http://example.com',
			'email' => 'hello@example.com'
		),
		'release-date' => '2011-05-11T16:20:59+00:00'
	);	
}