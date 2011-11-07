<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page-heading">
	<h2>Hmm. That&#8217;s strange.</h2>
</xsl:template>

<xsl:template name="page-not-found">
	<div class="intro">
		<p>We could not find the page you were looking.</p>
	</div>
	<div class="main-content">
		<h3>Perhaps you could try:</h3>
		<ul>
			<li>Finding something interesting on <a href="{$root}/blog/">our blog</a>.</li>
			<li>Returning to our <a href="{$root}/">home page</a>.</li>
		</ul>
	</div>
	<div class="secondary-content">
		<p>But if you really feel something went wrong or that something is missing,
		please <a href="{$root}/contact/">contact us</a> to let us know.
		</p>
	</div>
</xsl:template>

</xsl:stylesheet>