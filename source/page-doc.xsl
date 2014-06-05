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
        <xsl:with-param name="Title" select="'Documents'" />
      </xsl:call-template>

      <!-- Body -->
			<body>
				<div class="page">
					<!-- Title -->
          <xsl:call-template name="g-truc-title">
            <xsl:with-param name="filter" select="$filter"/>
          </xsl:call-template>

          <!-- Frame -->
          <span class="post-frame-list">
            <h2>
              <xsl:text>Published documents</xsl:text>
            </h2>

            <ul>
              <xsl:apply-templates select="./download[./@doc='true']" />
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
  
	<xsl:template match="download">
    <xsl:param name="Download" select="." />
    <xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project[@type=$Download/@type]" />

    <li xmlns="http://www.w3.org/1999/xhtml" class="post-list">
      <xsl:value-of select="./@date"/>
      <xsl:text> </xsl:text>
      <xsl:choose>
        <xsl:when test="./@title">
          <xsl:value-of select="./@title" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$Project/@name" />
          <xsl:text> </xsl:text>
          <xsl:value-of select="./@version" />
        </xsl:otherwise>
      </xsl:choose>
      <xsl:for-each select="./item">
        <xsl:text> (</xsl:text>
        <a href="{./@href}">
          <xsl:value-of select="./@type"/>
          <xsl:if test="./@size">
            <xsl:text>, </xsl:text>
            <xsl:value-of select="./@size"/>
          </xsl:if>
        </a>
        <xsl:text>) </xsl:text>
      </xsl:for-each>
    </li>

	</xsl:template>

</xsl:stylesheet>
