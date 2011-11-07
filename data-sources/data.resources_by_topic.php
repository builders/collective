<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceresources_by_topic extends Datasource{

		public $dsParamROOTELEMENT = 'resources-by-topic';
		public $dsParamORDER = 'asc';
		public $dsParamGROUP = '99';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '100';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'title';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'99' => '{$topic}',
				'86' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'url',
				'description: formatted',
				'author',
				'topic',
				'tags',
				'date'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Resources by Topic',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-05-16T04:36:08+00:00'
			);
		}

		public function getSource(){
			return '15';
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
