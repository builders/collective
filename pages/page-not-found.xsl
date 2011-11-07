<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/page-not-found.xsl"/>

<xsl:template name="tagline">
	<h2 id="tagline">Good News!</h2>
</xsl:template>

<xsl:template match="data">
	<div id="content" class="page-not-found">
		<xsl:call-template name="page-not-found" />
	</div>
</xsl:template>

</xsl:stylesheet>