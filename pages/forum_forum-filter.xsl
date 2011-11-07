<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/forum-tools.xsl"/>
<xsl:import href="../utilities/time-ago.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:param name="url-query"/>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1>Forum: My Discussions</h1>
			<p class="notification">This is a filtered view of discussions you have either started or replied. <a href="{$root}/forum/">Return to all discussions</a>.</p>
			<ul id="discussions">
				<xsl:apply-templates select="forum-discussions/entry"/>
				<xsl:apply-templates select="forum-discussions/error"/>
			</ul>
			<xsl:call-template name="pagination">
			    <xsl:with-param name="pagination-element" select="forum-discussions/pagination" />
			    <xsl:with-param name="display-number" select="'7'" />
			    <xsl:with-param name="url" select="concat($root, '/forum/forum-filter/$/')" />
			</xsl:call-template>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Search</h3>
			<div id="search">
				<form method="get" action="{$root}/{$root-page}/">
					<fieldset>
						<input id="query" class="clear-on-focus" name="query" type="text" title="Search" value="" />
						<button type="submit" value="Search">Search</button>
					</fieldset>
				</form>
			</div>
			<xsl:if test="$logged-in = 'true'">
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
	<xsl:variable name="raw-status">
		<xsl:text> discussion </xsl:text>
		<xsl:if test="position() mod 2 = 0"> alternate </xsl:if>
		<xsl:if test="pinned = 'Yes'"> sticky </xsl:if>
		<xsl:if test="closed = 'Yes'"> closed </xsl:if>
		<xsl:if test="$logged-in = 'true' and ($new-comments &gt; 0 or $read-replies = 'NaN')"> unread </xsl:if>
		<xsl:if test="position() = last()"> last </xsl:if>
	</xsl:variable>

	<!-- Clean up the redundant spaces -->
	<xsl:variable name="status" select="normalize-space($raw-status)"/>

	<xsl:variable name="last-comment-page" select="1 + floor($total-replies div 20)"/>

	<xsl:variable name="next-unread-comment-page" select="1 + floor($read-replies div 20)"/>

	<!-- +1 for main discussion offset and +1 for next comment -->
	<xsl:variable name="next-unread-comment" select="$read-replies + 2"/>

	<li id="discussion-{@id}" class="{$status}">
		<h3 class="topic">
			<xsl:call-template name="tagify">
				<xsl:with-param name="string" select="topic"/>
				<xsl:with-param name="forum-id" select="@id"/>
			</xsl:call-template>
		</h3>
		<p>
			<xsl:if test="$new-comments &gt; 0">
				<a href="{$root}/forum/discussions/{@id}/{$next-unread-comment-page}/#position-{$next-unread-comment}">
					<span class="new-comments"><xsl:value-of select="concat($new-comments, ' new')"/></span>
				</a>
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
					<xsl:when test="$total-replies &gt; 1">- Most recent posted </xsl:when>
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

<xsl:template match="error">
	<tr class="last">
		<td colspan="3">No records found</td>
	</tr>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<title>Forum: My Discussions
		<xsl:text> | </xsl:text>
		<xsl:value-of select="$website-name"/>
	</title>
</xsl:template>

</xsl:stylesheet>