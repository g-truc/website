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
		<xsl:variable name="Download" select="document($FILE_DOWN)/g-truc/download" />

		<html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
			<xsl:call-template name="g-truc-head">
				<xsl:with-param name="Title" select="'Photography'" />
			</xsl:call-template>

			<!-- Body -->
			<body>
				<div class="page">
					<!-- Head -->
					<xsl:call-template name="g-truc-title">
						<xsl:with-param name="filter" select="$FILTER_CREA_TOKEN"/>
					</xsl:call-template>

					<!-- Frame -->
					<div class="post-frame-photo">
						<xsl:apply-templates select="$Post[./meta/tag[.=$post-other-photography-album-id]][1]" mode="photo-menu-index" />
						<xsl:apply-templates select="$Post[./meta/tag[.=$post-other-photography-album-id]]" mode="index-photo" />
					</div>
				</div>

				<xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="post" mode="index-photo">
		<xsl:if test="./album">
			<a xmlns="http://www.w3.org/1999/xhtml" href="{concat($URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN)}" class="page-index-photo" style="{concat('background-image:url(', ./album/preview/@pic144, ');')}">
				<xsl:text>♥</xsl:text>
			</a>
		</xsl:if>
	</xsl:template>

	<xsl:template match="post" mode="photo-menu-index">
		<div xmlns="http://www.w3.org/1999/xhtml" class="slideshow">
			<embed
				 type="application/x-shockwave-flash"
				 src="https://picasaweb.google.com/s/c/bin/slideshow.swf"
				 width="960" height="640"
				 flashvars="{./album/slide/@href}"
				 pluginspage="http://www.macromedia.com/go/getflashplayer">
			</embed>
		</div>

	</xsl:template>

</xsl:stylesheet>
