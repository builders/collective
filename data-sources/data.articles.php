<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcearticles extends Datasource{

		public $dsParamROOTELEMENT = 'articles';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '10';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'author';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'54' => '{$article}',
				'56' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'alternate-title',
				'body: formatted',
				'author',
				'date',
				'categories',
				'article-image',
				'tags',
				'publish',
				'embed'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Articles',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-10-05T20:49:40+00:00'
			);
		}

		public function getSource(){
			return '10';
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
