<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl" />
<xsl:import href="../utilities/html-manipulation.xsl" />

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/resources.js"></script>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Resources</h3>
			<h4>Topics <a href="{$root}/resources/topics/create/new/" class="button add" title="Add a topic">+</a></h4>
			<ul class="menu list-menu topics">
				<li>
					<a href="{$root}/{$root-page}/{$current-page}/">
						<xsl:if test="$topic = ''"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
						All Topics
					</a>
				</li>
				<xsl:apply-templates select="resources/entry/topic/item[not(. = ../../preceding-sibling::entry/topic/item)]" mode="topics-menu">
					<xsl:sort />
				</xsl:apply-templates>
			</ul>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1><xsl:value-of select="$page-title" /></h1>
			<xsl:apply-templates select="topics/entry[@id = /data/resources-by-topic/topic/@link-id]" />
		</div>
	</section>
</xsl:template>

<xsl:template match="topics/entry">
	<h2><xsl:value-of select="title" /></h2>
	<xsl:apply-templates select="/data/resources-by-topic/topic[@link-id = current()/@id]/entry" />
</xsl:template>

<xsl:template match="resources-by-topic/topic/entry">
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
	<a href="{$root}/{$root-page}/{$current-page}/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
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
		<a href="{$root}/{$root-page}/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/resources/edit/{@id}/" title="Edit this resource in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="*" mode="tags">
	<xsl:value-of select="." />
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="item" mode="tags-list">
	<li><xsl:value-of select="." /></li>
</xsl:template>

<xsl:template match="item" mode="tags-menu">
	<li><a href="{$root}/{$current-page}/tag/{@handle}/" rel="tag"
		title="Entries tagged with '{.}': {count(/data/resources/entry[tags/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

<xsl:template match="item" mode="topics-menu">
	<li>
		<a href="{$root}/{$root-page}/topic/{@handle}/"
		title="Entries in the '{.}' library: {count(/data/resources/entry[topics/item = current()])}">
			<xsl:if test="$topic = @handle"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
			<xsl:value-of select="." />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>