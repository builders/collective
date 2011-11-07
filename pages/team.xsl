<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:media="http://search.yahoo.com/mrss/"
	exclude-result-prefixes="media">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/html-truncate-advanced.xsl"/>
<xsl:import href="../utilities/html-truncate.xsl"/>
<xsl:import href="../utilities/twitter.xsl"/>

<xsl:param name="filter" select="$team-member" />
<xsl:param name="filter-title" select="/data/team-profile/entry/member/item" />

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$team-member">
			<xsl:call-template name="team-profile"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="team-members"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="team-members">
	<div id="content">
		<div class="intro">
			<p>An intro goes here.</p>
		</div>
		<div id="team-listing">
			<xsl:call-template name="team-rows"/>
		</div>
		<div class="extra-info">
			<div class="extra-info-right">
				<div id="photo-gallery">
					<ul>
						<xsl:for-each select="flickr/item">
							<li>
								<a href="{link}">
									<img src="{concat(substring-before(media:thumbnail/@url,'s.jpg'), 'm.jpg')}" width="112" alt="" />
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</div>
			</div><a href="http://www.flickr.com/photos/username" id=
			"more-photos" class="bottom-right" name="more-photos">See more photos on Flickr &gt;</a>
		</div>
	</div>
</xsl:template>

<xsl:template name="team-profile">
	<xsl:param name="team-member" select="/data/member/entry"/>
	<xsl:param name="team-member-id" select="team-profile/entry/@id"/>
	<xsl:param name="prev" select="team-snapshot/entry[@id = $team-member-id]/preceding-sibling::entry[1]/member/item/@handle"/>
	<xsl:param name="next" select="team-snapshot/entry[@id = $team-member-id]/following-sibling::entry[1]/member/item/@handle"/>
	<xsl:for-each select="team-profile/entry">
		<div id="content">
			<div id="project-header">
				<ul id="project-nav">
					<xsl:choose>
						<xsl:when test="$prev">
							<li id="project-nav-last"><a href="{$root}/team/{$prev}/">Last</a></li>
						</xsl:when>
						<xsl:otherwise>
							<li id="project-nav-last"><img src="{$workspace}/assets/public/img/prev-arrow-disabled.png" alt="" /></li>
						</xsl:otherwise>
					</xsl:choose>
					<li id="project-nav-thumbs"><a href="{$root}/team/">Thumbs</a></li>
					<xsl:choose>
						<xsl:when test="$next">
							<xsl:if test="$next"><li id="project-nav-next"><a href="{$root}/team/{$next}/">Next</a></li></xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<li id="project-nav-next"><img src="{$workspace}/assets/public/img/next-arrow-disabled.png" alt="" /></li>
						</xsl:otherwise>
					</xsl:choose>
				</ul>
			</div>
			<div class="profile">
				<div id="profile-left">
					<div id="tabs">
						<div id="tab1">
							<xsl:if test="photo"><img src="{$workspace}{photo/@path}/{photo/filename}" alt="" /></xsl:if>
						</div>
						<ul style="display: none;">
							<li class="active"><a href="#tab1">1</a></li>
						</ul>
					</div>
				</div>
				<div id="profile-right">
					<h2><xsl:value-of select="member/item"/></h2>
					<h3><xsl:value-of select="title"/></h3>
					<xsl:copy-of select="biography/*"/>
					<p>
						<xsl:if test="twitter">Follow <xsl:value-of select="first-name"/> on Twitter: 
							<a href="http://www.twitter.com/{twitter}">twitter.com/<xsl:value-of select="twitter"/></a><br />
						</xsl:if>
						<xsl:if test="$team-member/email-address and $team-member/role/@id &gt; 2">Email: 
							<a href="mailto:{$team-member/email-address}"><xsl:value-of select="$team-member/email-address"/></a><br />
						</xsl:if>
						<xsl:if test="phone">Phone: 
							<xsl:value-of select="phone"/>
						</xsl:if>
					</p>
				</div>
			</div>
			<div id="profile-more-info">
				<div class="profile-more-container">
					<div class="profile-more" id="tweets">
						<h3>Latest Tweet</h3>
						<xsl:choose>
							<xsl:when test="twitter and /data/twitter-team/status">
								<xsl:for-each select="/data/twitter-team/status">
									<xsl:call-template name="list-tweets" />
								</xsl:for-each>
								<a href="http://twitter.com/{twitter}" class="profile-more-link">Follow
								<xsl:value-of select="first-name"/> on Twitter</a>
							</xsl:when>
							<xsl:otherwise>
								<ul>
									<xsl:for-each select="/data/twitter/status">
										<xsl:call-template name="list-tweets" />
									</xsl:for-each>
								</ul>
								<a href="http://twitter.com/username" class="profile-more-link">Follow us on Twitter</a>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="profile-more">
						<h3>Latest on the Blog</h3>
						<a href="{$root}/blog/" class="profile-more-link">Read more <xsl:value-of select="$website-name" /> blog posts</a>
						<xsl:choose>
							<xsl:when test="/data/articles-team/entry">
								<xsl:for-each select="/data/articles-team/entry">
									<xsl:call-template name="article-excerpt" />
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="/data/latest-articles/entry">
									<xsl:call-template name="article-excerpt" />
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>
	</xsl:for-each>
</xsl:template>

<xsl:template name="article-excerpt">
	<div class="post">
		<span class="date">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'M x, Y'"/>
			</xsl:call-template>
		</span><br />
		<a href="{$root}/blog/{title/@handle}/" class="title"><xsl:call-template name="article-title" /></a>
		<xsl:apply-templates select="body" mode="truncate-paragraphs">
			<xsl:with-param name="limit" select="180" />
		</xsl:apply-templates>
	</div>
</xsl:template>

<xsl:template name="team-rows">
	<xsl:param name="count" select="1"/>
	<xsl:param name="items-per-row" select="8"/>
	<xsl:param name="total" select="count(team-snapshot/entry)"/>
	<div class="row">
		<xsl:call-template name="team-thumbs">
			<xsl:with-param name="count" select="$count"/>
		</xsl:call-template>
	</div>
	<xsl:if test="$count &lt; $total">
		<xsl:call-template name="team-rows">
			<xsl:with-param name="count" select="$count + $items-per-row"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="team-thumbs">
	<xsl:param name="index" select="1"/>
	<xsl:param name="count" select="1"/>
	<xsl:for-each select="team-snapshot/entry[$count]">
		<div class="person">
			<a href="{$root}/team/{member/item/@handle}/" class="border">
				<div class="team-listing-img" style=
				"background: url({$workspace}{avatar/@path}/{avatar/filename});">
				</div>
			</a>
			<a href="{$root}/team/{member/item/@handle}/" class="name"><xsl:value-of select="member/item"/></a><br class="clearing" />
			<span class="position"><xsl:value-of select="title"/></span>
		</div>
	</xsl:for-each>
	<xsl:if test="$index &lt; 8">
		<xsl:call-template name="team-thumbs">
			<xsl:with-param name="index" select="$index + 1"/>
			<xsl:with-param name="count" select="$count + 1"/>
		</xsl:call-template>
	</xsl:if>
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