<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceetm_news extends Datasource{

		public $dsParamROOTELEMENT = 'etm-news';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$etm-entry-id';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$etm-entry-id}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'body: formatted',
				'body: unformatted',
				'author',
				'date',
				'emailed',
				'categories',
				'tags',
				'publish'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'ETM News',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com-members',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-05-04T22:04:34+00:00'
			);
		}

		public function getSource(){
			return '20';
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
