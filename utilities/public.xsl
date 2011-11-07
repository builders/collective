<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/get-google-analytics.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:param name="page-not-found" select="'no'" />
<xsl:param name="filter" select="false()" />
<xsl:param name="filter-title" select="false()" />
<xsl:param name="tag-line" select="'A Clever Tag Line'" />

<xsl:template name="page-heading">
	<h2><xsl:value-of select="$page-title" /></h2>
</xsl:template>

<xsl:template match="/">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
			<title><xsl:call-template name="page-title" /></title>
			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="alternate" type="application/rss+xml" title="RSS" href="{$root}/rss/" />
			<link rel="stylesheet" media="screen" href="{$workspace}/assets/public/css/screen.css" />
			<link rel="stylesheet" media="screen" href="{$workspace}/assets/public/css/content.css" />
		</head>
		<body id="page-{$current-page}">
			<div class="page">
				<div class="header">
					<div class="area">
						<ul class="nav user">
							<li><a href="#">Log In</a></li>
							<li><a href="#">Register</a></li>
							<li><a href="#">Help</a></li>
						</ul>
					</div>
				</div>
				<div class="site">
					<div class="site-branding area">
						<h2 class="site-name content">
							<a href="{$root}/"><xsl:value-of select="$website-name" /></a>
						</h2>
					</div>
				</div>
				<div class="navigation">
					<div class="area">
						<ul class="nav main-nav">
							<xsl:call-template name="main-navigation" />
							<li class="search">
								<form><input type="search" name="search" value="Search"/></form>
							</li>
						</ul>
					</div>
				</div>
				<div class="sections">
					<div class="area">
						<div class="main section thirds">
							<div class="subsection compound">
								<div class="content">
									<h1><xsl:call-template name="page-heading" /></h1>
									<xsl:apply-templates />
								</div>
							</div>
							<div class="subsection">
							</div>
						</div>
					</div>
				</div>
				<div class="site-info">
					<div class="copyright area">
						<ul class="nav">
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms of Use</a></li>
							<li><a href="#">Contact</a></li>
							<li class="rssfeed"><a href="{$root}/rss/" class="rss">RSS Feed</a></li>
						</ul>
						<p class="content">&#169; 2011 <xsl:value-of select="$website-name" /></p>
					</div>
				</div>
			</div>
			<!-- xsl:call-template name="get-google-analytics">
				<xsl:with-param name="tracker" select="''" />
			</xsl:call-template -->
			<xsl:apply-templates mode="js" />
		</body>
	</html>
</xsl:template>

<xsl:template match="data" mode="js" />

<xsl:template name="mailing-list-form">
	<form id="mailing-list" method="post" action="">
		<label>Sign Up</label>
		<input type="text" id="email" name="fields[email]" title="Enter Your Email Address" value="Enter Your Email Address" class="clear-on-focus" />
		<input name="fields[date]" value="{$today}" type="hidden" />
		<input name="fields[subscribe]" value="Yes" type="hidden" />
		<input name="send-email[sender-email]" value="fields[email]" type="hidden" />
		<input name="send-email[sender-name]" value="{$website-name} Mailing List" type="hidden" />
		<input name="send-email[subject]" value="Add me to the mailing list" type="hidden" />
		<input name="send-email[body]" value="Please add my email address to the {$website-name} newsletter mailing list." type="hidden" />
		<input name="send-email[recipient]" value="stephen" type="hidden" />
		<input name="action[add-to-mailing-list]" value="Sign Me Up!" type="submit" id="submit" />
	</form>
</xsl:template>

<xsl:template name="page-title">
	<xsl:choose>
		<xsl:when test="$page-not-found = 'yes'">
			<xsl:text>Page Not Found | </xsl:text>
			<xsl:value-of select="$website-name" />
		</xsl:when>
		<xsl:when test="$filter">
			<xsl:value-of select="$filter-title" />
			<xsl:text> | </xsl:text>
			<xsl:value-of select="$page-title" />
			<xsl:text> | </xsl:text>
			<xsl:value-of select="$website-name" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:if test="$current-page != 'home'"><xsl:value-of select="$page-title"/><xsl:text> | </xsl:text></xsl:if>
			<xsl:value-of select="$website-name" />
			<xsl:if test="$current-page = 'home'"><xsl:text> | </xsl:text><xsl:value-of select="$tag-line" /></xsl:if>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="main-navigation">
	<xsl:for-each select="/data/navigation/page[types/type='main']">
		<li id="nav-{@handle}">
			<a href="{$root}/{@handle}/">
				<xsl:if test="@handle = 'home'">
					<xsl:attribute name="href"><xsl:value-of select="concat($root, '/')" /></xsl:attribute>
				</xsl:if>
				<xsl:if test="@handle = $current-page and $page-not-found = 'no'">
					<xsl:attribute name="class">current</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="name" />
			</a>
		</li>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>