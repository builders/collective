<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>

<xsl:param name="access" select="'public'" />

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1>Maintenance</h1>
			<p>This site is currently in maintenance. Please check back later.</p>
		</div>
	</section>
</xsl:template>

</xsl:stylesheet>