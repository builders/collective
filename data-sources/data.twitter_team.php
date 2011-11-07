<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcetwitter_team extends Datasource{
		
		public $dsParamROOTELEMENT = 'twitter-team';
		public $dsParamURL = 'http://twitter.com/statuses/user_timeline/{$ds-team-profile}.xml';
		public $dsParamXPATH = '/statuses/status[position() &lt; 3]';
		public $dsParamCACHE = '30';
		public $dsParamTIMEOUT = '6';
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-team-profile');
		}
		
		public function about(){
			return array(
					 'name' => 'Twitter: Team',
					 'author' => array(
							'name' => 'Organization',
							'website' => 'http://example.com',
							'email' => 'hello@example.com'),
					 'version' => '1.0',
					 'release-date' => '2010-05-11T01:24:47+00:00');	
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

