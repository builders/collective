<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet.xsl"/>
<xsl:import href="../utilities/list-sites.xsl"/>
<xsl:import href="../utilities/list-resources.xsl"/>
<xsl:import href="../utilities/html-manipulation.xsl"/>

<xsl:param name="count" select="0"/>

<xsl:template match="data" mode="css">
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/main.css?v1.0" />
	<link rel="stylesheet" href="{$workspace}/assets/intranet/css/lists.css?v1.0" />
</xsl:template>

<xsl:template match="data">
	<section class="main">
		<div class="lists content">
			<xsl:choose>
				<xsl:when test="$logged-in = 'true'">
					<h1><xsl:value-of select="member-details/entry/first-name" />&#x2019;s Lists</h1>
					<xsl:call-template name="save-list" />
					<xsl:apply-templates select="lists/entry" mode="list"/>
				</xsl:when>
				<xsl:otherwise>
					<h1>Hello, <xsl:value-of select="$name" /></h1>
					<p>You'll need to log in as a Member to view your lists.</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</section>
</xsl:template>

<xsl:template match="data" mode="aside">
	<aside>
		<nav>
			<xsl:call-template name="login-panel" />
		</nav>
	</aside>
</xsl:template>

<xsl:template name="to-do-list">
	<h3><a href="{$root}/{$current-page}/edit/all/">To Do List</a></h3>
	<xsl:apply-templates select="lists" mode="list"/>
</xsl:template>

<xsl:template match="lists/entry" mode="list">
	<xsl:param name="list-id" select="@id"/>
	<xsl:param name="count" select="sum(preceding-sibling::entry/items/@items)"/>
	<div class="list">
		<h4 class="list-name">
			<a href="{$root}/{$current-page}/edit/list/{@id}/"><xsl:value-of select="list"/></a>
		</h4>
		<xsl:call-template name="save-item">
			<xsl:with-param name="list-id" select="$list-id" />
		</xsl:call-template>
		<form method="post" action="" enctype="multipart/form-data" class="save-items">
			<ul>
				<xsl:apply-templates select="/data/items/list[@link-id = $list-id]/entry" mode="list">
					<xsl:with-param name="count" select="$count"/>
					<xsl:with-param name="list-id" select="$list-id"/>
				</xsl:apply-templates>
			</ul>
			<input name="redirect" type="hidden" value="{$root}/{$current-page}/" />
			<input name="action[save-items]" type="submit" value="Update Items" />
		</form>
	</div>
</xsl:template>

<xsl:template match="/data/items/list/entry" mode="list">
	<xsl:param name="list-id"/>
	<xsl:param name="count"/>
	<xsl:param name="index" select="$count + position() - 1"/>
	<li class="item">
		<input type="hidden" name="fields[{$index}][open]" value="no" />
		<input type="checkbox" name="fields[{$index}][open]" value="yes">
			<xsl:if test="open = 'Yes'">
				<xsl:attribute name="checked">checked</xsl:attribute>
			</xsl:if>
		</input>
		<input name="id[{$index}]" type="hidden" value="{@id}" />
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="$item = @id or ($list = 'list' and $item = $list-id) or $list = 'all'">
				<input type="input" name="fields[{$index}][item]" value="{item}" />
				<input type="hidden" name="fields[{$index}][list]" value="{$list-id}" />
				<input type="hidden" name="fields[{$index}][member]" value="{$cookie-member-id}" />
				<input type="hidden" name="fields[{$index}][member-link]" value="{$cookie-member-id}" />
			</xsl:when>
			<xsl:otherwise>
				<a href="{$root}/{$current-page}/edit/{$list-id}/{@id}/">
					<xsl:value-of select="item"/>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
</xsl:template>

<xsl:template name="save-list">
	<form method="post" action="" enctype="multipart/form-data" class="input-form save-list">
		<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
		<div class="add-input">
			<label for="fields[list]">Add a List</label>
			<input name="fields[list]" type="text" />
		</div>
		<input name="fields[member]" type="hidden" value="{$cookie-member-id}" />
		<input name="action[save-list]" type="submit" value="Submit" />
	</form>
</xsl:template>

<xsl:template name="save-item">
	<xsl:param name="list-id" />
	<form method="post" action="" enctype="multipart/form-data" class="input-form save-item">
		<input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
		<div class="add-input">
			<label for="fields[item]">Add an Item</label>
			<input name="fields[item]" type="text" />
		</div>
		<input name="fields[list]" type="hidden" value="{$list-id}" />
		<input name="fields[member]" type="hidden" value="{$cookie-member-id}" />
		<input name="fields[member-link]" type="hidden" value="{$cookie-member-id}" />
		<input name="fields[order]" type="hidden" value="" />
		<input name="fields[open]" type="hidden" value="yes" />
		<input name="action[save-item]" type="submit" value="Submit" />
	</form>
</xsl:template>

</xsl:stylesheet>