<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<xsl:apply-templates select="data/etm-member/entry" />
---
<xsl:value-of select="$website-name" />
<xsl:value-of select="concat($root, '/')" />
</xsl:template>

<xsl:template match="data/etm-member/entry">Dear <xsl:value-of select="name" />,

Your account has been successfully activated and you are now able to <xsl:value-of select="$website-name" />. To access the site, use your <xsl:value-of select="$website-name" /> Google Apps account email, or enter your username and password at the login page: <xsl:value-of select="concat($root, '/login/')" />.

If you have problems accessing your account, please contact our site administrator at hello@example.com and we'll do our best to help.

Regards,

</xsl:template>

</xsl:stylesheet>