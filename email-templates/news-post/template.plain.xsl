<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates select="data/etm-news/entry" />
---
<xsl:value-of select="$website-name" /> News
<xsl:value-of select="concat($root, '/news/')" />
</xsl:template>

<xsl:template match="data/etm-news/entry">
	<xsl:param name="author" select="author/item" />
	<xsl:param name="commenter" select="/data/forum-subscription-members/entry[@id = $created-by]/name" /><xsl:value-of select="$author" /> posted a news article:<xsl:text>

</xsl:text>
<xsl:value-of select="title" /><xsl:text>
</xsl:text>(<xsl:value-of select="concat($root, '/news/', title/@handle, '/')" />)<xsl:text>

</xsl:text><xsl:value-of select="body[@mode = 'unformatted']" />
<xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>