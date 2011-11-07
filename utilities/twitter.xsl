<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
    extension-element-prefixes="date">

<xsl:import href="linkahashify.xsl"/>
<xsl:import href="twitter-format-date.xsl"/>
<xsl:import href="time-ago-friendly.xsl"/>

<xsl:template name="list-tweets">
	<xsl:param name="twitter-date-created">
		<xsl:call-template name="twitter-format-date">
			<xsl:with-param name="date" select="created_at" />
			<xsl:with-param name="format" select="'Y-n-dTO'" />
		</xsl:call-template>
	</xsl:param>
	<xsl:param name="timezone-adjusted-date" select="date:add($twitter-date-created, '-PT7H')" />
	<li>
		<xsl:call-template name="linkahashify">
			<xsl:with-param name="tweet" select="text" />
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<a class="time" href="http://twitter.com/{user/screen_name}/statuses/{id}">
			<xsl:call-template name="time-ago">
				<xsl:with-param name="date-and-time" select="$timezone-adjusted-date" />
			</xsl:call-template>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>
