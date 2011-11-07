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
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/news.css?v1.0" />
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1>News Archive</h1>
			<xsl:choose>
				<xsl:when test="$month">
					<div class="articles excerpts" id="news-archive">
						<h3>
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="concat($year, '-', $month, '-01')" />
								<xsl:with-param name="format" select="'M Y'" />
							</xsl:call-template>
						</h3>
						<xsl:apply-templates select="news-by-date/year/month/entry" />
						<xsl:call-template name="pagination">
							<xsl:with-param name="pagination-element" select="news-by-date/pagination" />
							<xsl:with-param name="display-number" select="'7'" />
							<xsl:with-param name="url" select="concat($root, '/news/archive/', $year, '/', $month, '/$/')" />
						</xsl:call-template>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="articles" id="news-archive">
						<xsl:apply-templates select="news-archive/year/month" mode="article-listing" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
			<div class="articles-nav" id="news-navigation">
				<nav id="news">
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
			</div>
		</div>
	</section>
</xsl:template>

<xsl:template match="month" mode="article-listing">
	<h3>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="entry/date"/>
			<xsl:with-param name="format" select="'M Y'"/>
		</xsl:call-template>
	</h3>
	<div class="excerpts">
		<xsl:apply-templates select="entry" mode="article-listing" />
	</div>
</xsl:template>

<xsl:template match="entry" mode="article-listing">
	<article class="excerpt">
		<h4><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h4>
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

<xsl:template match="news-by-date/year/month/entry">
	<article class="excerpt">
		<h4><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h4>
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
		<a href="{$root}/{$root-page}/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/news/edit/{@id}/" title="Edit this article in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="news-archive/year/month">
	<li>
		<a href="{$root}/{$root-page}/{$current-page}/{../@value}/{@value}/">
			<xsl:if test="../@value = $year and @value = $month"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="entry/date"/>
				<xsl:with-param name="format" select="'M Y'"/>
			</xsl:call-template>
		</a>
		<span><xsl:text> (</xsl:text><xsl:value-of select="count(entry)"/>)</span>
	</li>
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

<xsl:template match="news-topics/entry">
	<li>
		<a href="{$root}/news/category/{title/@handle}/">
			<xsl:value-of select="title" />
		</a>
		<span>(<xsl:value-of select="@news" />)</span>
	</li>
</xsl:template>

<xsl:template match="item" mode="tags-menu">
	<li>
		<a href="{$root}/{$root-page}/tag/{@handle}/" rel="tag">
			<xsl:value-of select="." />
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>