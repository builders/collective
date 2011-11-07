<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceforum_discussion_subscriber extends Datasource{

		public $dsParamROOTELEMENT = 'forum-discussion-subscriber';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '100';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'160' => '{$discussion-id}',
				'161' => '{$member-id}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'discussion-topic',
				'subscriber',
				'subscribe'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Forum: Discussion Subscriber',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com-members',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-05-04T16:27:22+00:00'
			);
		}

		public function getSource(){
			return '25';
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
