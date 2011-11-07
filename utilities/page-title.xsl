<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page-title">
	<xsl:param name="site-name" select="$website-name" />
	<!-- If a work entry page -->
	<xsl:if test="$current-page = 'projects'">
		<xsl:value-of select="data/work-entry/entry/title" />
		<xsl:text> | </xsl:text>
	</xsl:if>
	<!-- If not the homepage -->
	<xsl:if test="$current-path != '/'">
		<xsl:value-of select="$page-title" />
		<xsl:text> | </xsl:text>
	</xsl:if>
	<xsl:value-of select="$site-name" />	
</xsl:template>

</xsl:stylesheet>