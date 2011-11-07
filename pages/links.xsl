<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl" />
<xsl:import href="../utilities/html-manipulation.xsl" />

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/resources.js"></script>
</xsl:template>

<xsl:template match="data" mode="nav">
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>
				<xsl:value-of select="$page-title" />
				<xsl:text> </xsl:text>
				<a href="{$root}/{$current-page}/create/new/" class="button add" title="Create a link">+</a>
			</h3>
			<ul class="menu list-menu">
				<xsl:for-each select="links/entry">
					<li>
						<a href="{$root}/{$current-page}/{title/@handle}/">
						<xsl:if test="$a = title/@handle">
							<xsl:attribute name="class">current</xsl:attribute>
						</xsl:if>
						<xsl:if test="$b = 'edit' or $b = 'new'">
							<xsl:attribute name="href"><xsl:value-of select="concat($root, '/', $current-page, '/', @id, '/edit/')" /></xsl:attribute>
						</xsl:if>
						<xsl:value-of select="title" /></a>
					</li>
				</xsl:for-each>
			</ul>
			<h4>Tags</h4>
			<ul class="tags">
				<xsl:apply-templates select="links/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-menu">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$c">
			<xsl:apply-templates select="link-latest[entry]" />
		</xsl:when>
		<xsl:when test="$b">
			<section class="main">
				<div class="content">
					<xsl:choose>
						<xsl:when test="$logged-in != 'yes'">
							<h1>Hello, <xsl:value-of select="author-details/entry/first-name" /></h1>
							<p>You are currently logged in as a site administrator: 
							<a href="{$root}/symphony/system/authors/edit/{$author-id}/"><xsl:value-of select="$name" /></a>, <xsl:value-of select="$user-type" />.</p> 
							<p>To add and edit links, you will need to log in as a Member.</p>
						</xsl:when>
						<xsl:when test="$b = 'edit'">
							<xsl:apply-templates select="link-by-id/entry" mode="edit-link-form" />
						</xsl:when>
						<xsl:when test="$b = 'new'">
							<xsl:apply-templates select="link/error" mode="edit-link-form" />
						</xsl:when>
					</xsl:choose>
				</div>
			</section>
		</xsl:when>
		<xsl:when test="$a">
			<xsl:apply-templates select="link[entry]" />
			<xsl:apply-templates select="link-by-id[entry]" />
			<xsl:apply-templates select="link-latest[entry]" />
		</xsl:when>
		<xsl:otherwise>
			<section class="main">
				<div class="content">
					<h1><xsl:value-of select="$page-title" /></h1>
					<xsl:apply-templates select="links/entry" />
				</div>
			</section>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="links/entry">
	<article class="excerpt">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h3>
		<p class="description">
			<xsl:value-of select="note[@mode='formatted']/p[1]" />
			<xsl:if test="url"><xsl:if test="note[@mode='formatted']/p[1]"><br /></xsl:if><a href="{url}"><xsl:value-of select="url" /></a></xsl:if>
		</p>
	</article>
</xsl:template>

<xsl:template match="item" mode="tags-links">
	<a href="{$root}/{$root-page}/tag/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
	<xsl:if test="position() != last()">, </xsl:if>
</xsl:template>

<xsl:template match="link | link-by-id | link-latest">
	<xsl:apply-templates select="entry" />
</xsl:template>

<xsl:template match="entry">
	<section class="main">
		<article id="content" class="content">
			<h1>
				<xsl:choose>
					<xsl:when test="url">
						<xsl:attribute name="title"><xsl:value-of select="url" /></xsl:attribute>
						<a href="{url}"><xsl:value-of select="title" /></a>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="title" /></xsl:otherwise>
				</xsl:choose>
			</h1>
			<xsl:copy-of select="note[@mode='formatted']/*" />
			<xsl:if test="url"><p class="resource-url"><a href="{url}"><xsl:value-of select="url" /></a></p></xsl:if>
			<xsl:if test="tags/item">
				<p class="tags-links">
					Tags: <xsl:apply-templates select="tags/item" mode="tags-links">
						<xsl:sort select="@handle" />
					</xsl:apply-templates>
				</p>
			</xsl:if>
			<xsl:call-template name="link-meta" />
		</article>
	</section>
</xsl:template>

<xsl:template name="link-meta">
	<xsl:param name="entry-member-id" select="member/@id" />
	<xsl:param name="entry-member" select="/data/member-names/entry[@id = $entry-member-id]" />
	<p class="resource-meta">
		<xsl:text>Lasted updated </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date" />
			<xsl:with-param name="format" select="'M x, Y, t'" />
		</xsl:call-template>
		<xsl:text> by </xsl:text>
		<a href="{$root}/people/{$entry-member/name/@handle}/"><xsl:value-of select="$entry-member/name" /></a>
		<xsl:text> | </xsl:text>
		<a href="{$root}/{$current-page}/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/{$root-page}/edit/{@id}/" title="Edit this link in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="links-by-date/year/month">
	<li>
		<a href="{$root}/{$root-page}/updated/{../@value}/{@value}/">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="entry/date"/>
				<xsl:with-param name="format" select="'M Y'"/>
			</xsl:call-template>
		</a>
		<span><xsl:text> (</xsl:text><xsl:value-of select="count(entry)"/>)</span>
	</li>
</xsl:template>

<xsl:template match="entry | error" mode="edit-link-form">
	<xsl:param name="event" select="/data/events/save-link" />
	<h1>
		<xsl:choose>
			<xsl:when test="$b = 'new'">Create a New Link</xsl:when>
			<xsl:otherwise><xsl:value-of select="title" /></xsl:otherwise>
		</xsl:choose>
	</h1>
	<xsl:if test="$event[@result = 'success']">
		<p class="success"><strong>The link changes were saved successfully.</strong></p>
	</xsl:if>
	<form method="post" action="" enctype="multipart/form-data" class="resources">
		<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
		<div>
			<xsl:attribute name="class">
				<xsl:text>field field-input required</xsl:text>
				<xsl:if test="$event[@result = 'error']/title">
					<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label>Title
				<input name="fields[title]" type="text" value="{title}">
					<xsl:if test="$event[@result='error']">
						<xsl:attribute name="value">
							<xsl:value-of select="$event/post-values/title" />
						</xsl:attribute>
					</xsl:if>
				</input>
			</label>
			<xsl:if test="$event[@result = 'error']/title">
				<p class="message {$event[@result = 'error']/title/@type}"><xsl:value-of select="$event[@result = 'error']/title/@message" /></p>
			</xsl:if>
		</div>
		<div class="field">
			<xsl:attribute name="class">
				<xsl:text>field field-input required</xsl:text>
				<xsl:if test="$event[@result = 'error']/title">
					<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label>URL
				<input name="fields[url]" type="text" value="{url}">
					<xsl:if test="$event[@result='error']">
						<xsl:attribute name="value">
							<xsl:value-of select="$event/post-values/url" />
						</xsl:attribute>
					</xsl:if>
				</input>
			</label>
			<xsl:if test="$event[@result = 'error']/url">
				<p class="message {$event[@result = 'error']/url/@type}"><xsl:value-of select="$event[@result = 'error']/url/@message" /></p>
			</xsl:if>
		</div>
		<div class="field field-textarea">
			<label>Note
				<i>Optional</i>
				<textarea name="fields[note]" rows="8" cols="50">
					<xsl:choose>
						<xsl:when test="$event[@result='error']">
							<xsl:value-of select="$event/post-values/note" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="note[@mode='unformatted']" />
						</xsl:otherwise>
					</xsl:choose>
				</textarea>
			</label>
			<xsl:if test="$event[@result = 'error']/note">
				<p class="message {$event[@result = 'error']/note/@type}"><xsl:value-of select="$event[@result = 'error']/note/@message" /></p>
			</xsl:if>
		</div>
		<div class="field field-taglist">
			<label>Tags
				<i>Comma separated values</i>
				<input name="fields[tags]" type="text">
					<xsl:attribute name="value">
						<xsl:apply-templates select="tags/item" mode="tags" />
					</xsl:attribute>
					<xsl:if test="$event[@result='error']">
						<xsl:attribute name="value">
							<xsl:value-of select="$event/post-values/tags" />
						</xsl:attribute>
					</xsl:if>
				</input>
			</label>
			<ul class="tags">
				<xsl:apply-templates select="/data/links/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-list">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
			<xsl:if test="$event[@result = 'error']/tags">
				<p class="message {$event[@result = 'error']/tags/@type}"><xsl:value-of select="$event[@result = 'error']/tags/@message" /></p>
			</xsl:if>
		</div>
		<input name="fields[member]" type="hidden" value="{$member-username}" />
		<input name="fields[date]" type="hidden" value="" />
		<input name="fields[publish]" type="hidden" value="Yes" />
		<xsl:choose>
			<xsl:when test="$b = 'new'">
				<input name="redirect" type="hidden" value="{$root}/{$current-page}/create/new/success/" />
				<input name="action[save-link]" type="submit" value="Create Link" />
				<a href="{$root}/{$root-page}/" class="cancel">Cancel</a>
			</xsl:when>
			<xsl:otherwise>
				<input name="id" type="hidden" value="{@id}" />
				<input name="redirect" type="hidden" value="{$root}/{$current-page}/{@id}/" />
				<input name="action[save-link]" type="submit" value="Edit Link" />
				<a href="{$root}/{$root-page}/{title/@handle}/" class="cancel">Cancel</a>
			</xsl:otherwise>
		</xsl:choose>
	</form>
</xsl:template>

<xsl:template match="*" mode="file">
	<a href="{$workspace}{@path}/{filename}"><xsl:value-of select="concat('/workspace', @path, '/', filename)" /></a>
	<input name="fields[css]" type="hidden" value="{@path}/{filename}" />
</xsl:template>

<xsl:template match="*" mode="options">
	<xsl:param name="selected" />
	<option value="{@id}">
		<xsl:if test="@id = $selected">
			<xsl:attribute name="selected">selected</xsl:attribute>
		</xsl:if>
		<xsl:value-of select="title" />
	</option>
</xsl:template>

<xsl:key name="entry-by-tag" match="entry" use="tag" />

<xsl:template match="*" mode="tags">
	<xsl:value-of select="." />
	<xsl:if test="position() != last()">
		<xsl:text>, </xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="item" mode="tags-list">
	<li><xsl:value-of select="." /></li>
</xsl:template>

<xsl:template match="item" mode="tags-menu">
	<li><a href="{$root}/{$current-page}/tag/{@handle}/" rel="tag"
		title="Entries tagged with '{.}': {count(/data/links/entry[tags/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

<xsl:template match="item" mode="topics-menu">
	<li><a href="{$root}/{$current-page}/topic/{@handle}/"
		title="Entries in the '{.}' library: {count(/data/links/entry[topic/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

</xsl:stylesheet>