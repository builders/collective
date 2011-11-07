<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/common.xsl"/>
<xsl:import href="../utilities/system-navigation.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output
	method="html"
	media-type="text/html"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="name" select="/data/events/login-info/name"/>
<xsl:variable name="username" select="/data/events/login-info/username"/>
<xsl:variable name="user-type" select="/data/events/login-info/@user-type"/>
<xsl:variable name="user-id" select="/data/events/login-info/@id"/>

<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;
</xsl:text>
	<html>
		<xsl:call-template name="page-header"/>
		<body id="section-overview" class="projects">
			<xsl:call-template name="system-navigation"/>
			<header>
				<h2 id="branding">
					<a href="{$root}/" title="Home"><xsl:value-of select="$website-name"/></a>
				</h2>
				<nav>
					<ul>
						<li class="current">
							<a href="{$root}/">Dashboard</a>
						</li>
						<li>
							<a href="{$root}/forum/">Forum</a>
						</li>
					</ul>
				</nav>
			</header>
			<nav class="secondary">
				<ul>
					<xsl:apply-templates select="data/navigation"/>
					<!-- xsl:call-template name="secondary-navigation"/ -->
					<li class="current"><a href="#">Home</a></li>
					<li><a href="#">Lab</a></li>
					<ul id="tools" class="right">
						<xsl:choose>
							<xsl:when test="$is-logged-in">
								<li>
									<a href="{$root}/symphony/system/authors/edit/{$user-id}/" title="Edit user profile"><xsl:value-of select="$name"/></a>
								</li>
								<li>
									<a href="{$root}/symphony/logout/">Logout</a>
								</li>
							</xsl:when>
							<xsl:otherwise>
								<li>
									<a href="{$root}/login/">Login</a>
								</li>
							</xsl:otherwise>
						</xsl:choose>
					</ul>
				</ul>
			</nav>
			<div id="page">
				<div class="box">
					<xsl:apply-templates/>
				</div>
			</div>
			<xsl:call-template name="page-footer"/>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>