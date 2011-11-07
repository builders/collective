<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl" />
<xsl:import href="../utilities/html-manipulation.xsl" />

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/resources.js"></script>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Resources</h3>
			<h4>Topics <a href="{$root}/resources/topics/create/new/" class="button add" title="Add a topic">+</a></h4>
			<ul class="menu list-menu topics">
				<xsl:apply-templates select="topics/entry" mode="list-topics" />
			</ul>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$action">
			<section class="main">
				<div class="content">
					<xsl:choose>
						<xsl:when test="$logged-in != 'yes'">
							<h1>Hello, <xsl:value-of select="author-details/entry/first-name" /></h1>
							<p>You are currently logged in as a site administrator: 
							<a href="{$root}/symphony/system/authors/edit/{$author-id}/"><xsl:value-of select="$name" /></a>, <xsl:value-of select="$user-type" />.</p> 
							<p>To add and edit topics, you will need to log in as a Member.</p>
						</xsl:when>
						<xsl:when test="$result">
							<xsl:apply-templates select="topic-latest/entry" mode="save-topic-form" />
						</xsl:when>
						<xsl:when test="$action = 'edit'">
							<xsl:apply-templates select="topic-by-id/entry" mode="save-topic-form" />
						</xsl:when>
						<xsl:when test="$action = 'new'">
							<xsl:apply-templates select="topic-by-id/error" mode="save-topic-form" />
						</xsl:when>
					</xsl:choose>
				</div>
			</section>
		</xsl:when>
		<xsl:when test="$entry">
			<xsl:apply-templates select="topics/entry" />
		</xsl:when>
		<xsl:otherwise>
			<section class="main">
				<div class="content">
					<h1>Topics</h1>
					<xsl:apply-templates select="topics/entry" />
				</div>
			</section>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="topics/entry">
	<h2><xsl:value-of select="title" /></h2>
	<xsl:apply-templates select="/data/topics/entry" />
</xsl:template>

<xsl:template match="resources-by-topic/topic/entry">
	<article class="excerpt">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h3>
		<p class="description">
			<xsl:value-of select="description[@mode='formatted']/p[1]" />
			<xsl:if test="url"><br /><a href="{url}"><xsl:value-of select="substring-after(url,'http://')" /></a></xsl:if>
		</p>
		<xsl:if test="tags/item">
			<p class="tags-links">
				Tags: <xsl:apply-templates select="tags/item" mode="tags-links" />
			</p>
		</xsl:if>
		<xsl:call-template name="resource-meta" />
	</article>
</xsl:template>

<xsl:template match="item" mode="tags-links">
	<a href="{$root}/{$root-page}/{$current-page}/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
	<xsl:if test="position() != last()">, </xsl:if>
</xsl:template>

<xsl:template name="resource-meta">
	<p class="resource-meta">
		<xsl:text>Lasted updated </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date" />
			<xsl:with-param name="format" select="'M x, Y, t'" />
		</xsl:call-template>
		<xsl:text> by </xsl:text>
		<a href="{$root}/people/{author/item/@handle}/"><xsl:value-of select="author" /></a>
		<xsl:text> | </xsl:text>
		<a href="{$root}/{$root-page}/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/resources/edit/{@id}/" title="Edit this resource in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

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
		title="Entries tagged with '{.}': {count(/data/resources/entry[tags/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

<xsl:template match="topics/entry" mode="list-topics">
	<li><a href="{$root}/{$root-page}/topics/{@id}/edit/"><xsl:value-of select="title" /></a></li>
</xsl:template>

<xsl:template match="entry | error" mode="save-topic-form">
	<xsl:param name="event" select="/data/events/save-topic" />
	<h1>
		<xsl:choose>
			<xsl:when test="$action = 'new'">Add a Topic</xsl:when>
			<xsl:otherwise><xsl:value-of select="title" /></xsl:otherwise>
		</xsl:choose>
	</h1>
	<xsl:if test="$event[@result = 'success']">
		<p class="success"><strong>The topic changes were saved successfully.</strong></p>
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
		<div class="field field-selectbox_link">
			<label>Parent Topic
				<select name="fields[parent-topic]">
					<option value=""></option>
					<xsl:choose>
						<xsl:when test="$event[@result = 'error']">
							<xsl:apply-templates select="/data/topics/entry" mode="options">
								<xsl:with-param name="selected" select="$event/post-values/topic" />
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="/data/topics/entry" mode="options">
								<xsl:with-param name="selected" select="parent-topic/item/@id" />
							</xsl:apply-templates>
						</xsl:otherwise>
					</xsl:choose>
				</select>
			</label>
		</div>
		<div class="field field-textarea">
			<label>Description
				<i>Optional</i>
				<textarea name="fields[description]" rows="8" cols="50">
					<xsl:choose>
						<xsl:when test="$event[@result='error']">
							<xsl:value-of select="$event/post-values/description" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="description[@mode='unformatted']" />
						</xsl:otherwise>
					</xsl:choose>
				</textarea>
			</label>
			<xsl:if test="$event[@result = 'error']/description">
				<p class="message {$event[@result = 'error']/description/@type}"><xsl:value-of select="$event[@result = 'error']/description/@message" /></p>
			</xsl:if>
		</div>
		<input name="fields[member]" type="hidden" value="{$member-username}" />
		<xsl:choose>
			<xsl:when test="$action = 'new' and $result != 'success'">
				<input name="redirect" type="hidden" value="{$root}/{$root-page}/{$current-page}/create/new/success/" />
				<input name="action[save-topic]" type="submit" value="Create Topic" />
			</xsl:when>
			<xsl:otherwise>
				<input name="id" type="hidden" value="{@id}" />
				<input name="action[save-topic]" type="submit" value="Edit Topic" />
			</xsl:otherwise>
		</xsl:choose>
		<a href="{$root}/{$root-page}/" class="cancel">Cancel</a>
	</form>
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

</xsl:stylesheet>