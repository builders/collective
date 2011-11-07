<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/common.xsl"/>
<xsl:import href="../utilities/system-navigation.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>

<xsl:include href="../utilities/date-time.xsl"/>
<xsl:include href="../utilities/typography.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="name" select="/data/events/login-info/name"/>
<xsl:variable name="username" select="/data/events/login-info/username"/>
<xsl:variable name="user-type" select="/data/events/login-info/@user-type"/>
<xsl:variable name="user-id" select="/data/events/login-info/@id"/>

<xsl:variable name="logged-in" select="/data/events/member-login-info/@logged-in"/>
<xsl:variable name="member" select="/data/member-info/entry"/>
<xsl:variable name="member-username" select="/data/member-info/entry/username"/>
<xsl:variable name="permissions" select="/data/member-info/entry/role"/>

<xsl:variable name="openid-first" select="/data/events/openid-data/sreg-data/property[@key='first']" />
<xsl:variable name="openid-last" select="/data/events/openid-data/sreg-data/property[@key='last']" />
<xsl:variable name="openid-email" select="/data/events/openid-data/sreg-data/property[@key='email']" />

<xsl:variable name="current-uri-path" select="substring-before($current-url,'?')" />

<xsl:param name="access" select="'members'" />

<xsl:template match="/">
	<html lang="en">
		<head>
			<xsl:apply-templates mode="page-title" />
	
			<meta name="description" content="" />
			<meta name="author" content="" />
	
			<!--  Mobile viewport optimized: j.mp/bplateviewport -->
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
			<xsl:apply-templates mode="css" />
	
			<!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
			<script src="{$workspace}/assets/intranet/js/lib/modernizr-1.6.min.js"></script>
		</head>
		<body id="{$current-page}-page">
			<xsl:choose>
				<xsl:when test="$logged-in = 'yes' or $user-type = 'developer' or $access = 'public'">
					<xsl:apply-templates select="data/params/readonly-mode[. = 'yes']" />
					<div class="user">
						<xsl:call-template name="login-panel" />
					</div>
					<div class="page">
						<xsl:apply-templates mode="header" />
						<xsl:apply-templates mode="nav" />
						<xsl:apply-templates mode="aside" />
						<xsl:apply-templates />
						<xsl:apply-templates mode="footer" />
						<xsl:apply-templates mode="js" />
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="user">
						<xsl:call-template name="login-panel" />
					</div>
					<div class="page">
						<xsl:apply-templates mode="header" />
						<xsl:call-template name="openid-authenticate" />
						<xsl:apply-templates mode="footer" />
						<xsl:apply-templates mode="js" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</body>
	</html>
</xsl:template>

<xsl:template name="default">
	<section class="main">
		<div class="content">
			<h1>Hello.</h1>
			<h2>Welcome to <xsl:value-of select="$website-name" /></h2>
			<p>We control the vertical. We control the horizontal. Tune in to enjoy the programming.</p>
			<p class="resource-meta">If you are having trouble accessing this site, you can try <a href="{$root}/members/reset-pass/">resetting your password</a> (but only if you are already a member).</p>
		</div>
	</section>
</xsl:template>

<xsl:template name="openid-authenticate">
	<section class="main">
		<div class="content">
			<h1>Hello.</h1>
			<h2>Welcome to <xsl:value-of select="$website-name" /></h2>
			<p>We control the vertical. We control the horizontal. Tune in to enjoy the programming.</p>
			<xsl:choose>
				<xsl:when test="data/events/openid-auth/authentication[@status = 'success']">
					<xsl:apply-templates select="data/events/openid-auth/authentication" />
				</xsl:when>
				<xsl:when test="$openid-email">
					<xsl:call-template name="openid-success" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="openid-form" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</section>
</xsl:template>

<xsl:template name="openid-form">
	<h3>Access</h3>
	<p>You can access this site with OpenID.</p>
	<form action="" method="get" id="openid-form">
		<input type="hidden" name="action" value="verify" />
		<fieldset>
			<legend>Sign in with your Google account</legend>
			<div id="openid-input_area">
				<input id="openid-identifier" name="openid-identifier" type="hidden" value="example.com" />
				<input id="openid-submit" type="submit" value="Sign In" />
			</div>
		</fieldset>
	</form>
</xsl:template>

<xsl:template match="data/events/openid-auth/authentication">
	<h3>Success</h3>
	<p>Hello, <xsl:value-of select="sreg-data/property[@key='first']" />. You have successfully signed in to this site with OpenID.</p>
	<p><a href="{$current-uri-path}?openid-action=logout">Logout</a> to end your session.</p>
</xsl:template>

<xsl:template name="openid-success">
	<h3>Success</h3>
	<p>Hello, <xsl:value-of select="$openid-first" />. You have successfully signed in to this site with OpenID.</p>
	<p><a href="{$current-uri-path}?openid-action=logout">Logout</a> to end your session.</p>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<xsl:param name="site-name" select="$website-name" />
	<title>
		<!-- If not the homepage -->
		<xsl:if test="$current-path != '/'">
			<xsl:value-of select="$page-title" />
			<xsl:text> | </xsl:text>
		</xsl:if>
		<xsl:value-of select="$site-name"/>
	</title>
</xsl:template>

<xsl:template match="data" mode="css">
	<!-- CSS : implied media="all" -->
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<xsl:if test="$root-page = 'forum'">
		<link rel="stylesheet" href="{$workspace}/assets/intranet/css/forum.css?v1.0" />
	</xsl:if>
	<xsl:if test="$root-page = 'members'">
		<link rel="stylesheet" href="{$workspace}/assets/intranet/css/members.css?v1.0" />
	</xsl:if>
</xsl:template>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
</xsl:template>

<xsl:template match="data" mode="header">
	<header class="masthead">
		<h1 class="logo"><a href="{$root}/"><xsl:value-of select="$website-name" /></a></h1>
		<xsl:if test="$logged-in = 'yes' or $is-logged-in = 'true'">
			<nav>
				<ul class="menu menu-buttons">
					<xsl:apply-templates select="member-navigation/page" />
				</ul>
			</nav>
		</xsl:if>
	</header>
</xsl:template>

<xsl:template match="data" mode="nav" />

<xsl:template match="data" mode="aside" />

<xsl:template match="member-navigation/page">
	<li id="nav-{@handle}">
		<xsl:if test="@handle = $current-page or @handle = $root-page">
			<xsl:attribute name="class">current</xsl:attribute>
		</xsl:if>
		<a href="{$root}/{@handle}/">
			<xsl:value-of select="name" />
		</a>
	</li>
</xsl:template>

<xsl:template match="data" mode="footer">
	<footer>
		<h4><a href="{$root}/"><xsl:value-of select="$website-name" /></a></h4>
	</footer>
</xsl:template>

<xsl:template name="login-panel">
	<xsl:choose>
		<xsl:when test="/data/events/member-login-info/role = 'Inactive'">
			<div class="user-nav">
				<ul>
					<li>Account is not active.</li>
					<li><a class="button" href="{$root}/members/activate/">Activate</a></li>
					<li> or </li>
					<li><a class="button" href="{$current-uri-path}?openid-action=logout">Logout</a></li>
				</ul>
			</div>
		</xsl:when>
		<xsl:when test="/data/events/member-login-info/@logged-in = 'yes'">
			<div class="user-nav">
				<ul>
					<li>Logged in as <a href="{$root}/people/{/data/member-info/entry/name/@handle}/"><xsl:value-of select="/data/member-info/entry/name"/></a>
					</li>
					<li>
						<a href="{$root}/members/{$member-username}/">My Profile</a>
					</li>
					<li>
						<a class="button" href="{$current-uri-path}?openid-action=logout"><xsl:if test="$openid-email"><xsl:attribute name="href"><xsl:value-of select="$current-uri-path" />?openid-action=logout</xsl:attribute></xsl:if>Logout</a>
					</li>
				</ul>
			</div>
		</xsl:when>
		<xsl:when test="/data/events/member-login-info/@result = 'error'">
			<div id="login-panel">
				<form id="failed-login" action="{$current-url}" method="post">
					<fieldset>
						<p>Login Failed.
							<input id="submit" type="submit" name="reset" value="Try Again" class="button"/>
							<span class="reset">or <a class="button" href="{$root}/members/reset-pass/">Reset Password</a></span>
						</p>
					</fieldset>
				</form>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="login-panel">
				<form action="" method="get" id="openid-login">
					<input type="hidden" name="action" value="verify" />
					<fieldset>
						<input class="openid-identifier" name="openid-identifier" type="hidden" value="example.com" />
						<input class="openid-submit button" type="submit" value="Sign In" />
						<p><strong>Sign in</strong> with <a href="http://www.google.com/apps/">Google Apps</a></p>
					</fieldset>
				</form>
				<form id="member-login" action="{$current-url}" method="post">
					<fieldset>
						<ul>
							<li><input name="fields[username]" title="username" type="text" value="username" class="clear-on-focus"/></li>
							<li><input name="fields[password]" title="chipmonk" type="password" value="chipmonk" class="clear-on-focus"/></li>
							<li><input name="redirect" type="hidden" value="{$root}/dashboard/"/><input id="submit" type="submit" name="member-action[login]" value="Log In" class="button"/></li>
						</ul>
					</fieldset>
				</form>
			</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="data/params/readonly-mode">
	<div id="system-messages">
		<ul>
			<li class="pending"><strong>This site is in read-only mode.</strong> All forms have been disabled while the site is being maintained. Thanks for your patience.</li>
		</ul>
	</div>
</xsl:template>

</xsl:stylesheet>