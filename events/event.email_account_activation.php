<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventemail_account_activation extends Event{

		const ROOTELEMENT = 'email-account-activation';

		public $eParamFILTERS = array(
			'etm-account-activation'
		);

		public static function about(){
			return array(
				'name' => 'Email Account Activation',
				'author' => array(
					'name' => 'Organization',
					'website' => 'http://example.com/',
					'email' => 'hello@example.com'),
				'version' => '1.0',
				'release-date' => '2011-04-03T15:21:34+00:00',
				'trigger-condition' => 'action[email-account-activation]'
			);
		}

		public static function getSource(){
			return '1';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;email-account-activation result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/email-account-activation></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;email-account-activation result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/email-account-activation></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;email-account-activation result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/email-account-activation></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;label>Username
    &lt;input name="fields[username]" type="text" />
  &lt;/label>
  &lt;fieldset>
    &lt;label>Password
      &lt;input name="fields[password][password]" type="password" />
    &lt;/label>
    &lt;label>Password Confirm
      &lt;input name="fields[password][confirm]" type="password" />
    &lt;/label>
  &lt;/fieldset>
  &lt;label>Email Address
    &lt;input name="fields[email-address]" type="text" />
  &lt;/label>
  &lt;label>Role
    &lt;select name="fields[role]">
      &lt;option value="Public">Public&lt;/option>
      &lt;option value="Inactive">Inactive&lt;/option>
      &lt;option value="Member">Member&lt;/option>
      &lt;option value="Administrator">Administrator&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Activation
    &lt;input name="fields[activation]" type="text" />
  &lt;/label>
  &lt;label>Website
    &lt;input name="fields[website]" type="text" />
  &lt;/label>
  &lt;label>Location
    &lt;input name="fields[location]" type="text" />
  &lt;/label>
  &lt;label>City
    &lt;input name="fields[city]" type="text" />
  &lt;/label>
  &lt;label>Timezone
    &lt;select name="fields[timezone]">
      &lt;option value="Adak -09:00">Adak -09:00&lt;/option>
      &lt;option value="Anchorage -08:00">Anchorage -08:00&lt;/option>
      &lt;option value="Anguilla -04:00">Anguilla -04:00&lt;/option>
      &lt;option value="Antigua -04:00">Antigua -04:00&lt;/option>
      &lt;option value="Araguaina -03:00">Araguaina -03:00&lt;/option>
      &lt;option value="Buenos Aires -03:00">Buenos Aires -03:00&lt;/option>
      &lt;option value="Catamarca -03:00">Catamarca -03:00&lt;/option>
      &lt;option value="Cordoba -03:00">Cordoba -03:00&lt;/option>
      &lt;option value="Jujuy -03:00">Jujuy -03:00&lt;/option>
      &lt;option value="La Rioja -03:00">La Rioja -03:00&lt;/option>
      &lt;option value="Mendoza -03:00">Mendoza -03:00&lt;/option>
      &lt;option value="Rio Gallegos -03:00">Rio Gallegos -03:00&lt;/option>
      &lt;option value="Salta -03:00">Salta -03:00&lt;/option>
      &lt;option value="San Juan -03:00">San Juan -03:00&lt;/option>
      &lt;option value="San Luis -03:00">San Luis -03:00&lt;/option>
      &lt;option value="Tucuman -03:00">Tucuman -03:00&lt;/option>
      &lt;option value="Ushuaia -03:00">Ushuaia -03:00&lt;/option>
      &lt;option value="Aruba -04:00">Aruba -04:00&lt;/option>
      &lt;option value="Asuncion -03:00">Asuncion -03:00&lt;/option>
      &lt;option value="Atikokan -05:00">Atikokan -05:00&lt;/option>
      &lt;option value="Bahia -03:00">Bahia -03:00&lt;/option>
      &lt;option value="Bahia Banderas -05:00">Bahia Banderas -05:00&lt;/option>
      &lt;option value="Barbados -04:00">Barbados -04:00&lt;/option>
      &lt;option value="Belem -03:00">Belem -03:00&lt;/option>
      &lt;option value="Belize -06:00">Belize -06:00&lt;/option>
      &lt;option value="Blanc-Sablon -04:00">Blanc-Sablon -04:00&lt;/option>
      &lt;option value="Boa Vista -04:00">Boa Vista -04:00&lt;/option>
      &lt;option value="Bogota -05:00">Bogota -05:00&lt;/option>
      &lt;option value="Boise -06:00">Boise -06:00&lt;/option>
      &lt;option value="Cambridge Bay -06:00">Cambridge Bay -06:00&lt;/option>
      &lt;option value="Campo Grande -04:00">Campo Grande -04:00&lt;/option>
      &lt;option value="Cancun -05:00">Cancun -05:00&lt;/option>
      &lt;option value="Caracas -04:30">Caracas -04:30&lt;/option>
      &lt;option value="Cayenne -03:00">Cayenne -03:00&lt;/option>
      &lt;option value="Cayman -05:00">Cayman -05:00&lt;/option>
      &lt;option value="Chicago -05:00">Chicago -05:00&lt;/option>
      &lt;option value="Chihuahua -06:00">Chihuahua -06:00&lt;/option>
      &lt;option value="Costa Rica -06:00">Costa Rica -06:00&lt;/option>
      &lt;option value="Cuiaba -04:00">Cuiaba -04:00&lt;/option>
      &lt;option value="Curacao -04:00">Curacao -04:00&lt;/option>
      &lt;option value="Danmarkshavn +00:00">Danmarkshavn +00:00&lt;/option>
      &lt;option value="Dawson -07:00">Dawson -07:00&lt;/option>
      &lt;option value="Dawson Creek -07:00">Dawson Creek -07:00&lt;/option>
      &lt;option value="Denver -06:00">Denver -06:00&lt;/option>
      &lt;option value="Detroit -04:00">Detroit -04:00&lt;/option>
      &lt;option value="Dominica -04:00">Dominica -04:00&lt;/option>
      &lt;option value="Edmonton -06:00">Edmonton -06:00&lt;/option>
      &lt;option value="Eirunepe -04:00">Eirunepe -04:00&lt;/option>
      &lt;option value="El Salvador -06:00">El Salvador -06:00&lt;/option>
      &lt;option value="Fortaleza -03:00">Fortaleza -03:00&lt;/option>
      &lt;option value="Glace Bay -03:00">Glace Bay -03:00&lt;/option>
      &lt;option value="Godthab -02:00">Godthab -02:00&lt;/option>
      &lt;option value="Goose Bay -03:00">Goose Bay -03:00&lt;/option>
      &lt;option value="Grand Turk -04:00">Grand Turk -04:00&lt;/option>
      &lt;option value="Grenada -04:00">Grenada -04:00&lt;/option>
      &lt;option value="Guadeloupe -04:00">Guadeloupe -04:00&lt;/option>
      &lt;option value="Guatemala -06:00">Guatemala -06:00&lt;/option>
      &lt;option value="Guayaquil -05:00">Guayaquil -05:00&lt;/option>
      &lt;option value="Guyana -04:00">Guyana -04:00&lt;/option>
      &lt;option value="Halifax -03:00">Halifax -03:00&lt;/option>
      &lt;option value="Havana -04:00">Havana -04:00&lt;/option>
      &lt;option value="Hermosillo -07:00">Hermosillo -07:00&lt;/option>
      &lt;option value="Indianapolis -04:00">Indianapolis -04:00&lt;/option>
      &lt;option value="Knox -05:00">Knox -05:00&lt;/option>
      &lt;option value="Marengo -04:00">Marengo -04:00&lt;/option>
      &lt;option value="Petersburg -04:00">Petersburg -04:00&lt;/option>
      &lt;option value="Tell City -05:00">Tell City -05:00&lt;/option>
      &lt;option value="Vevay -04:00">Vevay -04:00&lt;/option>
      &lt;option value="Vincennes -04:00">Vincennes -04:00&lt;/option>
      &lt;option value="Winamac -04:00">Winamac -04:00&lt;/option>
      &lt;option value="Inuvik -06:00">Inuvik -06:00&lt;/option>
      &lt;option value="Iqaluit -04:00">Iqaluit -04:00&lt;/option>
      &lt;option value="Jamaica -05:00">Jamaica -05:00&lt;/option>
      &lt;option value="Juneau -08:00">Juneau -08:00&lt;/option>
      &lt;option value="Louisville -04:00">Louisville -04:00&lt;/option>
      &lt;option value="Monticello -04:00">Monticello -04:00&lt;/option>
      &lt;option value="La Paz -04:00">La Paz -04:00&lt;/option>
      &lt;option value="Lima -05:00">Lima -05:00&lt;/option>
      &lt;option value="Los Angeles -07:00">Los Angeles -07:00&lt;/option>
      &lt;option value="Maceio -03:00">Maceio -03:00&lt;/option>
      &lt;option value="Managua -06:00">Managua -06:00&lt;/option>
      &lt;option value="Manaus -04:00">Manaus -04:00&lt;/option>
      &lt;option value="Marigot -04:00">Marigot -04:00&lt;/option>
      &lt;option value="Martinique -04:00">Martinique -04:00&lt;/option>
      &lt;option value="Matamoros -05:00">Matamoros -05:00&lt;/option>
      &lt;option value="Mazatlan -06:00">Mazatlan -06:00&lt;/option>
      &lt;option value="Menominee -05:00">Menominee -05:00&lt;/option>
      &lt;option value="Merida -05:00">Merida -05:00&lt;/option>
      &lt;option value="Mexico City -05:00">Mexico City -05:00&lt;/option>
      &lt;option value="Miquelon -02:00">Miquelon -02:00&lt;/option>
      &lt;option value="Moncton -03:00">Moncton -03:00&lt;/option>
      &lt;option value="Monterrey -05:00">Monterrey -05:00&lt;/option>
      &lt;option value="Montevideo -03:00">Montevideo -03:00&lt;/option>
      &lt;option value="Montreal -04:00">Montreal -04:00&lt;/option>
      &lt;option value="Montserrat -04:00">Montserrat -04:00&lt;/option>
      &lt;option value="Nassau -04:00">Nassau -04:00&lt;/option>
      &lt;option value="New York -04:00">New York -04:00&lt;/option>
      &lt;option value="Nipigon -04:00">Nipigon -04:00&lt;/option>
      &lt;option value="Nome -08:00">Nome -08:00&lt;/option>
      &lt;option value="Noronha -02:00">Noronha -02:00&lt;/option>
      &lt;option value="Center -05:00">Center -05:00&lt;/option>
      &lt;option value="New Salem -05:00">New Salem -05:00&lt;/option>
      &lt;option value="Ojinaga -06:00">Ojinaga -06:00&lt;/option>
      &lt;option value="Panama -05:00">Panama -05:00&lt;/option>
      &lt;option value="Pangnirtung -04:00">Pangnirtung -04:00&lt;/option>
      &lt;option value="Paramaribo -03:00">Paramaribo -03:00&lt;/option>
      &lt;option value="Phoenix -07:00">Phoenix -07:00&lt;/option>
      &lt;option value="Port-au-Prince -05:00">Port-au-Prince -05:00&lt;/option>
      &lt;option value="Port of Spain -04:00">Port of Spain -04:00&lt;/option>
      &lt;option value="Porto Velho -04:00">Porto Velho -04:00&lt;/option>
      &lt;option value="Puerto Rico -04:00">Puerto Rico -04:00&lt;/option>
      &lt;option value="Rainy River -05:00">Rainy River -05:00&lt;/option>
      &lt;option value="Rankin Inlet -05:00">Rankin Inlet -05:00&lt;/option>
      &lt;option value="Recife -03:00">Recife -03:00&lt;/option>
      &lt;option value="Regina -06:00">Regina -06:00&lt;/option>
      &lt;option value="Resolute -05:00">Resolute -05:00&lt;/option>
      &lt;option value="Rio Branco -04:00">Rio Branco -04:00&lt;/option>
      &lt;option value="Santa Isabel -07:00">Santa Isabel -07:00&lt;/option>
      &lt;option value="Santarem -03:00">Santarem -03:00&lt;/option>
      &lt;option value="Santiago -04:00">Santiago -04:00&lt;/option>
      &lt;option value="Santo Domingo -04:00">Santo Domingo -04:00&lt;/option>
      &lt;option value="Sao Paulo -03:00">Sao Paulo -03:00&lt;/option>
      &lt;option value="Scoresbysund +00:00">Scoresbysund +00:00&lt;/option>
      &lt;option value="Shiprock -06:00">Shiprock -06:00&lt;/option>
      &lt;option value="St Barthelemy -04:00">St Barthelemy -04:00&lt;/option>
      &lt;option value="St Johns -02:30">St Johns -02:30&lt;/option>
      &lt;option value="St Kitts -04:00">St Kitts -04:00&lt;/option>
      &lt;option value="St Lucia -04:00">St Lucia -04:00&lt;/option>
      &lt;option value="St Thomas -04:00">St Thomas -04:00&lt;/option>
      &lt;option value="St Vincent -04:00">St Vincent -04:00&lt;/option>
      &lt;option value="Swift Current -06:00">Swift Current -06:00&lt;/option>
      &lt;option value="Tegucigalpa -06:00">Tegucigalpa -06:00&lt;/option>
      &lt;option value="Thule -03:00">Thule -03:00&lt;/option>
      &lt;option value="Thunder Bay -04:00">Thunder Bay -04:00&lt;/option>
      &lt;option value="Tijuana -07:00">Tijuana -07:00&lt;/option>
      &lt;option value="Toronto -04:00">Toronto -04:00&lt;/option>
      &lt;option value="Tortola -04:00">Tortola -04:00&lt;/option>
      &lt;option value="Vancouver -07:00">Vancouver -07:00&lt;/option>
      &lt;option value="Whitehorse -07:00">Whitehorse -07:00&lt;/option>
      &lt;option value="Winnipeg -05:00">Winnipeg -05:00&lt;/option>
      &lt;option value="Yakutat -08:00">Yakutat -08:00&lt;/option>
      &lt;option value="Yellowknife -06:00">Yellowknife -06:00&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Email Opt-in
    &lt;input name="fields[email-opt-in]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[email-account-activation]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://example.com/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['email-account-activation'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
