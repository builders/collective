<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceflickr_thumbnails extends Datasource{

		public $dsParamROOTELEMENT = 'flickr-thumbnails';
		public $dsParamURL = 'http://api.flickr.com/services/feeds/groups_pool.gne?id=1816076@N22&lang=en-us&format=rss_200';
		public $dsParamXPATH = '/rss/channel/item[position() &lt; 10]';
		public $dsParamCACHE = '30';
		public $dsParamTIMEOUT = '6';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Flickr Thumbnails',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-10-31T00:05:39+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.dynamic_xml.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
