<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceteam_profile extends Datasource{

		public $dsParamROOTELEMENT = 'team-profile';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamPARAMOUTPUT = 'twitter';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'22' => '{$team-member}',
				'91' => 'yes',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'member',
				'first-name',
				'last-name',
				'title',
				'biography: formatted',
				'phone',
				'blog',
				'twitter',
				'flickr',
				'photo',
				'avatar',
				'birthday'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Team Profile',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-09-07T03:12:05+00:00'
			);
		}

		public function getSource(){
			return '4';
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
