<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:param name="filter" select="$sector" />
<xsl:param name="filter-title" select="/data/industry-sectors/entry[title/@handle = $sector]/title" />

<xsl:template match="data">
	<div id="content">
		<div id="intro">
			<p>There&#8217;s a cynical saying in our business: you&#8217;re only as good as the last
			project you worked on. Kind of a depressing thought &#151; unless you&#8217;re
			proud of all your work. Which we happen to be. But don&#8217;t take our decidedly
			un-humble word for it. Check out some of our most recent work and decide for
			yourself. <a href="{$root}/contact/">Interested?</a><br /></p>
		</div><br class="clearing" />
		<div id="work-left">
			<h3>Work Categories</h3>
			<ul id="work-nav">
				<li><a href="{$root}/results/">All work</a></li>
				<li>Project Type
					<ul>
						<xsl:for-each select="project-types/entry">
							<li><a href="{$root}/results/project/{title/@handle}/"><xsl:value-of select="title"/></a></li>
						</xsl:for-each>
					</ul>
				</li>
				<li>Industry Sector
					<ul>
						<xsl:for-each select="industry-sectors/entry">
							<li>
								<xsl:if test="$sector = title/@handle"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
								<a href="{$root}/results/industry/{title/@handle}/">
									<xsl:value-of select="title"/>
									<xsl:if test="$sector = title/@handle"> &gt;</xsl:if>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</li>
			</ul>
		</div>
		<div id="work-right">
			<div id="work-listing">
  			<xsl:call-template name="work-rows"/>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template name="work-rows">
	<xsl:param name="count" select="1"/>
	<xsl:param name="items-per-row" select="3"/>
	<xsl:param name="total" select="count(work-by-industry/entry)"/>
	<div class="row">
		<xsl:call-template name="work-thumbs">
			<xsl:with-param name="count" select="$count"/>
			<xsl:with-param name="items-per-row" select="$items-per-row"/>
		</xsl:call-template>
	</div>
	<xsl:if test="$count &lt; $total">
		<xsl:call-template name="work-rows">
			<xsl:with-param name="count" select="$count + $items-per-row"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="work-thumbs">
	<xsl:param name="index" select="1"/>
	<xsl:param name="count" select="1"/>
	<xsl:param name="items-per-row"/>
	<xsl:for-each select="work-by-industry/entry[$count]">
		<a href="{$root}/results/{project/@handle}/">
			<xsl:if test="$index = 1"><xsl:attribute name="class">first</xsl:attribute></xsl:if>
			<img src="{$workspace}{site-thumbnail/@path}/{site-thumbnail/filename}" width="198" height="150" alt="{project}" />
			<span class="title"><xsl:value-of select="project"/></span>
			<span class="launch-date">
				<xsl:call-template name="format-date">
				  <xsl:with-param name="date" select="site-launch-date"/>
				  <xsl:with-param name="format" select="'M x / Y'"/>
				</xsl:call-template>
			</span>
		</a>
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