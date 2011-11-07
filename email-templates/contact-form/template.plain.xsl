<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates />
	<xsl:text>

------
This message was also saved to the <xsl:value-of select="$website-name" /> site. Log in as a site author/administrator to view the message here: </xsl:text><xsl:value-of select="concat($root, '/symphony/publish/contact-form/edit/', $etm-entry-id, '/')" />.
</xsl:template>

<xsl:template match="data/events/send-message/post-values">
<xsl:text>From: </xsl:text>
<xsl:value-of select="name" />
<xsl:text>
Email: </xsl:text>
<xsl:value-of select="email" />
<xsl:text>
Subject: </xsl:text>
<xsl:value-of select="*[name() = ../subject]" />
<xsl:text>
Message:
</xsl:text>
<xsl:value-of select="message" />
</xsl:template>

</xsl:stylesheet>