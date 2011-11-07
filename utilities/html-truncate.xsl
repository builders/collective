<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 	xmlns:exsl="http://exslt.org/common" 	extension-element-prefixes="exsl">

<!--
Name: HTML Truncate
Version: 1.0
Author: Allen Chang <allen@chaoticpattern.com>
URL: http://symphony21.com/downloads/xslt/file/20036/

Parameters:
* limit (optional) number of characters to limit by
* suffix (optional) the suffix character string to use when the text is truncated

Example:
<xsl:apply-templates select="path/to/your/body" mode="truncate"/>
-->

<xsl:strip-space elements="*"/>

<xsl:template match="body" mode="truncate">
	<xsl:param name="limit" select="250"/>
	<xsl:param name="suffix" select="'&#8230;'"/>

	<xsl:variable name="body">
		<xsl:copy-of select="*"/>
	</xsl:variable>

	<xsl:apply-templates select="exsl:node-set($body)/*" mode="truncate">
		<xsl:with-param name="limit" select="$limit"/>
		<xsl:with-param name="suffix" select="$suffix"/>
	</xsl:apply-templates>

</xsl:template>

<xsl:template match="body" mode="truncate-paragraphs">
	<xsl:param name="limit" select="250"/>
	<xsl:param name="suffix" select="'&#8230;'"/>

	<xsl:variable name="body">
		<xsl:copy-of select="*"/>
	</xsl:variable>

	<xsl:apply-templates select="exsl:node-set($body)/p[string-length() &gt; 30]" mode="truncate">
		<xsl:with-param name="limit" select="$limit"/>
		<xsl:with-param name="suffix" select="$suffix"/>
	</xsl:apply-templates>

</xsl:template>

<xsl:template match="description" mode="truncate">
	<xsl:param name="limit" select="250"/>
	<xsl:param name="suffix" select="'&#8230;'"/>

	<xsl:variable name="body">
		<xsl:copy-of select="*"/>
	</xsl:variable>

	<xsl:apply-templates select="exsl:node-set($body)/*" mode="truncate">
		<xsl:with-param name="limit" select="$limit"/>
		<xsl:with-param name="suffix" select="$suffix"/>
	</xsl:apply-templates>

</xsl:template>

<xsl:template match="*" mode="truncate">
	<xsl:param name="limit"/>
	<xsl:param name="suffix"/>

	<xsl:variable name="preceding-strings">
		<xsl:copy-of select="preceding::text()"/>
	</xsl:variable>

	<!-- p: number of characters up to the current node -->
	<xsl:variable name="p" select="string-length(normalize-space($preceding-strings))"/>

	<xsl:if test="$p &lt; $limit">
		<xsl:element name="{name()}">
			<xsl:apply-templates mode="truncate">
				<xsl:with-param name="limit" select="$limit"/>
				<xsl:with-param name="suffix" select="$suffix"/>
			</xsl:apply-templates>
		</xsl:element>
	</xsl:if>
</xsl:template>

<xsl:template match="text()" mode="truncate">
	<xsl:param name="limit"/>
	<xsl:param name="suffix"/>

	<xsl:variable name="preceding-strings">
		<xsl:copy-of select="preceding::text()"/>
	</xsl:variable>

	<!-- p: number of characters up to the current node -->
	<xsl:variable name="p" select="string-length(normalize-space($preceding-strings))"/>

	<!-- c: number of characters including current node -->
	<xsl:variable name="c" select="$p + string-length(.)"/>

	<xsl:choose>
		<xsl:when test="$limit &lt;= $c">
			<xsl:value-of select="substring(., 1, ($limit - $p))"/>
			<xsl:value-of select="$suffix"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="@*" mode="truncate">
    <xsl:attribute name="{name(.)}">
        <xsl:value-of select="."/>
    </xsl:attribute>
</xsl:template>

</xsl:stylesheet>