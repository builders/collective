<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:media="http://search.yahoo.com/mrss/"
	exclude-result-prefixes="media">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/html-truncate-advanced.xsl"/>
<xsl:import href="../utilities/html-truncate.xsl"/>
<xsl:import href="../utilities/twitter.xsl"/>

<xsl:template name="page-heading" />

<xsl:template match="data">
	<ul>
		<xsl:for-each select="flickr/item">
			<li>
				<a href="{link}">
					<img src="{concat(substring-before(media:thumbnail/@url,'s.jpg'), 'm.jpg')}" width="112" alt="" />
				</a>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template name="home-page-content">
	<div id="home-content">
		<div id="home-feature-left">
			<div id="slideshow">
				<ul>
					<xsl:for-each select="articles-home/entry" >
						<li>
							<a href="{$root}/blog/{title/@handle}/"><img src="{$workspace}{home-page-image/@path}/{home-page-image/filename}" alt="{title}" /></a>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</div>
		<div id="home-content-right">
			<div id="latest-work">
				<h3>Latest Work</h3>
				<div class="slides">
					<xsl:call-template name="work-rows"/>
				</div>
				<ul id="latest-work-nav">
					<li id="prev"><a href="#">Last</a></li>
					<li id="next"><a href="#">Next</a></li>
				</ul>
			</div>
		</div><br class="clearing" />
		<div id="home-recent">
			<ul id="recent-nav">
				<li><img src="{$workspace}/assets/public/img/most-recently-title.png" alt=
				"Most Recently from D7:" /></li>
				<li id="recent-nav-twitter" class="active"><span>Twitter</span></li>
				<li id="recent-nav-blog"><span>Blog</span></li>
				<li id="recent-nav-flickr"><span>Flickr</span></li>
				<li class="last"><a href="http://www.facebook.com/username">Facebook</a></li>
			</ul>
			<div id="home-recent-content">
				<div class="tweets-holder home-recent-content-holder">
					<div class="inside">
						<ul>
							<xsl:for-each select="twitter/status">
								<xsl:call-template name="list-tweets" />
							</xsl:for-each>
						</ul>
					</div><a href="http://www.twitter.com/username" class=
					"follow-on-twitter">Follow us on Twitter</a>
				</div>
				<div class="blogPosts-holder home-recent-content-holder">
					<div class="inside">
						<xsl:for-each select="/data/articles-latest/entry">
							<div class="blog-article">
								<h2>
									<a href="{$root}/blog/{title/@handle}/">
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
								<xsl:apply-templates select="body" mode="truncate-paragraphs">
									<xsl:with-param name="limit" select="180" />
								</xsl:apply-templates>
							</div>
						</xsl:for-each>
					</div><a href="{$root}/blog/" class="follow-on-twitter">View Our Blog</a>
				</div>
				<div class="flickr-holder home-recent-content-holder">
					<div class="inside">
						<ul>
							<xsl:for-each select="flickr/item">
								<li>
									<a href="{link}">
										<img src="{concat(substring-before(media:thumbnail/@url,'s.jpg'), 'm.jpg')}" width="112" alt="" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div><a href="http://www.flickr.com/photos/username" class="follow-on-twitter">Find us on Flickr</a>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template name="work-rows">
	<xsl:param name="count" select="1"/>
	<xsl:param name="items-per-row" select="2"/>
	<xsl:param name="total" select="count(latest-work/entry)"/>
	<div class="slide">
		<xsl:call-template name="work-thumbs">
			<xsl:with-param name="count" select="$count"/>
			<xsl:with-param name="items-per-row" select="$items-per-row"/>
		</xsl:call-template>
	</div>
	<xsl:if test="$count &lt; ($total - 1)">
		<xsl:call-template name="work-rows">
			<xsl:with-param name="count" select="$count + $items-per-row"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="work-thumbs">
	<xsl:param name="index" select="1"/>
	<xsl:param name="count" select="1"/>
	<xsl:param name="items-per-row"/>
	<xsl:for-each select="latest-work/entry[$count]">
		<div class="latest-work-left">
			<xsl:if test="$count = 2 or $count = 4"><xsl:attribute name="class">latest-work-right</xsl:attribute></xsl:if>
			<a href="{$root}/results/{project/@handle}/" class="thumb">
				<img src="{$workspace}{site-thumbnail/@path}/{site-thumbnail/filename}" width="198" height="150" alt="{project}" />
			</a>
			<h4><a href="{$root}/results/{project/@handle}/"><xsl:value-of select="project"/></a></h4>
			<xsl:call-template name="truncate">
				<xsl:with-param name="node" select="description" />
				<xsl:with-param name="limit" select="230" />
			</xsl:call-template>
		</div>
	</xsl:for-each>
	<xsl:if test="$index &lt; $items-per-row">
		<xsl:call-template name="work-thumbs">
			<xsl:with-param name="index" select="$index + 1"/>
			<xsl:with-param name="count" select="$count + 1"/>
			<xsl:with-param name="items-per-row" select="$items-per-row"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>