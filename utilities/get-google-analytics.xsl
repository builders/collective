<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template name="get-google-analytics">
		<xsl:param name="tracker"/>
		<script type="text/javascript">
			<xsl:text>
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </xsl:text>
		</script>
		<script type="text/javascript">
			<xsl:text>
      var pageTracker = _gat._getTracker("</xsl:text><xsl:value-of select="$tracker"/><xsl:text>");
      pageTracker._initData();
      pageTracker._trackPageview();
    </xsl:text>
		</script>
	</xsl:template>
	<xsl:template name="get-google-analytics-alt">
		<xsl:param name="tracker"/>
		<script type="text/javascript">
			<xsl:text disable-output-escaping="yes">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '</xsl:text><xsl:value-of select="$tracker"/><xsl:text disable-output-escaping="yes">']);
      _gaq.push(['_trackPageview']);
      (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
      })();
    </xsl:text>
    </script>
	</xsl:template>
</xsl:stylesheet>