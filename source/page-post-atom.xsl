<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="util-constants.xsl" />
	<xsl:include href="util.xsl" />
	<xsl:include href="util-atom.xsl" />
	<xsl:include href="util-title.xsl" />
	<xsl:include href="util-directory.xsl" />

	<xsl:param name="Filter" select="'none'" />

	<xsl:template match="g-truc">
    <xsl:param name="Style" select="document($FILE_TMPL)/g-truc/theme[@name=$THEME_NAME_ORANGE]/style" />
    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />

    <xsl:apply-templates select="$Style" />

    <feed xmlns="http://www.w3.org/2005/Atom">
			<title>
				<xsl:value-of select="$WEBSITE_TITLE" />
				<xsl:text> - </xsl:text>
				<xsl:value-of select="$Item[./@name=$Filter]/@title" />
			</title>
			<subtitle>
				<xsl:value-of select="$WEBSITE_TITLE" />
				<xsl:text> - </xsl:text>
				<xsl:value-of select="$Item[./@name=$Filter]/@title" />
			</subtitle>
			<link rel="self" type="application/atom+xml" href="{concat($WEBSITE_URL, $Item[./@name=$Filter]/address[@type='atom']/@url)}" />
      <xsl:choose>
        <xsl:when test="contains($Filter, $FILTER_CREA_TOKEN)">
          <link rel="alternate"	type="text/html" lang="en" href="{concat($WEBSITE_URL, 'index-crea.html')}"/>
        </xsl:when>
        <xsl:when test="contains($Filter, $FILTER_TECH_TOKEN)">
          <link rel="alternate"	type="text/html" lang="en" href="{concat($WEBSITE_URL, 'index-tech.html')}"/>
        </xsl:when>
        <xsl:otherwise>
          <link rel="alternate"	type="text/html" lang="en" href="{concat($WEBSITE_URL, 'index.html')}"/>
        </xsl:otherwise>
      </xsl:choose>
      <id>
				<xsl:value-of select="concat($WEBSITE_URL, $URL_POST_TOKEN, ./post[1]/@index, $URL_HTML_TOKEN)" />
			</id>
			<updated>
				<xsl:value-of select="./post[1]/@std-date" />
			</updated>
			<author>
				<name>
					<xsl:value-of select="$WEBSITE_AUTHOR" />
				</name>
			</author>

			<xsl:apply-templates select="./post[./meta/tag[starts-with(., $Filter)]][10>=position()]" mode="atom" />
		</feed>
	</xsl:template>

  <xsl:template match="style">
    <xsl:processing-instruction name="xml-stylesheet">
      <xsl:text>href="</xsl:text>
      <xsl:value-of select="." />
      <xsl:text>" type="text/css"</xsl:text>
    </xsl:processing-instruction>
  </xsl:template>

  <xsl:template match="post" mode="atom">
    <xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />
    <xsl:param name="Item" select="$Template/item" />

		<entry xmlns="http://www.w3.org/2005/Atom">
			<title>
				<xsl:value-of select="./@title"/>
			</title>
			<link lang="en" rel="self" type="application/atom+xml" href="{concat($WEBSITE_URL, $Item[./@name=$Filter]/address[@type='atom']/@url)}" />
			<link lang="en" rel="alternate" type="text/html" href="{concat($WEBSITE_URL, $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN)}"/>
			<id>
				<xsl:value-of select="concat($WEBSITE_URL, $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN)" />
			</id>
			<updated>
				<xsl:value-of select="./@std-date" />
			</updated>
			<content type="xhtml" xml:lang="en">
				<div xmlns="http://www.w3.org/1999/xhtml" class="atom-content">
					<xsl:apply-templates />
				</div>
				<xsl:call-template name="share">
					<xsl:with-param name="title" select="./@title"/>
					<xsl:with-param name="href" select="concat($WEBSITE_URL, $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN)"/>
				</xsl:call-template>
			</content>
		</entry>
	</xsl:template>

</xsl:stylesheet>
