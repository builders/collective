<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcenews_by_category extends Datasource{

		public $dsParamROOTELEMENT = 'news-by-category';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '10';
		public $dsParamSTARTPAGE = '{$page}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$category';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'118' => '{$category}',
				'120' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'body: formatted',
				'date',
				'author',
				'categories',
				'tags'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'News by Category',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-10-13T18:50:54+00:00'
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
