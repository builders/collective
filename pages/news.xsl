<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl" />
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/news.css?v1.0" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/resources.js"></script>
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1><xsl:value-of select="$page-title"/></h1>
			<div class="articles" id="news-articles">
				<xsl:choose>
					<xsl:when test="$page = 'success'">
						<xsl:apply-templates select="news-latest/entry"/>
					</xsl:when>
					<xsl:when test="$article = 'category'">
						<h3>Category: <xsl:value-of select="news-topics/entry[title/@handle = $category]/title" /></h3>
						<xsl:apply-templates select="news-by-category/entry"/>
						<xsl:call-template name="pagination">
							<xsl:with-param name="pagination-element" select="news-by-category/pagination" />
							<xsl:with-param name="display-number" select="'7'" />
							<xsl:with-param name="url" select="concat($root, '/news/category/', $category, '/$/')" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$page">
						<xsl:apply-templates select="news-pages/entry"/>
						<xsl:call-template name="pagination">
							<xsl:with-param name="pagination-element" select="news-pages/pagination" />
							<xsl:with-param name="display-number" select="'7'" />
							<xsl:with-param name="url" select="concat($root, '/news/articles/page/$/')" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$category">
						<xsl:choose>
							<xsl:when test="$logged-in != 'yes'">
								<h1>Hello, <xsl:value-of select="author-details/entry/first-name" /></h1>
								<p>You are currently logged in as a site administrator: 
								<a href="{$root}/symphony/system/authors/edit/{$author-id}/"><xsl:value-of select="$name" /></a>, <xsl:value-of select="$user-type" />.</p> 
								<p>To add and edit articles, you will need to log in as a Member.</p>
							</xsl:when>
							<xsl:when test="$category = 'edit'">
								<xsl:apply-templates select="news-by-id/entry" mode="save-news-form" />
							</xsl:when>
							<xsl:when test="$category = 'new'">
								<xsl:apply-templates select="news-article/error" mode="save-news-form" />
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="$article">
						<xsl:attribute name="class">full-article</xsl:attribute>
						<xsl:attribute name="id">article</xsl:attribute>
						<xsl:apply-templates select="news-article/entry"/>
						<xsl:apply-templates select="news-by-id/entry"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="news-article/entry"/>
						<xsl:call-template name="pagination">
							<xsl:with-param name="pagination-element" select="news-article/pagination" />
							<xsl:with-param name="display-number" select="'7'" />
							<xsl:with-param name="url" select="concat($root, '/news/articles/page/$/')" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="articles-nav" id="news-navigation">
				<nav id="news">
					<h3>News <a href="{$root}/news/create/new/" class="button add" title="Add an article">+</a></h3>
					<ul class="menu list-menu">
						<xsl:apply-templates select="news-archive/year/month/entry" />
					</ul>
					<h4>News Categories</h4>
					<ul class="menu list-menu list-menu-meta">
						<li><a href="{$root}/news/">
							<xsl:if test="$article = '' and $category = ''"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
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

<xsl:template match="news-article/entry | news-by-id/entry | news-latest/entry">
	<xsl:call-template name="news-article"/>
</xsl:template>

<xsl:template match="news-by-category/entry">
	<xsl:call-template name="news-article"/>
</xsl:template>

<xsl:template match="news-pages/entry">
	<xsl:call-template name="news-article"/>
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
			<xsl:if test="$category = 'edit' or $category = 'new'"><xsl:attribute name="href"><xsl:value-of select="concat($root, '/news/', @id, '/edit/')" /></xsl:attribute></xsl:if>
			<xsl:if test="$article = title/@handle or $article = @id"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
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
			<xsl:if test="$category = title/@handle"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
			<xsl:value-of select="title" />
		</a>
		<span>(<xsl:value-of select="@news" />)</span>
	</li>
</xsl:template>

<xsl:template name="news-article">
	<xsl:param name="emailed">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="emailed"/>
			<xsl:with-param name="format" select="'t, m x, Y'"/>
		</xsl:call-template>
	</xsl:param>
	<article>
		<div class="content">
			<h2><a href="{$root}/{$current-page}/{title/@handle}/"><xsl:value-of select="title"/></a></h2>
			<xsl:if test="article-image">
				<p>
					<a href="{$root}/{$current-page}/{title/@handle}/">
						<img src="{$workspace}{article-image/@path}/{article-image/filename}" width="530" alt="{title}" />
					</a>
				</p>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="$page or $article = 'category' or not($article)">
					<xsl:apply-templates select="body/*[position() &lt; 4]" mode="html" />
					<xsl:if test="body/*[position() = 4]"><p class="more-link"><a href="{$root}/{$current-page}/{title/@handle}/">Read the full article</a></p></xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="body/*" mode="html" />
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="author/item/@id = $member/@id and $article">
				<xsl:choose>
					<xsl:when test="not(emailed)">
						<form method="post" id="email-news-post">
							<input type="hidden" name="id" value="{@id}" />
							<input type="hidden" name="fields[author]" value="{author/item/@id}" />
							<input type="hidden" name="fields[title]" value="{title}" />
							<input type="hidden" name="fields[emailed]" value="now" />
							<input type="submit" class="submit" name="action[email-news-post]" value="Email News Post" />
						</form>
						<p class="resource-meta"><a href="{$root}/news/{@id}/edit/">Edit your article</a></p>
					</xsl:when>
					<xsl:otherwise>
						<p class="resource-meta">Emailed <xsl:value-of select="$emailed" /> | <a href="{$root}/news/{@id}/edit/">Edit</a></p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</div>
		<div class="meta">
			<time datetime="{date}" pubdate="pubdate">
				<span class="month-day">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'m x'"/>
					</xsl:call-template>
				</span>
				<span class="separator">, </span>
				<span class="year"><xsl:value-of select="substring(date,1,4)"/></span>
			</time>
			<p class="author vcard">
				<span class="posted-by">Posted By</span>
				<xsl:choose>
					<xsl:when test="/data/news-article-avatars/entry[member/item/@id = current()/author/item/@id]">
						<span class="fn"><a href="{$root}/people/{author/item/@handle}/"><xsl:value-of select="author/item"/></a></span>
						<a href="{$root}/people/{author/item/@handle}/" class="avatar">
							<img src="{$workspace}/assets/public/images/team/avatar/{/data/news-article-avatars/entry[member/item/@id = current()/author/item/@id]/avatar/filename}" alt="{author/item}" />
						</a>
					</xsl:when>
					<xsl:otherwise>
						<span class="fn"><xsl:value-of select="author/item"/></span>
					</xsl:otherwise>
				</xsl:choose>
			</p>
			<p class="comment-count">
				<a href="{$root}/{$root-page}/{title/@handle}/#comments">
					<span class="value"><xsl:value-of select="@notes"/></span>
					<span class="label">
						<xsl:choose>
							<xsl:when test="@notes = 1">Comment</xsl:when>
							<xsl:otherwise>Comments</xsl:otherwise>
						</xsl:choose>
					</span>
				</a>
			</p>
		</div>
		<xsl:if test="$article and $article != 'category' and not($page)">
			<xsl:call-template name="article-comment-form"/>
		</xsl:if>
	</article>
</xsl:template>

<xsl:template name="article-comment-form">
	<xsl:param name="event-action" select="'save-note'"/>
	<xsl:param name="event" select="/data/events/*[name() = $event-action]"/>
	<div class="comments" id="comments">
		<h2 id="comments-head">Comments</h2>
		<xsl:for-each select="/data/news-comments/entry">
			<div class="comment">
				<p class="comment-poster">On
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'M x, Y, t,'"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<a href="{$root}/people/{author/item/@handle}/"><xsl:value-of select="author"/></a>
					said:
				</p>
				<div class="comment-comment"><xsl:copy-of select="comment/*"/></div>
			</div>
		</xsl:for-each>
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
				<div>
					<label for="fields-comment">Comment</label>
					<textarea id="fields-comment" name="fields[comment]" rows="5" cols="21"><xsl:value-of select="$event/post-values/comment" /></textarea>
					<xsl:if test="$event/comment"><p class="error"><xsl:value-of select="$event/comment/@message"/></p></xsl:if>
				</div>
				<div>
					<input name="fields[author]" type="hidden" value="{$member/@id}" />
					<input name="fields[article]" type="hidden" value="{/data/news-article/entry/@id}" />
					<button type="submit" id="submit" name="action[save-note]"> Post Comment</button>
				</div>
			</fieldset>
		</form>
	</div>
</xsl:template>

<xsl:template match="item" mode="tags-menu">
	<li><a href="{$root}/{$current-page}/tag/{@handle}/" rel="tag"
		title="Entries tagged with '{.}': {count(/data/news-archive/year/month/entry[tags/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

<xsl:template match="entry | error" mode="save-news-form">
	<xsl:param name="event" select="/data/events/save-news" />
	<h2>
		<xsl:choose>
			<xsl:when test="$category = 'new'">Create a New Article</xsl:when>
			<xsl:otherwise><xsl:value-of select="title" /></xsl:otherwise>
		</xsl:choose>
	</h2>
	<xsl:if test="$event[@result = 'success']">
		<p class="success"><strong>The resource changes were saved successfully.</strong></p>
	</xsl:if>
	<form method="post" action="" enctype="multipart/form-data" class="resources">
		<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
		<xsl:if test="$category != 'new'"><input name="id" type="hidden" value="{@id}" /></xsl:if>
		<div>
			<xsl:attribute name="class">
				<xsl:text>field field-input required</xsl:text>
				<xsl:if test="$event[@result = 'error']/title">
					<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label>Title
				<input name="fields[title]" type="text" value="{title}">
					<xsl:if test="$event[@result='error']">
						<xsl:attribute name="value">
							<xsl:value-of select="$event/post-values/title" />
						</xsl:attribute>
					</xsl:if>
				</input>
			</label>
			<xsl:if test="$event[@result = 'error']/title">
				<p class="message {$event[@result = 'error']/title/@type}"><xsl:value-of select="$event[@result = 'error']/title/@message" /></p>
			</xsl:if>
		</div>
		<div>
			<xsl:attribute name="class">
				<xsl:text>field field-textarea required</xsl:text>
				<xsl:if test="$event[@result = 'error']/title">
					<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label>Body
				<textarea name="fields[body]" rows="15" cols="50">
					<xsl:choose>
						<xsl:when test="$event[@result='error']">
							<xsl:value-of select="$event/post-values/body" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="body[@mode='unformatted']" />
						</xsl:otherwise>
					</xsl:choose>
				</textarea>
			</label>
			<xsl:if test="$event[@result = 'error']/body">
				<p class="message {$event[@result = 'error']/body/@type}"><xsl:value-of select="$event[@result = 'error']/body/@message" /></p>
			</xsl:if>
		</div>
		<div class="field field-selectbox_link">
			<label>Categories
				<i>Optional</i>
				<select name="fields[categories]" multiple="multiple">
					<xsl:choose>
						<xsl:when test="$event[@result = 'error']">
							<xsl:apply-templates select="/data/news-topics/entry" mode="options">
								<xsl:with-param name="selected" select="$event/post-values/topic" />
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="/data/news-topics/entry" mode="options">
								<xsl:with-param name="selected" select="categories/item/@id" />
							</xsl:apply-templates>
						</xsl:otherwise>
					</xsl:choose>
				</select>
			</label>
		</div>
		<div class="field field-taglist">
			<label>Tags
				<i>Comma separated values</i>
				<input name="fields[tags]" type="text">
					<xsl:attribute name="value">
						<xsl:apply-templates select="tags/item" mode="tags" />
					</xsl:attribute>
					<xsl:if test="$event[@result='error']">
						<xsl:attribute name="value">
							<xsl:value-of select="$event/post-values/tags" />
						</xsl:attribute>
					</xsl:if>
				</input>
			</label>
			<ul class="tags">
				<xsl:apply-templates select="/data/news-tags/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-list">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
			<xsl:if test="$event[@result = 'error']/tags">
				<p class="message {$event[@result = 'error']/tags/@type}"><xsl:value-of select="$event[@result = 'error']/tags/@message" /></p>
			</xsl:if>
		</div>
		<input name="fields[author]" type="hidden" value="{$member/@id}" />
		<input name="fields[member]" type="hidden" value="{$member-username}" />
		<input name="fields[date]" type="hidden" value="" />
		<input name="fields[publish]" type="hidden" value="Yes" />
		<xsl:choose>
			<xsl:when test="$category = 'new'">
				<input name="redirect" type="hidden" value="{$root}/{$current-page}/create/new/success/" />
				<input name="action[save-news]" type="submit" value="Create Article" />
				<a href="{$root}/{$root-page}/" class="cancel">Cancel</a>
			</xsl:when>
			<xsl:otherwise>
				<input name="redirect" type="hidden" value="{$root}/{$current-page}/{@id}/" />
				<input name="action[save-news]" type="submit" value="Edit Article" />
				<a href="{$root}/{$root-page}/{title/@handle}/" class="cancel">Cancel</a>
			</xsl:otherwise>
		</xsl:choose>
	</form>
</xsl:template>

<xsl:template match="*" mode="options">
	<xsl:param name="selected" />
	<option value="{@id}">
		<xsl:if test="@id = $selected">
			<xsl:attribute name="selected">selected</xsl:attribute>
		</xsl:if>
		<xsl:value-of select="title" />
	</option>
</xsl:template>

<xsl:template match="item" mode="tags-list">
	<li><xsl:value-of select="." /></li>
</xsl:template>

</xsl:stylesheet>