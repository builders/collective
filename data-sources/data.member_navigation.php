<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcemember_navigation extends Datasource{
		
		public $dsParamROOTELEMENT = 'member-navigation';
		public $dsParamORDER = 'desc';
		public $dsParamREDIRECTONEMPTY = 'no';
		
		public $dsParamFILTERS = array(
				'type' => 'member',
		);
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Member Navigation',
					 'author' => array(
							'name' => 'Organization',
							'website' => 'http://example.com',
							'email' => 'hello@example.com'),
					 'version' => '1.0',
					 'release-date' => '2010-11-19T20:45:24+00:00');	
		}
		
		public function getSource(){
			return 'navigation';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.navigation.php');
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

