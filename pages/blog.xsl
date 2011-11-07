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
<xsl:import href="../utilities/page-not-found.xsl"/>

<xsl:param name="page-not-found">
	<xsl:choose>
		<xsl:when test="$article = 'category' and /data/articles-by-category/error = 'No records found.'">yes</xsl:when>
		<xsl:when test="not($category) and /data/articles/error = 'No records found.'">yes</xsl:when>
		<xsl:otherwise>no</xsl:otherwise>
	</xsl:choose>
</xsl:param>

<xsl:template name="page-heading">
	<xsl:choose>
		<xsl:when test="$page-not-found = 'yes'">
			<h2>Page Not Found</h2>
		</xsl:when>
		<xsl:otherwise>
			<h2><xsl:value-of select="$page-title" /></h2>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$page-not-found = 'yes'">
			<div id="content" class="page-not-found">
				<xsl:call-template name="page-not-found" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="content" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="content">
	<div id="content">
		<div id="blog-left">
			<xsl:choose>
				<xsl:when test="$page-not-found = 'yes'">
					<xsl:call-template name="page-not-found" />
				</xsl:when>
				<xsl:when test="$article = 'category'">
					<xsl:apply-templates select="articles-by-category/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles-by-category/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/blog/category/', $category, '/$/')" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$page">
					<xsl:apply-templates select="articles-pages/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles-pages/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/blog/articles/page/$/')" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$article">
					<xsl:apply-templates select="articles/entry"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="articles/entry"/>
					<xsl:call-template name="pagination">
						<xsl:with-param name="pagination-element" select="articles/pagination" />
						<xsl:with-param name="display-number" select="'7'" />
						<xsl:with-param name="url" select="concat($root, '/blog/articles/page/$/')" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div id="blog-right">
			<h3>Content Categories</h3>
			<p>
				<xsl:choose>
					<xsl:when test="$article or $category">
						<a href="{$root}/blog/">All Posts</a><br />
					</xsl:when>
					<xsl:otherwise>
						<strong>All Posts</strong><br />
					</xsl:otherwise>
				</xsl:choose>
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

<xsl:template match="articles/entry">
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
			<xsl:choose>
				<xsl:when test="/data/article-avatars/entry/member/item/@id = current()/author/item/@id">
					<p><span class="posted-by">Posted By</span><br />
					<span class="author"><a href="{$root}/team/{author/item/@handle}/"><xsl:value-of select="author/item"/></a></span><br /></p>
					<div class="ie6-blog-author-image">
						<a href="{$root}/team/{author/item/@handle}/" class="blog-author-image">
							<span style="background: url({$workspace}/assets/public/images/team/avatar/{/data/article-avatars/entry[member/item/@id = current()/author/item/@id]/avatar/filename}) no-repeat; z-index: 100;"
							class="person-image"></span>
						</a>
					</div>
					<br class="clearing" />
				</xsl:when>
				<xsl:otherwise>
					<p><span class="posted-by">Posted By</span><br />
					<span class="author" title="{author/item} is no longer a member of the team"><xsl:value-of select="author/item"/></span></p>
				</xsl:otherwise>
			</xsl:choose>
			<p>
				<!-- a href="{$root}/blog/{title/@handle}/#comments">
					<span class="num-comments"><xsl:value-of select="@article-comments"/></span>
					<span class="num-comments2">
						<xsl:choose>
							<xsl:when test="@article-comments = 1">Comment</xsl:when>
							<xsl:otherwise>Comments</xsl:otherwise>
						</xsl:choose>
					</span>
				</a -->
				<a href="{$root}/blog/{title/@handle}/#disqus_thread" data-disqus-identifier="article-{@id}">Permalink</a>
			</p>
		</div>
		<div class="blog-article-right">
			<h2>
				<a href="{$root}/blog/{title/@handle}/">
					<xsl:call-template name="article-title" />
				</a>
			</h2>
			<xsl:if test="article-image">
				<p>
					<a href="{$root}/blog/{title/@handle}/">
						<img src="{$workspace}{article-image/@path}/{article-image/filename}" width="{article-image/meta/@width}" height="{article-image/meta/@height}" alt="{title}" />
					</a>
				</p>
			</xsl:if>
			<!-- xsl:choose>
				<xsl:when test="$page or $article = 'category' or not($article)">
					<xsl:apply-templates select="body/*[position() &lt; 4]" mode="html" />
					<xsl:if test="body/*[position() = 4]"><p><a href="{$root}/blog/{title/@handle}/">Read the full article</a></p></xsl:if>
				</xsl:when>
				<xsl:otherwise -->
					<xsl:apply-templates select="body" mode="html" />
					<xsl:copy-of select="embed/*" />
				<!-- /xsl:otherwise>
			</xsl:choose -->
			<xsl:if test="$article and $article != 'category' and not($page)">
				<xsl:call-template name="disqus-comments">
					<xsl:with-param name="id" select="@id" />
				</xsl:call-template>
			</xsl:if>
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

<xsl:template name="disqus-comments">
	<xsl:param name="id" />
	<div id="disqus_thread"></div>
	<script type="text/javascript">
		var disqus_shortname = 'username';
		var disqus_identifier = 'article-<xsl:value-of select="$id" />';
		var disqus_url = '<xsl:value-of select="concat($root, '/', $current-page, '/', $article, '/')" />';
	
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	</script>
	<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
	<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
</xsl:template>

<xsl:template match="data" mode="js">
	<script type="text/javascript">
		var disqus_shortname = 'username';
	
		(function () {
			var s = document.createElement('script'); s.async = true;
			s.type = 'text/javascript';
			s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
			(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
		}());
	</script>
</xsl:template>

<xsl:template name="page-title">
	<xsl:choose>
		<xsl:when test="$page-not-found = 'yes'">
			<xsl:text>Page Not Found</xsl:text>
		</xsl:when>
		<xsl:when test="$category">
			<xsl:value-of select="/data/categories/entry[title/@handle = $category]" />
			<xsl:text> | </xsl:text>
			<xsl:value-of select="$page-title"/>
		</xsl:when>
		<xsl:when test="$article">
			<xsl:apply-templates select="/data/articles/entry[title/@handle = $article]" mode="article-title" />
			<xsl:text> | </xsl:text>
			<xsl:value-of select="$page-title"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$page-title"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text> | </xsl:text>
	<xsl:value-of select="$website-name" />
</xsl:template>

<xsl:template match="/data/articles/entry" mode="article-title">
	<xsl:call-template name="article-title" />
</xsl:template>

<xsl:template name="article-title">
	<xsl:choose>
		<xsl:when test="alternate-title">
			<xsl:value-of select="alternate-title" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="title" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>