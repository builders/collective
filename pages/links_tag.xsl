<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>

<xsl:key name="links-by-tag" match="/data/links/entry/tags/item" use="tags/item"/>

<xsl:template match="data">
	<xsl:param name="tag-item" select="/data/links/entry/tags/item[@handle = $tag]" />
	<section class="main">
		<div class="content">
			<h1>Links: <a href="{$root}/{$root-page}/{$current-page}/{$tag}/" class="tag"><xsl:value-of select="$tag-item" /></a></h1>
			<xsl:apply-templates select="links-by-tag/entry" />
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Links <a href="{$root}/{$root-page}/create/new/" class="button add" title="Create a link">+</a></h3>
			<h4>Tags</h4>
			<ul class="tags">
				<xsl:apply-templates select="links/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-menu">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="links-by-tag/entry">
	<article class="excerpt">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h3>
		<p class="description">
			<xsl:value-of select="note[@mode='formatted']/p[1]" />
			<xsl:if test="url"><xsl:if test="note[@mode='formatted']/p[1]"><br /></xsl:if><a href="{url}"><xsl:value-of select="url" /></a></xsl:if>
		</p>
	</article>
</xsl:template>

<xsl:template name="link-meta">
	<p class="resource-meta">
		<xsl:text>Lasted updated </xsl:text> 
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date" />
			<xsl:with-param name="format" select="'M x, Y, t'" />
		</xsl:call-template>
		<xsl:text> by </xsl:text>
		<a href="{$root}/people/{author/item/@handle}/"><xsl:value-of select="author" /></a>
		<xsl:text> | </xsl:text>
		<a href="{$root}/{$root-page}/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/links/edit/{@id}/" title="Edit this resource in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="item" mode="tags-links">
	<a href="{$root}/{$root-page}/{$current-page}/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
	<xsl:if test="position() != last()">, </xsl:if>
</xsl:template>

<xsl:template match="item" mode="tags-menu">
	<li>
		<a href="{$root}/{$root-page}/{$current-page}/{@handle}/" rel="tag">
			<xsl:if test="@handle = $tag"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
			<xsl:value-of select="." />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>