<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:media="http://search.yahoo.com/mrss/"
	exclude-result-prefixes="media">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>
<xsl:import href="../utilities/twitter.xsl"/>

<xsl:template name="page-heading">
	<xsl:choose>
		<xsl:when test="$page-not-found = 'yes'">
			<h2>Page Not Found</h2>
		</xsl:when>
		<xsl:otherwise>
			<h2><xsl:value-of select="$page-title" />: Preview</h2>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data">
	<div id="content">
		<div id="blog-left">
			<xsl:choose>
				<xsl:when test="$page">
					<xsl:apply-templates select="articles-pages/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles-pages/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/blog/drafts/articles/page/$/')" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$article = 'category'">
					<xsl:apply-templates select="articles-by-category/entry"/>
				</xsl:when>
				<xsl:when test="$article">
					<xsl:apply-templates select="articles-drafts/entry"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="articles-drafts/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles-drafts/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/blog/drafts/articles/page/$/')" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div id="blog-right">
			<h3>Content Categories</h3>
			<p>
				<xsl:choose>
					<xsl:when test="$article or $category">
						<a href="{$root}/blog/drafts/">All Posts (Drafts)</a><br />
					</xsl:when>
					<xsl:otherwise>
						<strong>All Posts (Drafts)</strong><br />
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="categories/entry[@articles != 0]">
					<xsl:choose>
						<xsl:when test="$category = title/@handle">
							<strong><xsl:value-of select="title"/></strong>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$root}/blog/drafts/category/{title/@handle}/">
								<xsl:if test="$article = title/@handle"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
								<xsl:value-of select="title"/>
							</a>
						</xsl:otherwise>
					</xsl:choose>
					<br />
				</xsl:for-each>
			</p>
			<p><a href="#" class="rss-link">Subscribe via RSS</a></p>
			<h3>Latest on Twitter</h3>
			<div class="tweet_list">
				<div id="tweets-holder">
					<ul>
						<xsl:for-each select="twitter/status">
							<xsl:call-template name="list-tweets" />
						</xsl:for-each>
					</ul>
				</div>
			</div><a href="http://www.twitter.com/username" target="_blank" class=
			"follow-on-twitter">Follow us on Twitter</a>
			<h3>Latest on Flickr</h3>
			<div id="flickr-holder">
				<ul>
					<xsl:for-each select="flickr-thumbnails/item">
						<li>
							<a href="{link}">
								<img src="{media:thumbnail/@url}" width="56" alt="" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</div><a href="http://www.flickr.com/photos/username" target="_blank" class=
			"follow-on-twitter">View more on Flickr</a>
		</div>
	</div>
</xsl:template>

<xsl:template match="articles-drafts/entry">
	<xsl:call-template name="blog-article"/>
</xsl:template>

<xsl:template match="articles-by-category/entry">
	<xsl:call-template name="blog-article"/>
</xsl:template>

<xsl:template match="articles-pages/entry">
	<xsl:call-template name="blog-article"/>
</xsl:template>

<xsl:template name="blog-article">
	<div class="blog-article">
		<div class="blog-article-left">
			<div class="blog-date">
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="date"/>
					<xsl:with-param name="format" select="'m x'"/>
				</xsl:call-template>
				<br />
				<span class="blog-year"><xsl:value-of select="substring(date,1,4)"/></span>
			</div>
			<div class="blog-date-bottom"></div>
			<p><span class="posted-by">Posted By</span><br />
			<span class="author"><a href="{$root}/team/{author/item/@handle}/"><xsl:value-of select="author/item"/></a></span><br /></p>
			<div class="ie6-blog-author-image">
				<a href="{$root}/team/{author/item/@handle}/" class="blog-author-image">
					<span style="background: url({$workspace}/assets/public/images/team/avatar/{/data/article-avatars/entry[member/item/@id = current()/author/item/@id]/avatar/filename}) no-repeat; z-index: 100;"
					class="person-image"></span>
				</a>
			</div>
			<br class="clearing" />
			<form method="post" action="" style="margin-top: 12px;">
				<input name="id" type="hidden" value="{@id}" />
				<input name="fields[title]" type="hidden" value="{title}" />
				<input name="fields[author]" type="hidden" value="{author/item/@id}" />
				<input name="fields[publish]" type="hidden" value="yes" />
				<input name="redirect" type="hidden" value="{$root}/blog/{title/@handle}/" />
				<input name="action[publish-article]" type="submit" value="Publish Article" />
			</form>
		</div>
		<div class="blog-article-right">
			<h2>
				<a href="{$root}/blog/drafts/{title/@handle}/">
					<xsl:choose>
						<xsl:when test="alternate-title">
							<xsl:value-of select="alternate-title" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="title" />
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</h2>
			<xsl:if test="article-image">
				<p>
					<a href="{$root}/blog/drafts/{title/@handle}/">
						<img src="{$workspace}{article-image/@path}/{article-image/filename}" width="{article-image/meta/@width}" height="{article-image/meta/@height}" alt="{title}" />
					</a>
				</p>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$article">
					<xsl:apply-templates select="body" mode="html" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:copy-of select="body/*[text() != ''][position() &lt; 4]" />
					<xsl:if test="body/*[text() != ''][position() &gt;= 4] or body/p/img"><p><a href="{$root}/blog/drafts/{title/@handle}/">View full article</a></p></xsl:if>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:copy-of select="embed/*" />
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>