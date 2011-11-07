<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/wmd/wmd.js"></script>
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="content">
			<h1>New Discussion</h1>
			<form method="post" action="{$current-url}" id="discussion-form">
				<fieldset>
					<p class="discussion-topic">
						<xsl:if test="/data/events/forum-post[@result = 'error']/topic">
							<xsl:attribute name="class">error</xsl:attribute>
						</xsl:if>
						<label for="post-topic">Topic</label>
						<input id="post-topic" name="fields[topic]" type="text" value="{/data/events/forum-post-discussion/post-values/topic}"/>
					</p>
					<p class="discussion-comment">
						<xsl:if test="/data/events/forum-post[@result = 'error']/comment">
							<xsl:attribute name="class">error</xsl:attribute>
						</xsl:if>
						<label for="post-comment">Comment</label>
						<span id="wmd-editor" class="wmd-panel">
							<span id="wmd-button-bar"></span>
							<textarea id="wmd-input" name="fields[comment]">
								<xsl:value-of select="/data/events/forum-post-comment/post-values/comment"/>
							</textarea>
						</span>
					</p>
					<input name="fields[created-by]" type="hidden" value="{$member/@id}"/>
					<input name="fields[last-post]" type="hidden" value="{$member/@id}"/>
					<div id="submission">
						<input id="submit" name="action[forum-new-discussion]" type="submit" value="Create discussion" class="button"/>
						<a id="cancel" href="{$root}/forum/" class="button">Cancel and go back</a>
					</div>
					<input name="redirect" type="hidden">
						<xsl:attribute name="value"><xsl:value-of select="$root"/>/forum/discussions/{$id}/</xsl:attribute>
					</input>
				</fieldset>
			</form>
		</div>
	</section>
</xsl:template>

</xsl:stylesheet>