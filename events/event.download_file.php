<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventdownload_file extends Event{

		const ROOTELEMENT = 'download-file';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Download File',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com/',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-05-05T06:02:34+00:00',
				'trigger-condition' => 'action[download-file]'
			);
		}

		public static function getSource(){
		}

		public static function allowEditorToParse(){
			return false;
		}

		public static function documentation(){
			return '
        <h3>Download File</h3>
        <p>Attach this event to a page with a private upload file and use a <code>GET</code>.variable <code>?file=filename.ext</code> to download the file.</p>
        <pre class="XML"><code>
&lt;p class="resource-url">Download: 
	&lt;a href="{$current-url}?file={file/filename}">
		&lt;xsl:value-of select="file/filename" />
	&lt;/a>
&lt;/p>
        </code></pre>';
		}

		public function load(){
			if(isset($_GET['file'])) return $this->__trigger();
		}

		protected function __trigger(){

			$filename = $_GET['file'];
			$path = DOCROOT.'/workspace/assets/resources/files/'.$filename;
			$path_parts = pathinfo($path);
			$extension = $path_parts['extension'];
			
			switch ($extension) {
			    case 'doc':
			        $type = 'application/doc';
			        break;
			    case 'pdf':
			        $type = 'application/pdf';
			        break;
			    case 'rtf':
			        $type = 'text/richtext';
			        break;
			    case 'txt':
			        $type = 'text/plain';
			        break;
			    case 'zip':
			        $type = 'application/zip';
			        break;
			}
			
			if (file_exists($path)) {
				header('Content-Description: File Transfer');
				header('Content-Disposition: attachment; filename='.$filename);
				header('Content-Transfer-Encoding: binary');
				header('Content-Type: '.$type);
				header('Expires: 0');
				header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
				header('Pragma: public');
				header('Content-Length: ' . filesize($path));
				ob_clean();
				flush();
				readfile($path);
				exit;
			} else {
				die('File does not exist!');
			}

		}

	}
