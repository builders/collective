<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public.xsl"/>

<xsl:template match="data">
	<div id="content">
		<div class="intro">
			<p>An intro goes here.</p>
		</div><br class="clearing" />
		<div id="services">
			<xsl:for-each select="services/category">
				<div id="{@handle}-col" class="col-closed">
					<h2><xsl:value-of select="@value"/></h2><a href="#" id="{@handle}-col-toggle" class="open"
					name="{@handle}-col-toggle">Open / Close Toggle</a>
					<div class="clearing"></div>
					<ul>
						<xsl:for-each select="entry">
							<li class="title">
								<a href="#"><xsl:value-of select="title"/></a>
								<div class="desc">
									<xsl:value-of select="description"/>
								</div>
							</li>
						</xsl:for-each>
					</ul>
				</div>
			</xsl:for-each>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>