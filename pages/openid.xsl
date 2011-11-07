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

<xsl:variable name="member" select="/data/events/member-login-info"/>
<xsl:variable name="member-username" select="/data/events/member-login-info/username-and-password/@username"/>
<xsl:variable name="logged-in" select="/data/events/member-login-info/@logged-in"/>
<xsl:variable name="permissions" select="/data/events/member-login-info/permissions"/>

<xsl:variable name="openid-first" select="/data/events/openid-data/sreg-data/property[@key='first']" />
<xsl:variable name="openid-last" select="/data/events/openid-data/sreg-data/property[@key='last']" />
<xsl:variable name="openid-email" select="/data/events/openid-data/sreg-data/property[@key='email']" />

<xsl:variable name="current-uri-path" select="substring-before($current-url,'?')" />

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
			<div class="user">
				<xsl:call-template name="login-panel" />
			</div>
			<div class="page">
				<xsl:apply-templates mode="header" />
				<xsl:call-template name="openid-authenticate" />
				<xsl:apply-templates mode="footer" />
				<xsl:apply-templates mode="js" />
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template name="default">
	<section class="main">
		<div class="content">
			<h1>Hello.</h1>
			<h2>Welcome to the our <del>intranet.</del></h2>
			<p>Well, the name has yet to be determined. Let us know if you have any good ideas.</p>
			<p class="resource-meta">If you are having trouble accessing this site, you can try <a href="{$root}/members/reset-pass/">resetting your password</a> (but only if you are already a member).</p>
		</div>
	</section>
</xsl:template>

<xsl:template match="data">
  
  <xsl:apply-templates select="events/openid-data | events/openid-auth/authentication" />
  
  <form method="get" action="">
    <p>
      username:
      <input type="text" name="username" />
    </p>
    
    <p>
      provider:
      <select name="openid-identifier">
        <xsl:apply-templates select="events/openid-auth/providers/provider" />
      </select>
    </p>
    
    <p>
      <input type="hidden" name="required-fields[]" value="fullname" />
      <input type="hidden" name="optional-fields[]" value="dob" /> <!-- date of birthday -->
      <input type="hidden" name="optional-fields[]" value="language" />

      <input type="submit" />
    </p>
  </form>
</xsl:template>

<xsl:template match="providers/provider">
  <option value="{property[@key = 'url']}"><xsl:value-of select="@name" /></option>
</xsl:template>

<xsl:template match="identifier">
  <p>You are logged in as: <xsl:value-of select="text()" /></p>
</xsl:template>

<xsl:template match="sreg-data">
  <dl>
    <xsl:apply-templates match="property" />
  </dl>
</xsl:template>

<xsl:template match="sreg-data/property">
  <dt>
    <xsl:value-of select="@key" />
  </dt>
  <dd>
    <xsl:value-of select="text()" />
  </dd>
</xsl:template>

<xsl:template match="message">
  <div class="errors"><xsl:value-of select="text()" /></div>
</xsl:template>

<xsl:template name="openid-authenticate">
	<section class="main">
		<div class="content">
			<h1>Hello.</h1>
			<h2>Welcome to the our <del>intranet.</del></h2>
			<p>Well, the name has yet to be determined. Let us know if you have any good ideas.</p>
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
			<legend>Sign-in with your Google account</legend>
			<div id="openid-input_area">
				<input id="openid-identifier" name="openid-identifier" type="hidden" value="example.com" />
				<input id="openid-submit" type="submit" value="Sign-In" />
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
	<title>
		<!-- If not the homepage -->
		<xsl:if test="$current-path != '/'">
			<xsl:value-of select="$page-title" />
			<xsl:text> | </xsl:text>
		</xsl:if>
		<xsl:value-of select="$website-name"/>
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
		<xsl:if test="$logged-in = 'true' or $is-logged-in = 'true'">
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
					<li><a class="button" href="{$current-uri-path}?member-action=logout">Logout</a></li>
				</ul>
			</div>
		</xsl:when>
		<xsl:when test="/data/events/openid-auth/authentication[@status = 'success']">
			<div class="user-nav">
				<ul>
					<li>Logged in as <xsl:for-each select="/data/events/openid-auth/authentication/sreg-data">
							<xsl:value-of select="concat(property[@key='first'], ' ', property[@key='last'])" />
						</xsl:for-each>
					</li>
					<li>
						<a class="button" href="{$current-uri-path}?openid-action=logout">Logout</a>
					</li>
				</ul>
			</div>
		</xsl:when>
		<xsl:when test="/data/events/member-login-info/@logged-in = 'true'">
			<div class="user-nav">
				<ul>
					<li>Logged in as
						<a href="{$root}/people/{/data/events/member-login-info/name/@handle}/">
							<xsl:value-of select="/data/events/member-login-info/name"/>
						</a>
					</li>
					<li>
						<a href="{$root}/members/{$member-username}/">My Profile</a>
					</li>
					<li>
						<a class="button" href="{$current-uri-path}?member-action=logout">
							<xsl:if test="$openid-email"><xsl:attribute name="href"><xsl:value-of select="$current-uri-path" />?openid-action=logout</xsl:attribute></xsl:if>
							Logout</a>
					</li>
				</ul>
			</div>
		</xsl:when>
		<xsl:when test="/data/events/member-login-info/@failed-login-attempt = 'true'">
			<form id="login-panel" action="{$current-url}" method="post">
				<fieldset>
					<p>Login Failed.
						<input id="submit" type="submit" name="reset" value="Try Again" class="button"/>
						<span class="reset">or <a class="button" href="{$root}/members/reset-pass/">Reset Password</a></span>
					</p>
				</fieldset>
			</form>
		</xsl:when>
		<xsl:otherwise>
			<form id="login-panel" action="{$current-url}" method="post">
				<fieldset>
					<ul>
						<li><input name="username" title="username" type="text" value="username" class="clear-on-focus"/></li>
						<li><input name="password" title="chipmonk" type="password" value="chipmonk" class="clear-on-focus"/></li>
						<li><input name="redirect" type="hidden" value="{$root}{$current-path}"/><input id="submit" type="submit" name="member-action[login]" value="Log In" class="button"/></li>
					</ul>
				</fieldset>
			</form>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
