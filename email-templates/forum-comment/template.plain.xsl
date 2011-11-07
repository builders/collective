<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates select="data/etm-comment/entry" />
---
<xsl:value-of select="$website-name" /> Forum
<xsl:value-of select="concat($root, '/forum/')" />
</xsl:template>

<xsl:template match="data/etm-comment/entry">
	<xsl:param name="created-by" select="created-by/item/@id" />
	<xsl:param name="commenter" select="/data/forum-subscription-members/entry[@id = $created-by]/name" /><xsl:value-of select="$commenter" /> commented on the discussion:<xsl:text>

</xsl:text>
<xsl:value-of select="parent-id/item" /><xsl:text>
</xsl:text>(<xsl:value-of select="/data/events/forum-new-comment/post-values/comment-position" />)<xsl:text>

</xsl:text><xsl:value-of select="comment[@mode = 'unformatted']" />
<xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>