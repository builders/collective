<?xml version="1.0" encoding="UTF-8"?>
<!--
	Name: Get Google Map
	Version: 1.3 (now built for Google Maps API v3 w/ multiple map support)
	Changes: Need API Key for Geocode support. This changed when Google added their language support in v3
	Author: Brian Zerangue <brian.zerangue@gmail.com>
	URL: http://symphony-cms.com/downloads/xslt/file/25937/

	====================
	Description:
	====================
	Easily add a Google Map to your website.

	====================
	Steps to use:
	====================

1) Get Google Maps API Key (for geocoding support)

2) In the <xsl:variable> api-key, replace YOUR_API_KEY_HERE, with your Google Maps API Key

3) Insert the following meta element and script element in the head element of your html

		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<script type="text/javascript" src="http://www.google.com/jsapi?autoload=%7Bmodules%3A%5B%7Bname%3A%22maps%22%2Cversion%3A3%2Cother_params%3A%22sensor%3Dfalse%22%7D%5D%7D&key=MY_KEY"></script>

4) Import your template via xsl:import


5) Call the template get-google-map and populate the with-param statements with the fields you have setup in Symphony.

		<xsl:call-template name="get-google-map">
			<xsl:with-param name="map-type" select="'HYBRID'"/>
			<xsl:with-param name="zoom-level" select="'17'"/>
			<xsl:with-param name="location-name" select="location"/>
			<xsl:with-param name="street-address" select="address"/>
			<xsl:with-param name="city" select="city"/>
			<xsl:with-param name="state" select="state"/>
			<xsl:with-param name="zip-code" select="zip"/>
			<xsl:with-param name="map-width" select="'500px'"/>
			<xsl:with-param name="map-height" select="'350px'"/>
		</xsl:call-template>

6) If you want to add multiple maps, call the templates but make sure to call the with-param name="map-id" and name your map id. Like so...

		<xsl:call-template name="get-google-map">
			<xsl:with-param name="map-type" select="'HYBRID'"/>
			<xsl:with-param name="zoom-level" select="'17'"/>
			<xsl:with-param name="location-name" select="location"/>
			<xsl:with-param name="street-address" select="address"/>
			<xsl:with-param name="city" select="city"/>
			<xsl:with-param name="state" select="state"/>
			<xsl:with-param name="zip-code" select="zip"/>
			<xsl:with-param name="map-width" select="'500px'"/>
			<xsl:with-param name="map-height" select="'350px'"/>
		</xsl:call-template>
	
		<xsl:call-template name="get-google-map">
			<xsl:with-param name="map-id" select="'map_canvas_2'"/>
			<xsl:with-param name="map-type" select="'HYBRID'"/>
			<xsl:with-param name="zoom-level" select="'17'"/>
			<xsl:with-param name="location-name" select="location"/>
			<xsl:with-param name="street-address" select="address"/>
			<xsl:with-param name="city" select="city"/>
			<xsl:with-param name="state" select="state"/>
			<xsl:with-param name="zip-code" select="zip"/>
			<xsl:with-param name="map-width" select="'500px'"/>
			<xsl:with-param name="map-height" select="'350px'"/>
		</xsl:call-template>


	### END OF INSTRUCTIONS ###
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" />
	<xsl:variable name="api-key" select="'ABQIAAAAihThs35NoITOs-KGlIhIMhShvXvXqkLglUNM1k_l7CVITzmc3xScsKnhrQPLa0BNbnYFmaa-RMbWfw'"/>
	<xsl:template name="get-google-map">
		<xsl:param name="map-id"/>
		<xsl:param name="map-width"/>
		<xsl:param name="map-height"/>
		<xsl:param name="location-name"/>
		<xsl:param name="street-address"/>
		<xsl:param name="city"/>
		<xsl:param name="state"/>
		<xsl:param name="zip-code"/>
		<xsl:param name="location-full-address" select="concat($street-address,' ',$city,' ',$state,' ',$zip-code)"/>
		<xsl:param name="location-no-city-address" select="concat($street-address,' ',$state,' ',$zip-code)"/>
		<xsl:param name="zoom-level"/>
		<!-- Map Type : Default = ROADMAP / Other Options = SATELLITE, HYBRID, OR TERRAIN -->
		<xsl:param name="map-type"/>
		<xsl:param name="latlong">
			<xsl:choose>
				<xsl:when test="remove-city-from-google-map='Yes'">
					<xsl:call-template name="geocode">
						<xsl:with-param name="address" select="$location-no-city-address"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="geocode">
						<xsl:with-param name="address" select="$location-full-address"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="directions-to-map-link">
			<xsl:value-of select="concat('http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=',translate($location-full-address,' ','+'),',&amp;iwstate1=dir:to')"/>
		</xsl:param>

		<xsl:if test="$location-full-address!=''">
			<script type="text/javascript">
				function initialize() {
					var myLatLng = new google.maps.LatLng(<xsl:value-of select="$latlong"/>);
					var myOptions = {
						zoom: <xsl:choose><xsl:when test="$zoom-level!=''"><xsl:value-of select="$zoom-level"/></xsl:when><xsl:otherwise><xsl:text>14</xsl:text></xsl:otherwise></xsl:choose>,
						center: myLatLng,
						mapTypeId: google.maps.MapTypeId.<xsl:choose><xsl:when test="$map-type!=''"><xsl:value-of select="$map-type"/></xsl:when><xsl:otherwise><xsl:text>ROADMAP</xsl:text></xsl:otherwise></xsl:choose>
					}
					var map = new google.maps.Map(document.getElementById("<xsl:choose><xsl:when test="$map-id!=''"><xsl:value-of select="$map-id"/></xsl:when><xsl:otherwise><xsl:text>map_canvas</xsl:text></xsl:otherwise></xsl:choose>"), myOptions);
					var marker = new google.maps.Marker({
							position: myLatLng,
							map: map
						});
					var infowindow = new google.maps.InfoWindow({
							content: '<strong><xsl:value-of select="$location-name"/></strong><br/><xsl:value-of select="$location-full-address"/><br/><a href="{$directions-to-map-link}">Get Directions</a>',
							position: myLatLng
						});
					infowindow.open(map);
				}
				google.setOnLoadCallback(initialize);
			</script>
			<div id="event_map">
				<xsl:choose>
					<xsl:when test="$map-id!=''"><div id="{$map-id}" style="width: {$map-width}; height: {$map-height}; border: 7px solid #ddd;"></div></xsl:when>
					<xsl:otherwise><div id="map_canvas" style="width: {$map-width}; height: {$map-height}; border: 7px solid #ddd;"><!--Maps Here--></div></xsl:otherwise>
				</xsl:choose>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template name="geocode">
		<xsl:param name="address"/>
		<xsl:variable name="encodedAddress">
			<xsl:value-of select="translate($address,' ','+')"/>
		</xsl:variable>
		<xsl:variable name="urlString">http://maps.google.com/maps/geo?q=<xsl:value-of select="$encodedAddress"/>&amp;output=xml&amp;oe=utf8&amp;sensor=false&amp;key=<xsl:value-of select="$api-key"/></xsl:variable>

		<xsl:variable name="geocoder" select="document($urlString)"/>
		<xsl:for-each select="$geocoder//*[name()='coordinates']">
			<xsl:if test="position() = 1">
				<xsl:value-of select="substring-after(substring-before(text(),',0'),',')"/><xsl:text>, </xsl:text><xsl:value-of select="substring-before(substring-before(text(),',0'),',')"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>