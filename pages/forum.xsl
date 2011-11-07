<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/forum-tools.xsl"/>
<xsl:import href="../utilities/time-ago.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:param name="url-query"/>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1><xsl:value-of select="$page-title"/></h1>
			<ul id="discussions">
				<xsl:apply-templates select="forum-discussions/entry"/>
				<xsl:apply-templates select="forum-discussions/error"/>
			</ul>
			<xsl:call-template name="pagination">
				<xsl:with-param name="pagination-element" select="forum-discussions/pagination" />
				<xsl:with-param name="display-number" select="'7'" />
				<xsl:with-param name="url" select="concat($root, '/forum/$/')" />
			</xsl:call-template>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Search</h3>
			<div id="search">
				<form method="get" action="">
					<fieldset>
						<input id="query" class="clear-on-focus" name="query" type="text" title="Search" value="" />
						<button type="submit" value="Search">Search</button>
					</fieldset>
				</form>
			</div>
			<xsl:if test="$logged-in = 'yes'">
				<h3>Actions</h3>
				<ul class="menu list-menu">
					<li>
						<a id="create" href="{$root}/forum/discussions/new/">Start a new discussion</a>
					</li>
					<li>
						<a href="?forum-action=mark-all-as-read">Mark All as Read</a>
					</li>
				</ul>
				<h3>Filters</h3>
				<ul class="menu list-menu">
					<li>
						<a href="{$root}/forum/" title="View all discussions">All Discussions</a>
					</li>
					<li>
						<a href="{$root}/forum/forum-filter/" title="Filter discussions">My Discussions</a>
					</li>
				</ul>
			</xsl:if>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="data[search-comments/query-string]">
	<section class="main">
		<div class="content">
			<h2>Search Results for &#8220;<xsl:value-of select="search-comments/query-string"/>&#8221;</h2>
			<ul id="discussions">
				<xsl:apply-templates select="search-comments/entry"/>
				<xsl:apply-templates select="search-comments/error"/>
			</ul>
			<xsl:call-template name="pagination">
			    <xsl:with-param name="pagination-element" select="search-comments/pagination" />
			    <xsl:with-param name="display-number" select="'7'" />
			    <xsl:with-param name="url">
			    	<xsl:value-of select="$root"/>
			    	<xsl:text>/forum/?query=</xsl:text>
			    	<xsl:value-of select="search-comments/query-string/@encoded"/>
			    	<xsl:text>&amp;pg=$</xsl:text>
			    </xsl:with-param>
			</xsl:call-template>
		</div>
	</section>
</xsl:template>

<!-- Lookup table to determine discussions have been read by member -->
<xsl:key name="read-discussions" match="forum-read-discussions/discussion" use="@id"/>

<!-- Discussions entry template -->
<xsl:template match="forum-discussions/entry">

	<!-- -1 to offset the first comment since it's a 'discussion' -->
	<xsl:variable name="total-replies" select="@comments - 1"/>

	<xsl:variable name="read-discussions" select="key('read-discussions', @id)"/>

	<xsl:variable name="read-replies" select="$read-discussions/@comments - 1"/>

	<!-- Get the difference between the read comments and the total comments in a discussion -->
	<xsl:variable name="new-comments">
		<xsl:choose>
			<xsl:when test="$read-replies &lt; $total-replies">
				<xsl:value-of select="$total-replies - $read-replies"/>
			</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- Different status types for a discussion -->
	<xsl:variable name="new">
		<xsl:if test="$new-comments &gt; 0">1</xsl:if>
	</xsl:variable>
	<xsl:variable name="alternate">
		<xsl:if test="position() mod 2 = 0">1</xsl:if>
	</xsl:variable>
	<xsl:variable name="pinned">
		<xsl:if test="pinned = 'Yes'">1</xsl:if>
	</xsl:variable>
	<xsl:variable name="closed">
		<xsl:if test="closed = 'Yes'">1</xsl:if>
	</xsl:variable>
	<xsl:variable name="unread">
		<xsl:if test="$logged-in = 'yes' and ($new-comments &gt; 0 or string($read-replies) = 'NaN')">1</xsl:if>
	</xsl:variable>
	<xsl:variable name="last">
		<xsl:if test="position() = last()">1</xsl:if>
	</xsl:variable>
	<xsl:variable name="raw-status">
		<xsl:text> discussion </xsl:text>
		<xsl:if test="$alternate = 1"> alternate </xsl:if>
		<xsl:if test="$pinned = 1"> sticky </xsl:if>
		<xsl:if test="$closed = 1"> closed </xsl:if>
		<xsl:if test="$unread = 1"> unread </xsl:if>
		<xsl:if test="$last = 1"> last </xsl:if>
	</xsl:variable>

	<!-- Clean up the redundant spaces -->
	<xsl:variable name="status" select="normalize-space($raw-status)"/>

	<xsl:variable name="last-comment-page" select="1 + floor($total-replies div 20)"/>

	<xsl:variable name="next-unread-comment-page" select="1 + floor($read-discussions/@comments div 20)"/>

	<!-- +1 for main discussion offset and +1 for next comment -->
	<xsl:variable name="next-unread-comment" select="$read-replies + 2"/>

	<li id="discussion-{@id}" class="{$status}">
		<h3 class="topic">
			<xsl:call-template name="tagify">
				<xsl:with-param name="string" select="topic"/>
				<xsl:with-param name="forum-id" select="@id"/>
			</xsl:call-template>
		</h3>
		<p class="discussion-meta">
			<xsl:if test="$new = 1">
				<a href="{$root}/forum/discussions/{@id}/{$next-unread-comment-page}/#position-{$next-unread-comment}">
					<span class="new-comments"><xsl:value-of select="concat($new-comments, ' new')"/></span>
				</a>
			</xsl:if>
			<xsl:if test="$closed = 1">
				<span class="closed-discussion">closed</span>
			</xsl:if>
			<xsl:if test="$total-replies &gt; 0">
				<span class="replies">
					<xsl:choose>
						<xsl:when test="$total-replies &gt; 1"> <xsl:value-of select="$total-replies"/> comments </xsl:when>
						<xsl:otherwise> 1 comment </xsl:otherwise>
					</xsl:choose>
				</span>
			</xsl:if>
			<span class="last-active">
				<xsl:choose>
					<xsl:when test="$total-replies &gt; 1">&#8211; Most recent posted </xsl:when>
					<xsl:when test="$total-replies &gt; 0">posted </xsl:when>
					<xsl:otherwise>Created </xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="time-ago">
					<xsl:with-param name="date" select="last-active"/>
				</xsl:call-template>
			</span>
			<span class="last-post">by <a href="{$root}/forum/discussions/{@id}/{$last-comment-page}/#position-{@comments}">
			<xsl:value-of select="last-post"/>
			</a></span>
		</p>
	</li>
</xsl:template>

<xsl:template match="search-comments/entry">
	<li id="discussion-{@id}" class="discussion">
		<xsl:if test="position() = last()">
			<xsl:attribute name="class">discussion last</xsl:attribute>
		</xsl:if>
		<h3 class="topic">
			<xsl:call-template name="tagify">
				<xsl:with-param name="string" select="topic"/>
				<xsl:with-param name="forum-id" select="@discussion-id"/>
				<xsl:with-param name="search-results" select="1"/>
			</xsl:call-template>
		</h3>
		<p class="detail">
			<xsl:copy-of select="comment/p[1]//text()"/>
			<xsl:if test="comment/*[2]"> &#8230;</xsl:if>
		</p>
		<p class="discussion-meta">Posted <span class="date">
				<xsl:call-template name="time-ago">
					<xsl:with-param name="date" select="date"/>
				</xsl:call-template>
			</span>
			<xsl:text> by </xsl:text>
			<span class="member"><a href="{$root}/members/{member}/">
				<xsl:value-of select="member"/>
			</a></span>
		</p>
	</li>
</xsl:template>

<xsl:template match="error">
	<tr class="last">
		<td colspan="3">No records found</td>
	</tr>
</xsl:template>

</xsl:stylesheet>