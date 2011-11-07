<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventforum_edit_discussion extends Event{

		const ROOTELEMENT = 'forum-edit-discussion';

		// Set the section ID of first section
		private static $source = 2;

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Forum: Edit Discussion',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com/',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-04-09T21:50:40+00:00',
				'trigger-condition' => 'action[forum-edit-discussion]'
			);
		}

		public static function getSource(){
			return self::$source;
		}

		public static function allowEditorToParse(){
			return false;
		}

		public static function documentation(){
			return '
        <h3>Edit Parent and Child Entries</h3>
        <p>This custom event will edit a parent section entry and a child section entry that
        is linked to the parent section entry with a Select Box Link field. Specify the ID
        of the child entry as the value of a hidden text input field in the front end form
        to edit the child entry.</p>
        <pre class="XML"><code>&lt;input name="child-entry-id" type="hidden" value="{forum-edit-discussion-comment/entry/@id}" /></code></pre>
        <p>The section ID for each section must be set manually in the event. (See lines 10 and 110
        of this event, where the value of the static <code>$source</code> variable is set.)
        <h3>Redirect ID</h3>
        <p>After successfully creating the entries, the event will redirect to the new parent entry,
        where <code>/id/</code> will be replaced with the actual ID: e.g. <code>/123/</code>.</p>
        <pre class="XML"><code>&lt;input type="hidden" name="redirect-id" value="{$root}/forum/discussions/id/"/></code></pre>
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;forum-edit-discussion result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/forum-edit-discussion></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;forum-edit-discussion result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/forum-edit-discussion></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Topic
    &lt;input name="fields[topic]" type="text" />
  &lt;/label>
  &lt;input name="fields[created-by]" type="hidden" value="..." />
  &lt;label>Creation Date
    &lt;input name="fields[creation-date]" type="text" />
  &lt;/label>
  &lt;input name="fields[last-post]" type="hidden" value="..." />
  &lt;label>Last Active
    &lt;input name="fields[last-active]" type="text" />
  &lt;/label>
  &lt;label>Pinned
    &lt;input name="fields[pinned]" type="checkbox" />
  &lt;/label>
  &lt;label>Closed
    &lt;input name="fields[closed]" type="checkbox" />
  &lt;/label>
  &lt;input name="redirect-id" type="hidden" value="{$root}/forum/discussions/id/"/>
  &lt;input name="child-entry-id" type="hidden" value="{forum-edit-discussion-comment/entry/@id}" />
  &lt;input name="action[forum-edit-discussion]" type="submit" value="Submit" />
&lt;/form></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['forum-edit-discussion'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			
			$entry_id = $result->getAttribute('id');

			// Set the redirect URL to the parent entry ID
			if(isset($_POST['redirect-id'])) {
				$redirect_url = str_replace('/id/', '/' . $entry_id . '/', $_POST['redirect-id']);
			}
			
			// Set the ID of the child entry
			if(isset($_POST['child-entry-id'])) {
				$_POST['id'] = $_POST['child-entry-id'];
			}

			// Set the section ID of the second section
			self::$source = 3;
			include(TOOLKIT . '/events/event.section.php');
			
			if($redirect_url) {
				redirect($redirect_url);
			}
			
			return $result;
		}

	}
