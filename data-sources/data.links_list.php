<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcelinks_list extends Datasource{
		
		public $dsParamROOTELEMENT = 'links-list';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '50';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'title';
		public $dsParamSTARTPAGE = '1';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		
		public $dsParamFILTERS = array(
				'129' => 'Organization',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'url'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Links List',
					 'author' => array(
							'name' => 'Organization',
							'website' => 'http://example.com',
							'email' => 'hello@example.com'),
					 'version' => '1.0',
					 'release-date' => '2011-02-11T23:34:08+00:00');	
		}
		
		public function getSource(){
			return '23';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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

