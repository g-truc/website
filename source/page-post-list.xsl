<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="util-constants.xsl" />
	<xsl:include href="util.xsl" />
  <xsl:include href="util-html.xsl" />
  <xsl:include href="util-head.xsl" />
  <xsl:include href="util-webgl.xsl" />
  <xsl:include href="util-foot.xsl" />
  <xsl:include href="util-title.xsl" />
	<xsl:include href="util-directory.xsl" />

	<xsl:template match="g-truc">
		<xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />

		<html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
			<xsl:call-template name="g-truc-head">
				<xsl:with-param name="Title" select="$Item[@name=$filter]/@title" />
			</xsl:call-template>

			<!-- Body -->
			<body>
				<div class="page-search">
					<!-- Title -->
					<xsl:call-template name="g-truc-title">
						<xsl:with-param name="filter" select="$filter"/>
					</xsl:call-template>

					<!-- Frame -->
					<span class="post-frame-list">
					<h2>
						<xsl:call-template name="post-directory">
							<xsl:with-param name="filter" select="$filter" />
						</xsl:call-template>
					</h2>
					<xsl:call-template name="share">
						<xsl:with-param name="title" select="$Item[@name=$filter]/@title"/>
						<xsl:with-param name="href" select="$Item[@name=$filter]/address[./@type='main']/@url"/>
						<xsl:with-param name="Type" select="$Item[@name=$filter]/@name"/>
					</xsl:call-template>

					<ul>
						<xsl:apply-templates select="./post[./meta/tag[contains(., $filter)]]" />
					</ul>
					</span>
					<ul class="post-frame-menu">
					<li class="post-frame-menu-level0">
						<a href="{concat('search.html', $ANCHOR_MENU_LINK)}">
							<xsl:text>Search</xsl:text>
						</a>
					</li>
					<xsl:apply-templates select="$Item" mode="post-list-menu" />
					</ul>
				</div>

				<!-- Footer -->
				<xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="post">
		<xsl:if test="./meta/tag[contains(., $filter)]">
			<li xmlns="http://www.w3.org/1999/xhtml" class="post-list">
				<xsl:value-of select="./@date"/>
				<xsl:text> </xsl:text>
				<a href="{concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)}">
					<xsl:value-of select="./@title"/>
				</a>
			</li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
