<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/page-not-found.xsl"/>

<xsl:param name="page-not-found">
	<xsl:choose>
		<xsl:when test="$project and /data/work-project/error = 'No records found.'">yes</xsl:when>
		<xsl:otherwise>no</xsl:otherwise>
	</xsl:choose>
</xsl:param>

<xsl:param name="body-class">
	<xsl:choose>
		<xsl:when test="$project">content-page project-page</xsl:when>
		<xsl:otherwise>content-page</xsl:otherwise>
	</xsl:choose>
</xsl:param>

<xsl:param name="filter" select="$project" />
<xsl:param name="filter-title" select="/data/work-project/entry/project" />

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
		<xsl:when test="$project">
			<xsl:choose>
				<xsl:when test="$page-not-found = 'yes'">
					<div id="content" class="page-not-found">
						<xsl:call-template name="page-not-found" />
					</div>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="project-details"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="projects"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="projects">
	<div id="content">
		<div class="intro">
			<p>An intro goes here.</p>
		</div>
		<div id="work-left">
			<h3>Work Categories</h3>
			<ul id="work-nav">
				<li class="active"><a href="{$root}/results/">All work &gt;</a></li>
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
							<li><a href="{$root}/results/industry/{title/@handle}/"><xsl:value-of select="title"/></a></li>
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

<xsl:template name="project-details">
	<xsl:param name="work-project" select="/data/work-project/entry"/>
	<xsl:param name="work-project-id" select="work-project/entry/@id"/>
	<xsl:param name="prev" select="work/entry[@id = $work-project-id]/preceding-sibling::entry[1]/project/@handle"/>
	<xsl:param name="next" select="work/entry[@id = $work-project-id]/following-sibling::entry[1]/project/@handle"/>
	<xsl:for-each select="work-project/entry">
		<div id="content">
			<div id="project-header">
				<ul id="project-nav">
					<xsl:choose>
						<xsl:when test="$prev">
							<li id="project-nav-last"><a href="{$root}/results/{$prev}/">Last</a></li>
						</xsl:when>
						<xsl:otherwise>
							<li id="project-nav-last"><img src="{$workspace}/assets/public/img/prev-arrow-disabled.png" alt="" /></li>
						</xsl:otherwise>
					</xsl:choose>
					<li id="project-nav-thumbs"><a href="{$root}/results/">Thumbs</a></li>
					<xsl:choose>
						<xsl:when test="$next">
							<xsl:if test="$next"><li id="project-nav-next"><a href="{$root}/results/{$next}/">Next</a></li></xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<li id="project-nav-next"><img src="{$workspace}/assets/public/img/next-arrow-disabled.png" alt="" /></li>
						</xsl:otherwise>
					</xsl:choose>
				</ul>
			</div>
			<div id="project-container">
				<div id="work-left">
					<h3><xsl:value-of select="project"/></h3>
					<xsl:copy-of select="description/*"/>
					<xsl:if test="site"><p><strong>Visit site:</strong> <a href="{site}"><xsl:value-of select="site"/></a></p></xsl:if>
					<xsl:if test="project-type/item or industry-sectors/item">
						<h4>Categories</h4>
						<ul>
							<xsl:if test="project-type/item">
								<li>Project Type
									<ul>
										<xsl:for-each select="project-type/item">
											<li><a href="{$root}/results/project/{@handle}/"><xsl:value-of select="."/></a></li>
										</xsl:for-each>
									</ul>
								</li>
							</xsl:if>
							<xsl:if test="industry-sectors/item">
								<li>Industry Sector
									<ul>
										<xsl:for-each select="industry-sectors/item">
											<li><a href="{$root}/results/industry/{@handle}/"><xsl:value-of select="."/></a></li>
										</xsl:for-each>
									</ul>
								</li>
							</xsl:if>
						</ul>
					</xsl:if>
					<xsl:if test="credits/*">
						<h4>Credits</h4>
						<xsl:copy-of select="credits/*"/>
					</xsl:if>
				</div>
				<div id="work-right">
					<div id="project-feature">
						<xsl:for-each select="portfolio/item">
							<div class="project-feature-img-top"></div>
							<div class="project-feature-img">
								<img src="{$workspace}/{photo/@path}/{photo/filename}" width="{photo/meta/@width}" height="{photo/meta/@height}" alt="{title}" />
							</div>
							<div class="project-feature-img-bottom"></div>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>
	</xsl:for-each>
</xsl:template>


<xsl:template name="work-rows">
	<xsl:param name="count" select="1"/>
	<xsl:param name="items-per-row" select="3"/>
	<xsl:param name="total" select="count(work/entry)"/>
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
	<xsl:for-each select="work/entry[$count]">
		<a href="{$root}/results/{project/@handle}/">
			<xsl:if test="$index = 1"><xsl:attribute name="class">first</xsl:attribute></xsl:if>
			<img src="{$workspace}{site-thumbnail/@path}/{site-thumbnail/filename}" width="198" height="150" alt="{project}" />
			<span class="title"><xsl:value-of select="project"/></span>
			<!-- xsl:if test="site-launch-date">
				<span class="launch-date">
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="site-launch-date"/>
						<xsl:with-param name="format" select="'M x / Y'"/>
					</xsl:call-template>
				</span>
			</xsl:if -->
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