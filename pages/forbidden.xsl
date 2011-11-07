<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public.xsl"/>

<xsl:template name="tagline">
	<h2 id="tagline">Forbidden</h2>
</xsl:template>

<xsl:template match="data">
	<div id="content">
		<div id="intro">
			<p><strong>403 Error</strong>: Access Denied</p>
		</div><br class="clearing" />
	</div>
</xsl:template>

<!-- xsl:import href="../utilities/intranet.xsl"/>

<xsl:param name="access" select="'public'" />

<xsl:template match="data">
	<section class="main">
		<article class="content">
			<h2 class="heading heading-alert">Access Denied!</h2>
			<h3>Hey! You're not allowed back here! Or are you?</h3>
			<p>Some parts of our agency require top secret clearance to access.</p>
			<p>Get in <a href="{$root}/contact/">contact</a> with us if you think something isn't quite right.</p>
		</article>
	</section>
</xsl:template>

<xsl:template match="data[events/member-login-info/@logged-in = 'true']">
	<section class="main">
		<article class="content">
			<h2>403: Access Denied</h2>
			<h3>Hey! You're not allowed back here!</h3>
			<p>Some parts of our agency require the blue key.</p>
			<p>It would appear that your clearance level is not high enough, so quit poking around.</p>
		</article>
	</section>
</xsl:template>

<xsl:template match="data[events/member-login-info/role = 'Inactive']">
	<section class="main">
		<article class="content">
			<h2>403: Access Denied</h2>
			<h3>Hey! You're not allowed back here!</h3>
			<p>Some parts of our agency require the blue key.</p>
			<p>Perhaps you do have access, but you just need to <a href="{$root}/members/activate/">activate your enrollment</a>?</p>
		</article>
	</section>
</xsl:template -->

</xsl:stylesheet>