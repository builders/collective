<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/pagination.css?v1.0" />
</xsl:template>

<xsl:template match="data">
	<xsl:param name="tag-item" select="/data/news-by-tag/entry/tags/item[@handle = $tag]" />
	<section class="main">
		<div class="content">
			<h1>News: <a href="{$root}/{$root-page}/{$current-page}/{$tag}/" class="tag"><xsl:value-of select="$tag-item" /></a></h1>
			<xsl:apply-templates select="news-by-tag/entry" />
			<xsl:call-template name="pagination">
				<xsl:with-param name="pagination-element" select="news-by-tag/pagination" />
				<xsl:with-param name="display-number" select="'7'" />
				<xsl:with-param name="url" select="concat($root, '/news/tag/', $tag, '/$/')" />
			</xsl:call-template>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>News <a href="{$root}/news/create/new/" class="button add" title="Add an article">+</a></h3>
			<ul class="menu list-menu">
				<xsl:apply-templates select="news-archive/year/month/entry" />
			</ul>
			<h4>News Categories</h4>
			<ul class="menu list-menu list-menu-meta">
				<li><a href="{$root}/news/">
					All Posts</a></li>
				<xsl:apply-templates select="news-topics/entry[@news != 0]" />
			</ul>
			<h4>News Archive</h4>
			<ul class="menu list-menu list-menu-meta">
				<xsl:apply-templates select="news-archive/year/month" />
			</ul>
			<h4>Tags</h4>
			<ul class="tags">
				<xsl:apply-templates select="news-tags/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-menu">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="news-archive/year/month/entry">
	<xsl:param name="date">
		<xsl:text>Posted by </xsl:text>
		<xsl:value-of select="author/item" />
		<xsl:text> on </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date"/>
			<xsl:with-param name="format" select="'M x, Y'"/>
		</xsl:call-template>
	</xsl:param>
	<li>
		<a href="{$root}/news/{title/@handle}/" title="{$date}">
			<xsl:value-of select="title" />
		</a>
	</li>
</xsl:template>

<xsl:template match="news-archive/year/month">
	<li>
		<a href="{$root}/news/archive/{../@value}/{@value}/">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="entry/date"/>
				<xsl:with-param name="format" select="'M Y'"/>
			</xsl:call-template>
		</a>
		<span><xsl:text> (</xsl:text><xsl:value-of select="count(entry)"/>)</span>
	</li>
</xsl:template>

<xsl:template match="news-topics/entry">
	<li>
		<a href="{$root}/news/category/{title/@handle}/">
			<xsl:value-of select="title" />
		</a>
		<span>(<xsl:value-of select="@news" />)</span>
	</li>
</xsl:template>

<xsl:template match="news-by-tag/entry">
	<article class="excerpt">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h3>
		<p class="description">
			<xsl:value-of select="description[@mode='formatted']/p[1]" />
			<xsl:if test="url"><br /><a href="{url}"><xsl:value-of select="substring-after(url,'http://')" /></a></xsl:if>
		</p>
		<p class="tags-links">
			Tags: <xsl:apply-templates select="tags/item" mode="tags-links" />
		</p>
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
				<a href="{$root}/symphony/publish/news/edit/{@id}/" title="Edit this news article in the Symphony admin area">Admin</a>
			</xsl:if>
		</p>
	</article>
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