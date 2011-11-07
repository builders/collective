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

<xsl:template match="data">
	<div id="content">
		<div id="blog-left">
			<xsl:choose>
				<xsl:when test="$page">
					<xsl:apply-templates select="articles-pages/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles-pages/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/jobs/articles/page/$/')" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$article = 'category'">
					<xsl:apply-templates select="articles-by-category/entry"/>
				</xsl:when>
				<xsl:when test="$article">
					<xsl:apply-templates select="jobs/entry"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="jobs/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/jobs/articles/page/$/')" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div id="blog-right">
			<h3>Content Categories</h3>
			<p>
				<a href="{$root}/blog/">All Posts</a><br />
				<xsl:for-each select="categories/entry[@articles != 0]">
					<xsl:choose>
						<xsl:when test="$category = title/@handle">
							<strong><xsl:value-of select="title"/></strong>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$root}/blog/category/{title/@handle}/">
								<xsl:if test="$article = title/@handle"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
								<xsl:value-of select="title"/>
							</a>
						</xsl:otherwise>
					</xsl:choose>
					<br />
				</xsl:for-each>
			</p>
			<p><a href="http://feeds.feedburner.com/username" class="rss-link">Subscribe via RSS</a></p>
			<h3>Latest on Twitter</h3>
			<div class="tweet_list">
				<div id="tweets-holder">
					<ul>
						<xsl:for-each select="twitter/status">
							<xsl:call-template name="list-tweets" />
						</xsl:for-each>
					</ul>
				</div>
			</div><a href="http://www.twitter.com/username" class=
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
			</div><a href="http://www.flickr.com/photos/username" class=
			"follow-on-twitter">View more on Flickr</a>
		</div>
	</div>
</xsl:template>

<xsl:template match="jobs/entry">
	<xsl:call-template name="jobs-article"/>
</xsl:template>

<xsl:template name="jobs-article">
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
		</div>
		<div class="blog-article-right">
			<h2><a href="{$root}/jobs/{title/@handle}/"><xsl:value-of select="title"/></a></h2>
			<xsl:if test="article-image">
				<p>
					<a href="{$root}/jobs/{title/@handle}/">
						<img src="{$workspace}{article-image/@path}/{article-image/filename}" width="{article-image/meta/@width}" height="{article-image/meta/@height}" alt="{title}" />
					</a>
				</p>
			</xsl:if>
			<!-- xsl:choose>
				<xsl:when test="$page or $article = 'category' or not($article)">
					<xsl:apply-templates select="body/*[position() &lt; 4]" mode="html" />
					<xsl:if test="body/*[position() = 4]"><p><a href="{$root}/jobs/{title/@handle}/">Read the full article</a></p></xsl:if>
				</xsl:when>
				<xsl:otherwise -->
					<xsl:apply-templates select="body" mode="html" />
					<xsl:copy-of select="embed/*" />
				<!-- /xsl:otherwise>
			</xsl:choose -->
		</div>
	</div>
</xsl:template>

<xsl:template name="article-comment-form">
	<xsl:param name="event-action" select="'save-article-comment'"/>
	<xsl:param name="event" select="/data/events/*[name() = $event-action]"/>
	<h2 id="comments-head">Comments</h2>
	<xsl:for-each select="/data/article-comments/entry">
		<div class="comment">
			<p class="comment-poster"><strong>On
				<xsl:call-template name="format-date">
					<xsl:with-param name="date" select="date"/>
					<xsl:with-param name="format" select="'M x, Y, t,'"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:choose>
					<xsl:when test="website">
						<a href="{website}"><xsl:value-of select="author"/></a>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="author"/>
					</xsl:otherwise>
				</xsl:choose> said:</strong>
			</p>
			<div class="comment-comment"><xsl:copy-of select="comment/*"/></div>
		</div>
	</xsl:for-each>
	<div class="wrap-your-comments" id="comments">
		<h3>Your Comment</h3>
		<form action="./#comments" method="post">
			<xsl:for-each select="$event">
				<p class="{@result}">
					<xsl:choose>
						<xsl:when test="@result = 'success'">Your comment has been saved successfully.</xsl:when>
						<xsl:otherwise>The system encountered errors when saving your comment. Please check if all the required fields have been filled.</xsl:otherwise>
					</xsl:choose>
				</p>
			</xsl:for-each>
			<fieldset>
				<div class="form-row">
					<div class="col span-2"><label for="fields-author">Name </label></div>
					<div class="last span-7 nudge-2"><input type="text" class="text span-4" id="fields-author"
						name="fields[author]" value="{$event/post-values/author}" /></div>
					<xsl:if test="$event/author"><p class="error"><xsl:value-of select="$event/author/@message"/></p></xsl:if>
				</div>
				<div class="form-row">
					<div class="col span-2"><label for="fields-email">Email</label></div>
					<div class="last span-7 nudge-2"><input type="text" class="text span-4" id="fields-email"
						name="fields[email]" value="{$event/post-values/email}" /></div>
					<xsl:if test="$event/email"><p class="error"><xsl:value-of select="$event/email/@message"/></p></xsl:if>
				</div>
				<div class="form-row">
					<div class="col span-2"><label for="fields-website">Website</label></div>
					<div class="last span-7 nudge-2"><input type="text" class="text span-4" id="fields-website"
						name="fields[website]" value="{$event/post-values/website}" /></div>
					<xsl:if test="$event/website"><p class="error"><xsl:value-of select="$event/website/@message"/></p></xsl:if>
				</div>
				<div class="form-row">
					<div class="col span-2"><label for="fields-comment">Comment</label></div>
					<div class="last span-7 nudge-2"><textarea id="fields-comment"
						name="fields[comment]" rows="5" cols="21"><xsl:value-of select="$event/post-values/comment" /></textarea>
					</div>
					<xsl:if test="$event/comment"><p class="error"><xsl:value-of select="$event/comment/@message"/></p></xsl:if>
				</div>
				<input name="fields[article]" value="{/data/articles/entry/@id}" type="hidden" />
				<div class="form-row last">
					<div class="last span-7 nudge-2">
						<button type="submit" id="submit" name="action[save-article-comment]"> Post Comment</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</xsl:template>

</xsl:stylesheet>