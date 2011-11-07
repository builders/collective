<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl" />
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/html-truncate-advanced.xsl"/>
<xsl:import href="../utilities/twitter.xsl"/>

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/people.css?v1.0" />
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<article class="content">
			<h1><xsl:value-of select="$page-title"/></h1>
			<xsl:choose>
				<xsl:when test="$team-member">
					<xsl:call-template name="personal-profile"/>
				</xsl:when>
				<xsl:otherwise>
					<ul class="people">
						<xsl:apply-templates select="people/entry" />
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</article>
	</section>
</xsl:template>

<xsl:template match="people/entry">
	<li class="person">
		<a href="{$root}/{$current-page}/{member/item/@handle}/" class="avatar">
			<img src="{$workspace}{avatar/@path}/{avatar/filename}" alt="{member/item}" />
		</a>
		<div class="details">
			<h5><a href="{$root}/{$current-page}/{member/item/@handle}/" class="name"><xsl:value-of select="member/item"/></a></h5>
			<p class="position"><xsl:value-of select="title"/></p>
			<p class="email"><xsl:value-of select="email"/></p>
			<p class="phone"><xsl:value-of select="phone"/></p>
		</div>
	</li>
</xsl:template>

<xsl:template name="personal-profile">
	<xsl:param name="team-member" select="/data/member/entry"/>
	<xsl:param name="team-member-id" select="team-profile/entry/@id"/>
	<xsl:param name="prev" select="people/entry[@id = $team-member-id]/preceding-sibling::entry[1]/member/item/@handle"/>
	<xsl:param name="next" select="people/entry[@id = $team-member-id]/following-sibling::entry[1]/member/item/@handle"/>
	<xsl:for-each select="team-profile/entry">
		<div id="profile-header">
			<ul class="gallery-nav">
				<xsl:choose>
					<xsl:when test="$prev">
						<li class="prev"><a href="{$root}/{$current-page}/{$prev}/">Previous</a></li>
					</xsl:when>
					<xsl:otherwise>
						<li class="prev"><a href="#" class="disabled">Previous</a></li>
					</xsl:otherwise>
				</xsl:choose>
				<li class="thumbs"><a href="{$root}/{$current-page}/">Thumbs</a></li>
				<xsl:choose>
					<xsl:when test="$next">
						<xsl:if test="$next"><li class="next"><a href="{$root}/{$current-page}/{$next}/">Next</a></li></xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<li class="next"><a href="#" class="disabled">Next</a></li>
					</xsl:otherwise>
				</xsl:choose>
			</ul>
		</div>
		<div class="profile">
			<div class="photo">
				<xsl:if test="photo"><img src="{$workspace}{photo/@path}/{photo/filename}" alt="" /></xsl:if>
			</div>
			<div class="details">
				<h2><xsl:value-of select="member/item"/></h2>
				<h3><xsl:value-of select="title"/></h3>
				<xsl:copy-of select="biography/*"/>
				<p>
					<xsl:if test="twitter">Follow <xsl:value-of select="first-name"/> on Twitter: 
						<a href="http://www.twitter.com/{twitter}">twitter.com/<xsl:value-of select="twitter"/></a><br />
					</xsl:if>
					<xsl:if test="$team-member/email-address">Email: 
						<a href="mailto:{$team-member/email-address}"><xsl:value-of select="$team-member/email-address"/></a><br />
					</xsl:if>
					<xsl:if test="phone">Phone: 
						<xsl:value-of select="phone"/>
					</xsl:if>
				</p>
			</div>
		</div>
		<div class="profile-info">
			<div class="profile-online">
				<h3>
					<xsl:choose>
						<xsl:when test="twitter">
							<span><xsl:value-of select="first-name"/> Online</span>
						</xsl:when>
						<xsl:otherwise>
							<span><xsl:value-of select="$website-name" /> Online</span>
						</xsl:otherwise>
					</xsl:choose>
				</h3>
				<p>As a team and as individuals we're active social media users and spend
				hours scavenging the internet. Check out what
				<xsl:choose>
					<xsl:when test="twitter">
						<xsl:value-of select="first-name"/>'s</xsl:when>
					<xsl:otherwise> <xsl:value-of select="$website-name" />'s</xsl:otherwise>
				</xsl:choose>
				been up to.</p>
				<p class="want-more">Want more?<br />
				<a href=
				"http://www.google.ca/search?hl=en&amp;safe=off&amp;q={first-name}%20{last-name}&amp;btnG=Search&amp;meta=">
				Click here to Google search keyword "<xsl:value-of select="member/item"/>"</a></p>
			</div>
			<div class="recently">
				<div class="recent" id="recent-tweets">
					<h3>Latest Tweet</h3>
					<xsl:choose>
						<xsl:when test="twitter and /data/twitter-team/status">
							<xsl:for-each select="/data/twitter-team/status">
								<xsl:call-template name="list-tweets" />
							</xsl:for-each>
							<a href="http://twitter.com/{twitter}" class="more-link">Follow
							<xsl:value-of select="first-name"/> on Twitter</a>
						</xsl:when>
						<xsl:otherwise>
							<ul>
								<xsl:for-each select="/data/twitter/status">
									<xsl:call-template name="list-tweets" />
								</xsl:for-each>
							</ul>
							<a href="http://twitter.com/username" class="more-link">Follow <xsl:value-of select="$website-name" /> on Twitter</a>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="recent" id="recent-articles">
					<h3>Latest on the D7 Blog</h3>
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
					<a href="{$root}/blog/" class="more-link">Read more <xsl:value-of select="$website-name" /> blog posts</a>
				</div>
				<div class="recent" id="recent-projects">
					<h3>Interesting Stuff</h3>
					<p><strong>Recent Projects</strong><br /></p>
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
		<a href="{$root}/blog/{title/@handle}/" class="title"><xsl:value-of select="title" /></a>
		<xsl:call-template name="truncate">
			<xsl:with-param name="node" select="body" />
			<xsl:with-param name="limit" select="140" />
		</xsl:call-template>
	</div>
</xsl:template>

</xsl:stylesheet>