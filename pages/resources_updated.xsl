<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1>Resources</h1>
			<h2>
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="concat($year, '-', $month, '-01')" />
					<xsl:with-param name="format" select="'M Y'" />
				</xsl:call-template>
			</h2>
			<xsl:apply-templates select="resources-by-date/year[@value = $year]/month[@value = $month]/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Resources</h3>
			<h4>Updated</h4>
			<ul class="menu list-menu list-menu-meta">
				<xsl:apply-templates select="resources-by-date/year/month" mode="list-dates" />
			</ul>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="resources-by-date/year/month/entry">
	<article class="excerpt">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h3>
		<p class="description">
			<xsl:value-of select="description[@mode='formatted']/p[1]" />
			<xsl:if test="url"><br /><a href="{url}"><xsl:value-of select="substring-after(url,'http://')" /></a></xsl:if>
		</p>
		<xsl:if test="tags/item">
			<p class="tags-links">
				Tags: <xsl:apply-templates select="tags/item" mode="tags-links" />
			</p>
		</xsl:if>
		<xsl:call-template name="resource-meta" />
	</article>
</xsl:template>

<xsl:template match="item" mode="tags-links">
	<a href="{$root}/{$root-page}/tag/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
	<xsl:if test="position() != last()">, </xsl:if>
</xsl:template>

<xsl:template name="resource-meta">
	<p class="resource-meta">
		<xsl:text>Lasted updated </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date" />
			<xsl:with-param name="format" select="'M x, Y, t'" />
		</xsl:call-template>
		<xsl:text> by </xsl:text>
		<a href="{$root}/people/{author/item/@handle}/"><xsl:value-of select="author" /></a>
		<xsl:text> | </xsl:text>
		<a href="{$root}/resources/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/resources/edit/{@id}/" title="Edit this resource in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="resources-by-date/year/month" mode="list-dates">
	<li>
		<a href="{$root}/resources/updated/{../@value}/{@value}/">
			<xsl:if test="../@value = $year and @value = $month"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="entry/date"/>
				<xsl:with-param name="format" select="'M Y'"/>
			</xsl:call-template>
		</a>
		<span><xsl:text> (</xsl:text><xsl:value-of select="count(entry)"/>)</span>
	</li>
</xsl:template>

</xsl:stylesheet>