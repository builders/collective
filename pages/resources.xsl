<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl" />
<xsl:import href="../utilities/html-manipulation.xsl" />

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<xsl:apply-templates select="resource" mode="css" />
	<xsl:apply-templates select="resource-by-id" mode="css" />
	<xsl:apply-templates select="resource-latest" mode="css" />
</xsl:template>

<xsl:template match="data" mode="js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/lib/jquery.quicksearch.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/system.js"></script>
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/resources.js"></script>
	<xsl:apply-templates select="resource" mode="js" />
	<xsl:apply-templates select="resource-by-id" mode="js" />
	<xsl:apply-templates select="resource-latest" mode="js" />
</xsl:template>

<xsl:template match="resource | resource-by-id | resource-latest" mode="js">
	<xsl:apply-templates select="entry/javascript" mode="js" />
	<xsl:apply-templates select="entry[table-of-contents = 'Yes']" mode="contents-js" />
	<xsl:apply-templates select="entry[syntax-highlighting = 'Yes']" mode="syntax-js" />
</xsl:template>

<xsl:template match="entry/javascript" mode="js">
	<script type="text/javascript" src="{$workspace}{@path}/{filename}"></script>
</xsl:template>

<xsl:template match="entry" mode="contents-js">
	<script src="{$workspace}/assets/intranet/js/contents.js" />
	<script type="text/javascript">init_contents();</script>
</xsl:template>

<xsl:template match="entry" mode="syntax-js">
	<script type="text/javascript" src="{$workspace}/assets/intranet/js/syntax.js"></script>
	<script type="text/javascript">
		<![CDATA[
		SyntaxHighlighter.config.tagName = 'textarea';
		SyntaxHighlighter.defaults['wrap-lines'] = false;
		SyntaxHighlighter.defaults['auto-links'] = false;
		SyntaxHighlighter.defaults['toolbar'] = false;
		SyntaxHighlighter.defaults['tab-size'] = 4;
		SyntaxHighlighter.all();
		]]>
	</script>
</xsl:template>

<xsl:template match="resource | resource-by-id | resource-latest" mode="css">
	<xsl:apply-templates select="entry[syntax-highlighting = 'Yes']" mode="syntax-css" />
	<xsl:apply-templates select="entry/css" mode="css" />
</xsl:template>

<xsl:template match="entry" mode="syntax-css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/syntax.css?v1.0" />
</xsl:template>

<xsl:template match="entry/css" mode="css">
	<link rel="stylesheet" href="{$workspace}{@path}/{filename}" />
</xsl:template>

<xsl:template match="data" mode="nav">
	<!-- nav>
		<ul class="nav">
			<li><a href="#">Strategy</a></li>
			<li class="current"><a href="#">Design</a></li>
			<li><a href="#">Technology</a></li>
		</ul>
	</nav -->
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<h3>Resources <a href="{$root}/{$current-page}/create/new/" class="button add" title="Create a resource">+</a></h3>
			<ul class="menu list-menu">
				<xsl:for-each select="resources/entry">
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
			<xsl:if test="not($a)">
				<h4>Topics <a href="{$root}/resources/topics/create/new/" class="button add" title="Add a topic">+</a></h4>
				<ul class="menu list-menu topics">
					<li><a href="{$root}/{$root-page}/topic/">All Topics</a></li>
					<xsl:apply-templates select="resources/entry/topic/item[not(. = ../../preceding-sibling::entry/topic/item)]" mode="topics-menu">
						<xsl:sort />
					</xsl:apply-templates>
				</ul>
				<h4>Tags</h4>
				<ul class="tags">
					<xsl:apply-templates select="resources/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-menu">
						<xsl:sort select="@handle" />
					</xsl:apply-templates>
				</ul>
				<h4>Updated</h4>
				<ul class="menu list-menu list-menu-meta">
					<xsl:apply-templates select="resources-by-date/year/month" />
				</ul>
			</xsl:if>
			<xsl:if test="not($b) and (resource/entry/table-of-contents = 'Yes' or resource-by-id/entry/table-of-contents = 'Yes')">
				<h3>Contents</h3>
				<ul id="toc" class="menu list-menu" style="display:none"></ul>
				<noscript>
					<p>Please enable JavaScript.</p>
				</noscript>
			</xsl:if>
		</nav>
	</aside>
</xsl:template>

<xsl:template match="data">
	<xsl:choose>
		<xsl:when test="$c">
			<xsl:apply-templates select="resource-latest[entry]" />
		</xsl:when>
		<xsl:when test="$b">
			<section class="main">
				<div class="content">
					<xsl:choose>
						<xsl:when test="$logged-in != 'yes'">
							<h1>Hello, <xsl:value-of select="author-details/entry/first-name" /></h1>
							<p>You are currently logged in as a site administrator: 
							<a href="{$root}/symphony/system/authors/edit/{$author-id}/"><xsl:value-of select="$name" /></a>, <xsl:value-of select="$user-type" />.</p> 
							<p>To add and edit resources, you will need to log in as a Member.</p>
						</xsl:when>
						<xsl:when test="$b = 'edit'">
							<xsl:apply-templates select="resource-by-id/entry" mode="edit-resource-form" />
						</xsl:when>
						<xsl:when test="$b = 'new'">
							<xsl:apply-templates select="resource/error" mode="edit-resource-form" />
						</xsl:when>
					</xsl:choose>
				</div>
			</section>
		</xsl:when>
		<xsl:when test="$a">
			<xsl:apply-templates select="resource[entry]" />
			<xsl:apply-templates select="resource-by-id[entry]" />
			<xsl:apply-templates select="resource-latest[entry]" />
		</xsl:when>
		<xsl:otherwise>
			<section class="main">
				<div class="content">
					<h1>Resources</h1>
					<form accept-charset="UTF-8" action="." class="resources quicksearch" id="quicksearch">
						<label class="label" for="quicksearch-input">Quick Search</label>
						<input id="quicksearch-input" maxlength="255" name="quicksearch" type="text" placeholder="Enter search terms" autofocus="autofocus" />
					</form>
					<xsl:apply-templates select="resources/entry" />
				</div>
			</section>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="resources/entry">
	<article class="excerpt">
		<h3><a href="{$root}/{$root-page}/{title/@handle}/"><xsl:value-of select="title" /></a></h3>
		<p class="description">
			<xsl:value-of select="description[@mode='formatted']/p[1]" />
			<xsl:if test="url"><br /><a href="{url}"><xsl:value-of select="url" /></a></xsl:if>
		</p>
		<xsl:if test="tags/item">
			<p class="tags-links">
				Tags: <xsl:apply-templates select="tags/item" mode="tags-links" />
			</p>
		</xsl:if>
		<xsl:if test="file"><p class="resource-url"><a href="{$current-url}?file={filename}"><xsl:value-of select="filename" /></a></p></xsl:if>
		<xsl:call-template name="resource-meta" />
	</article>
</xsl:template>

<xsl:template match="item" mode="tags-links">
	<a href="{$root}/{$root-page}/tag/{@handle}/" rel="tag"><xsl:value-of select="." /></a>
	<xsl:if test="position() != last()">, </xsl:if>
</xsl:template>

<xsl:template match="resource | resource-by-id | resource-latest">
	<xsl:choose>
		<xsl:when test="entry/xml/filename">
			<section class="main">
				<xsl:apply-templates select="entry/xml" />
			</section>
		</xsl:when>
		<xsl:when test="entry/custom-html = 'Yes'">
			<xsl:apply-templates select="entry/body/*" mode="html" />
			<section class="section-edit">
				<div class="content">
					<xsl:for-each select="entry">
						<xsl:call-template name="resource-meta" />
					</xsl:for-each>
				</div>
			</section>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="entry" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="entry/xml">
	<xsl:variable name="xml-path" select="concat('..', /data/resource/entry/xml/@path, '/', /data/resource/entry/xml/filename)" />
	<xsl:variable name="xml" select="document($xml-path)" />
	<xsl:apply-templates select="$xml" mode="html" />
	<section class="section-edit">
		<div class="content">
			<xsl:for-each select="..">
				<xsl:call-template name="resource-meta" />
			</xsl:for-each>
		</div>
	</section>
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
			<xsl:copy-of select="description[@mode='formatted']/*" />
			<xsl:apply-templates select="body[@mode='formatted']/*" mode="html" />
			<xsl:if test="url"><p class="resource-url"><a href="{url}"><xsl:value-of select="url" /></a></p></xsl:if>
			<xsl:if test="file"><p class="resource-url">Download: <a href="{$current-url}?file={file/filename}"><xsl:value-of select="file/filename" /></a></p></xsl:if>
			<xsl:call-template name="resource-meta" />
		</article>
	</section>
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
		<a href="{$root}/{$current-page}/{@id}/edit/">Edit</a>
		<xsl:if test="$user-type = 'developer'">
			<xsl:text> | </xsl:text>
			<a href="{$root}/symphony/publish/resources/edit/{@id}/" title="Edit this resource in the Symphony admin area">Admin</a>
		</xsl:if>
	</p>
</xsl:template>

<xsl:template match="resources-by-date/year/month">
	<li>
		<a href="{$root}/resources/updated/{../@value}/{@value}/">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="entry/date"/>
				<xsl:with-param name="format" select="'M Y'"/>
			</xsl:call-template>
		</a>
		<span><xsl:text> (</xsl:text><xsl:value-of select="count(entry)"/>)</span>
	</li>
</xsl:template>

<xsl:template match="entry | error" mode="edit-resource-form">
	<xsl:param name="event" select="/data/events/save-resource" />
	<h1>
		<xsl:choose>
			<xsl:when test="$b = 'new'">Create a New Resource</xsl:when>
			<xsl:otherwise><xsl:value-of select="title" /></xsl:otherwise>
		</xsl:choose>
	</h1>
	<xsl:if test="$event[@result = 'success']">
		<p class="success"><strong>The resource changes were saved successfully.</strong></p>
	</xsl:if>
	<form method="post" action="" enctype="multipart/form-data" class="resources">
		<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
		<xsl:if test="$b != 'new'"><input name="id" type="hidden" value="{@id}" /></xsl:if>
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
			<label>Topic
				<select name="fields[topic]">
					<option value=""></option>
					<xsl:choose>
						<xsl:when test="$event[@result = 'error']">
							<xsl:apply-templates select="/data/topics/entry" mode="options">
								<xsl:with-param name="selected" select="$event/post-values/topic" />
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="/data/topics/entry" mode="options">
								<xsl:with-param name="selected" select="topic/item/@id" />
							</xsl:apply-templates>
						</xsl:otherwise>
					</xsl:choose>
				</select>
			</label>
		</div>
		<div class="field field-input">
			<label>URL
				<i>Optional</i>
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
		<div class="field field-textarea">
			<label>Body
				<i>Optional</i>
				<textarea name="fields[body]" rows="15" cols="50">
					<xsl:choose>
						<xsl:when test="$event[@result='error']">
							<xsl:value-of select="$event/post-values/body" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="body[@mode='unformatted']" />
						</xsl:otherwise>
					</xsl:choose>
				</textarea>
			</label>
			<xsl:if test="$event[@result = 'error']/body">
				<p class="message {$event[@result = 'error']/body/@type}"><xsl:value-of select="$event[@result = 'error']/body/@message" /></p>
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
				<xsl:apply-templates select="/data/resources/entry/tags/item[not(. = ../../preceding-sibling::entry/tags/item)]" mode="tags-list">
					<xsl:sort select="@handle" />
				</xsl:apply-templates>
			</ul>
			<xsl:if test="$event[@result = 'error']/tags">
				<p class="message {$event[@result = 'error']/tags/@type}"><xsl:value-of select="$event[@result = 'error']/tags/@message" /></p>
			</xsl:if>
		</div>
		<div class="field field-upload">
			<label class="file">File
				<i>Optional</i>
				<span>
					<xsl:choose>
						<xsl:when test="file">
							<xsl:apply-templates select="file" mode="private-file" />
						</xsl:when>
						<xsl:otherwise>
							<input name="fields[file]" type="file" />
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</label>
		</div>
		<div class="field field-upload">
			<label class="file">XML
				<i>Optional</i>
				<span>
					<xsl:choose>
						<xsl:when test="xml">
							<xsl:apply-templates select="xml" mode="file">
								<xsl:with-param name="field-name" select="'xml'" />
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<input name="fields[xml]" type="file" />
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</label>
		</div>
		<div class="field field-upload">
			<label class="file">CSS
				<i>Optional</i>
				<span>
					<xsl:choose>
						<xsl:when test="css">
							<xsl:apply-templates select="css" mode="file" />
						</xsl:when>
						<xsl:otherwise>
							<input name="fields[css]" type="file" />
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</label>
		</div>
		<div class="field field-upload">
			<label class="file">JavaScript
				<i>Optional</i>
				<span>
					<xsl:choose>
						<xsl:when test="javascript">
							<xsl:apply-templates select="javascript" mode="file">
								<xsl:with-param name="field-name" select="'javascript'" />
							</xsl:apply-templates>
						</xsl:when>
						<xsl:otherwise>
							<input name="fields[javascript]" type="file" />
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</label>
		</div>
		<div class="field field-checkbox">
			<input name="fields[table-of-contents]" type="hidden" value="no" />
			<label>
				<input name="fields[table-of-contents]" type="checkbox" value="Yes">
					<xsl:choose>
						<xsl:when test="$event[@result = 'error']">
							<xsl:if test="$event[@result = 'error']/post-values/table-of-contents = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="table-of-contents = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					Table of Contents
				</input>
			</label>
		</div>
		<div class="field field-checkbox">
			<input name="fields[syntax-highlighting]" type="hidden" value="no" />
			<label>
				<input name="fields[syntax-highlighting]" type="checkbox" value="Yes">
					<xsl:choose>
						<xsl:when test="$event[@result = 'error']">
							<xsl:if test="$event[@result = 'error']/post-values/syntax-highlighting = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="syntax-highlighting = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					Syntax Highlighting
				</input>
			</label>
		</div>
		<div class="field field-checkbox">
			<input name="fields[custom-html]" type="hidden" value="no" />
			<label>
				<input name="fields[custom-html]" type="checkbox" value="Yes">
					<xsl:choose>
						<xsl:when test="$event[@result = 'error']">
							<xsl:if test="$event[@result = 'error']/post-values/custom-html = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="custom-html = 'Yes'">
								<xsl:attribute name="checked">checked</xsl:attribute>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					Custom HTML
				</input>
			</label>
		</div>
		<input name="fields[author]" type="hidden" value="{$member/@id}" />
		<input name="fields[member]" type="hidden" value="{$member-username}" />
		<input name="fields[date]" type="hidden" value="" />
		<input name="fields[publish]" type="hidden" value="Yes" />
		<xsl:choose>
			<xsl:when test="$b = 'new'">
				<input name="redirect" type="hidden" value="{$root}/{$current-page}/create/new/success/" />
				<input name="action[save-resource]" type="submit" value="Create Resource" />
				<a href="{$root}/{$root-page}/" class="cancel">Cancel</a>
			</xsl:when>
			<xsl:otherwise>
				<input name="redirect" type="hidden" value="{$root}/{$current-page}/{@id}/" />
				<input name="action[save-resource]" type="submit" value="Edit Resource" />
				<a href="{$root}/{$root-page}/{title/@handle}/" class="cancel">Cancel</a>
			</xsl:otherwise>
		</xsl:choose>
	</form>
</xsl:template>

<xsl:template match="*" mode="file">
	<xsl:param name="field-name" select="'css'" />
	<a href="{$workspace}/{@path}/{filename}"><xsl:value-of select="concat('/workspace', @path, '/', filename)" /></a>
	<input name="fields[{$field-name}]" type="hidden" value="{@path}/{filename}" />
</xsl:template>

<xsl:template match="*" mode="private-file">
	<a href="{$current-url}?file={filename}"><xsl:value-of select="concat(@path, '/', filename)" /></a>
	<input name="fields[file]" type="hidden" value="{@path}/{filename}" />
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
		title="Entries tagged with '{.}': {count(/data/resources/entry[tags/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

<xsl:template match="item" mode="topics-menu">
	<li><a href="{$root}/{$current-page}/topic/{@handle}/"
		title="Entries in the '{.}' library: {count(/data/resources/entry[topic/item = current()])}"><xsl:value-of select="." /></a></li>
</xsl:template>

</xsl:stylesheet>