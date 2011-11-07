<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/public.xsl"/>
<xsl:import href="../utilities/get-google-map.xsl"/>

<xsl:template match="data">
	<div id="content">
		<div id="contact-left">
			<xsl:choose>
				<xsl:when test="$readonly-mode = 'yes'">
					<p class="notice">The contact form has been temporarily disabled while we work on the site. Please check back later. Thanks.</p>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="contact-form" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
		<div id="contact-right">
		</div>
	</div>
</xsl:template>

<xsl:template name="contact-form">
	<xsl:param name="event" select="/data/events/send-message" />
	<div id="contact-form">
		<xsl:choose>
			<xsl:when test="$event/@result='error'">
				<div class="error">
					<p>An error occurred.</p>
					<ul>
						<xsl:for-each select="$event/*[@type='invalid' or @type='missing']">
							<li><xsl:value-of select="@message" /></li>
						</xsl:for-each>
					</ul>
				</div>
			</xsl:when>
			<xsl:when test="$event/@result='success'">
				<p class="success"><strong>Your message was sent successfully.</strong>
				<br />Thank you.</p>
			</xsl:when>
		</xsl:choose>
		<form method="post" action="" enctype="multipart/form-data">
			<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
			<input name="fields[email]" type="text" class="text clear-on-focus" title="Email Address" value="Email Address">
				<xsl:if test="$event/post-values/email">
					<xsl:if test="$event/post-values/email/@type='invalid' or $event/post-values/email/@type='missing'">
						<xsl:attribute name="class">text clear-on-focus field-error</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="value"><xsl:value-of select="$event/post-values/email" /></xsl:attribute>
				</xsl:if>
			</input>
			<input name="fields[name]" type="text" class="text clear-on-focus" title="Name" value="Name">
				<xsl:if test="$event/post-values/name">
					<xsl:if test="$event/post-values/name/@type='missing'"><xsl:attribute name="class">text clear-on-focus field-error</xsl:attribute></xsl:if>
					<xsl:attribute name="value"><xsl:value-of select="$event/post-values/name" /></xsl:attribute>
				</xsl:if>
			</input>
			<label for="fields[subject]">I would like...</label>
			<div class="input-field">
				<select name="fields[subject]" title="Subject">
					<option value="info"></option>
					<option value="quote">
						<xsl:if test="$event/post-values/subject = 'quote'">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>A quote
					</option>
					<option value="callme">
						<xsl:if test="$event/post-values/subject = 'callme'">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>Someone to call me
					</option>
					<option value="careers">
						<xsl:if test="$event/post-values/subject = 'careers'">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>Employment Information
					</option>
					<option value="service">
						<xsl:if test="$event/post-values/subject = 'service'">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>Site/Technical support
					</option>
				</select>
			</div>
			<textarea name="fields[message]" rows="15" cols="50" title="Message" class="clear-on-focus"><xsl:choose><xsl:when test="$event/message/@type='missing'"><xsl:attribute name="class">clear-on-focus field-error</xsl:attribute></xsl:when><xsl:when test="$event/post-values/message"><xsl:value-of select="$event/post-values/message" /></xsl:when><xsl:otherwise>Message</xsl:otherwise></xsl:choose></textarea>
			<input name="fields[info]" value="General Inquiry" type="hidden" />
			<input name="fields[quote]" value="Quote Request" type="hidden" />
			<input name="fields[callme]" value="Call Request" type="hidden" />
			<input name="fields[careers]" value="Employment Information" type="hidden" />
			<input name="fields[service]" value="Site/Technical Support" type="hidden" />
			<input name="etm[][recipient]" value="fields[subject]" type="hidden" />
			<input name="action[send-message]" value="Send Message" type="submit" />
		</form>
	</div>
</xsl:template>

</xsl:stylesheet>