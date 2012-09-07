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
    <xsl:variable name="Template" select="document($FILE_TMPL)/g-truc" />

    <html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
      <xsl:call-template name="g-truc-head">
        <xsl:with-param name="Title" select="$WEBSITE_AUTHOR" />
      </xsl:call-template>

			<!-- Body -->
			<body>
				<div class="page">
					<!-- Title -->
					<xsl:call-template name="g-truc-title-full">
						<xsl:with-param name="filter" select="$filter"/>
					</xsl:call-template>

					<xsl:apply-templates select="$Template/about" />
				</div>

        <xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="about">
    <div xmlns="http://www.w3.org/1999/xhtml" class="post-frame">
      <h2>
        <xsl:value-of select="$WEBSITE_TITLE" />
		  </h2>
      <xsl:apply-templates />
		</div>
	</xsl:template>

</xsl:stylesheet>
