<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>

<xsl:param name="count" select="0"/>

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/lists.css?v1.0" />
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<xsl:choose>
				<xsl:when test="$logged-in = 'yes'">
					<h1>Hello, <xsl:value-of select="member-details/entry/first-name" /></h1>
				</xsl:when>
				<xsl:when test="$is-logged-in = 'true'">
					<h1>Hello, <xsl:value-of select="author-details/entry/first-name" /></h1>
					<p>You are currently logged in as a site administrator: 
					<a href="{$root}/symphony/system/authors/edit/{$author-id}/"><xsl:value-of select="$name" /></a>, <xsl:value-of select="$user-type" />.</p> 
					<p>To access some intranet features, you will need to log in as a Member.</p>
				</xsl:when>
			</xsl:choose>
			<xsl:copy-of select="dashboard/entry/description/*" />
			<xsl:apply-templates select="dashboard/entry/body/*" mode="html" />
		</div>
		<div class="content">
			<h2>News</h2>
			<xsl:apply-templates select="news-archive/year/month" mode="article-listing" />
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav id="news">
			<h3>News <a href="{$root}/news/create/new/" class="button add" title="Add an article">+</a></h3>
			<ul class="menu list-menu">
				<xsl:apply-templates select="news-archive/year/month/entry" />
			</ul>
		</nav>
		<nav id="news-categories">
			<h4>News Categories</h4>
			<ul class="menu list-menu list-menu-meta">
				<li><a href="{$root}/news/">All Posts</a></li>
				<xsl:apply-templates select="news-topics/entry[@news != 0]" />
			</ul>
		</nav>
		<nav id="news-archive">
			<h4>News Archive</h4>
			<ul class="menu list-menu list-menu-meta">
				<xsl:apply-templates select="news-archive/year/month" />
			</ul>
		</nav>
		<nav id="news-archive">
			<h4>News Tags</h4>
			<ul class="tags">
				<xsl:apply-templates select="news-tags/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-menu">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
		</nav>
		<nav id="links">
			<h3>Links</h3>
			<ul class="menu list-menu">
				<xsl:apply-templates select="links-list/entry" />
			</ul>
		</nav>
		<!-- nav id="links">
			<h3>Lists</h3>
			<ul class="menu list-menu">
				<xsl:apply-templates select="lists/entry" />
			</ul>
		</nav -->
	</aside>
</xsl:template>

<xsl:template match="month" mode="article-listing">
	<h3>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="entry/date"/>
			<xsl:with-param name="format" select="'M Y'"/>
		</xsl:call-template>
	</h3>
	<div class="articles excerpts">
		<xsl:apply-templates select="entry" mode="article-listing" />
	</div>
</xsl:template>

<xsl:template match="entry" mode="article-listing">
	<article class="excerpt">
		<h4><a href="{$root}/news/{title/@handle}/"><xsl:value-of select="title" /></a></h4>
		<p class="description">
			<xsl:value-of select="description[@mode='formatted']/p[1]" />
			<xsl:if test="url"><br /><a href="{url}"><xsl:value-of select="substring-after(url,'http://')" /></a></xsl:if>
		</p>
		<!-- xsl:if test="tags/item">
			<p class="tags-links">
				Tags: <xsl:apply-templates select="tags/item" mode="tags-links" />
			</p>
		</xsl:if -->
		<xsl:call-template name="news-meta" />
	</article>
</xsl:template>

<xsl:template match="item" mode="tags-links">
	<a href="{$root}/{$root-page}/tag/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
	<xsl:if test="position() != last()">, </xsl:if>
</xsl:template>

<xsl:template name="news-meta">
	<p class="resource-meta">
		<xsl:text>Lasted updated </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date" />
			<xsl:with-param name="format" select="'M x, Y, t'" />
		</xsl:call-template>
		<xsl:text> by </xsl:text>
		<a href="{$root}/people/{author/item/@handle}/"><xsl:value-of select="author" /></a>
		<xsl:text> | </xsl:text>
		<a href="{$root}/news/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/news/edit/{@id}/" title="Edit this article in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="categories/item" mode="article-listing">
	<a href="{$root}/news/category/{@handle}/"><xsl:value-of select="." /></a>
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
	<li><a href="{$root}/news/{title/@handle}/" title="{$date}"><xsl:value-of select="title" /></a></li>
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
		<a href="{$root}/news/category/{title/@handle}/"><xsl:value-of select="title" /></a>
		<span>(<xsl:value-of select="@news" />)</span>
	</li>
</xsl:template>

<xsl:template match="item" mode="tags-menu">
	<li>
		<a href="{$root}/news/tag/{@handle}/" rel="tag">
			<xsl:value-of select="." />
		</a>
	</li>
</xsl:template>

<xsl:template match="links-list/entry">
	<li><a href="{url}"><xsl:value-of select="title" /></a></li>
</xsl:template>

<xsl:template match="lists/entry">
	<li><a href="{$root}/lists/"><xsl:value-of select="list" /></a></li>
</xsl:template>

</xsl:stylesheet>