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
    <xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />
    
    <html xmlns="http://www.w3.org/1999/xhtml">
      <!-- Head -->
      <xsl:call-template name="g-truc-head">
        <xsl:with-param name="Title" select="./@title" />
      </xsl:call-template>
      
      <!-- Body -->
      <body>
        <div class="page">
          <!-- Title -->
          <xsl:call-template name="g-truc-title-full">
            <xsl:with-param name="filter" select="$filter"/>
          </xsl:call-template>

          <!-- Frame -->
          <div class="post-frame-photo">
            <!--xsl:apply-templates select="$Post[./meta/tag[.=$post-other-photograph-id]][1]/album/slide" /-->
            <xsl:apply-templates select="$Post[./meta/tag[.=$post-other-photograph-id]][1]" mode="photo-menu-index" />
            <br />
          </div>
        </div>

        <xsl:call-template name="g-truc-foot" />
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
