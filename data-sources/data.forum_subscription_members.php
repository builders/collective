<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceforum_subscription_members extends Datasource{

		public $dsParamROOTELEMENT = 'forum-subscription-members';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '100';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$ds-forum-discussion-subscribers';
		public $dsParamSORT = 'username';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$ds-forum-discussion-subscribers}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'username',
				'email-address',
				'role'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-forum-discussion-subscribers');
		}

		public function about(){
			return array(
				'name' => 'Forum: Subscription Members',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com-members',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-05-04T00:00:27+00:00'
			);
		}

		public function getSource(){
			return '1';
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
