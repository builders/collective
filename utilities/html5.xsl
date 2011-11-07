<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- HTML5 Master Stylesheet: http://symphony-cms.com/download/xslt-utilities/view/46256/ -->

<xsl:import href="../utilities/page-title.xsl" />
<xsl:import href="../utilities/navigation.xsl" />
<xsl:import href="../utilities/date-time.xsl" />

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="member" select="/data/events/member-login-info"/>
<xsl:variable name="member-username" select="$member/username-and-password/@username"/>
<xsl:variable name="logged-in" select="/data/events/member-login-info/@logged-in"/>
<xsl:variable name="permissions" select="/data/events/member-login-info/permissions"/>

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in" />

<xsl:template match="/">
	<html lang="en">
		<head>
			<meta name="title" content="{$page-title}" />
			<meta name="description" content="" />
			<meta name="tags" content="" />
			<title><xsl:call-template name="page-title"/></title>
			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="icon" type="images/png" href="/favicon.png" />
			<link rel="stylesheet" media="screen" href="{$workspace}/assets/css/main.css" />
			<script>document.documentElement.className = "js";</script>
		</head>
		<body id="{$current-page}-page">
			<xsl:apply-templates />
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
			<script src="{$workspace}/assets/js/system.js"></script>
			<!--[if lte IE 8]>
				<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<![endif]-->
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>