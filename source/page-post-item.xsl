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

	<xsl:param name="index" select="'none'" />
	<xsl:param name="draft" select="'no'" />

	<xsl:template match="g-truc">
		<xsl:param name="filter" select="./post[@index=$index]/meta/tag[1]" />
		<xsl:param name="Post" select="./post" />
		<xsl:param name="DraftPost" select="./draft" />

		<html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
			<xsl:call-template name="g-truc-head">
				<xsl:with-param name="Index" select="$index" />
			</xsl:call-template>

			<!-- Body -->
			<body onload="main();">
				<div class="page">
					<!-- Title -->
					<xsl:call-template name="g-truc-title">
						<xsl:with-param name="filter" select="$filter"/>
					</xsl:call-template>

					<!-- Frame -->
					<xsl:choose>
						<xsl:when test="$draft='yes'">
							<xsl:apply-templates select="$DraftPost[@index=$index]" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="$Post[@index=$index]" />
						</xsl:otherwise>
					</xsl:choose>
				</div>

				<xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="draft">
		<xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project" />
		<xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />

		<xsl:param name="Item" select="$Template/item" />
		<xsl:param name="Filter" select="../post[@index=$index]/meta/tag" />

		<div xmlns="http://www.w3.org/1999/xhtml" class="post-frame">
			<h2>
				<xsl:value-of select="./@date"/>
				<xsl:text> </xsl:text>
				<a href="{concat($Item[$Filter=@name]/address[@type='main']/@url, $ANCHOR_MENU_LINK)}">
					<xsl:value-of select="./@title" />
				</a>
			</h2>
			<xsl:call-template name="share">
				<xsl:with-param name="title" select="./@title"/>
				<xsl:with-param name="href" select="concat($WEBSITE_URL, $URL_POST_TOKEN, ./@index, $URL_HTML_TOKEN)"/>
				<xsl:with-param name="Type" select="./meta/tag[1]" />
			</xsl:call-template>

			<xsl:if test="./album/slide">
				<div class="slideshow">
					<embed
						type="application/x-shockwave-flash"
						src="https://picasaweb.google.com/s/c/bin/slideshow.swf"
						width="800" height="533"
						flashvars="{./album/slide/@href}"
						pluginspage="http://www.macromedia.com/go/getflashplayer">
					</embed>
				</div>
			</xsl:if>

			<xsl:apply-templates />
		</div>

		<xsl:call-template name="post-browse">
			<xsl:with-param name="Post" select="." />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="post-title">
		<xsl:param name="Post" />
		<xsl:param name="Theme" />

		<xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project" />
		<xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />
		<xsl:param name="Item" select="$Template/item" />
		<xsl:param name="Filter" select="$Post/../post[@index=$index]/meta/tag" />

		<h2 xmlns="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="$Post/@date"/>
			<xsl:text> </xsl:text>
			<a href="{concat($Item[$Filter=@name]/address[@type='main']/@url, $ANCHOR_MENU_LINK)}" class="{$Theme}">
				<xsl:value-of select="$Post/@title" />
			</a>
		</h2>

		<xsl:call-template name="share">
			<xsl:with-param name="Theme" select="$Theme"/>
			<xsl:with-param name="title" select="$Post/@title"/>
			<xsl:with-param name="href" select="concat($WEBSITE_URL, $URL_POST_TOKEN, $Post/@index, $URL_HTML_TOKEN)"/>
			<xsl:with-param name="Type" select="$Post/meta/tag[1]" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="post">
		<xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project" />
		<xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />
		<xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />

		<xsl:param name="Item" select="$Template/item" />
		<xsl:param name="Filter" select="../post[@index=$index]/meta/tag" />

		<xsl:choose>
			<xsl:when test="./meta/tag='gtc-crea-photograph'">
				<div class="post-frame-content-photo" id="{$ANCHOR_PICTURE_NAME}">
				<xsl:call-template name="post-title">
				  <xsl:with-param name="Post" select="." />
				  <xsl:with-param name="Theme" select="'dark'" />
				</xsl:call-template>
				</div>

				<div class="post-frame-photo">
				<xsl:apply-templates select="." mode="photo-menu-index" />
				<br />
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div xmlns="http://www.w3.org/1999/xhtml" class="post-frame">

				<xsl:call-template name="post-title">
					<xsl:with-param name="Post" select="." />
					<xsl:with-param name="Theme" select="'light'" />
				</xsl:call-template>

				<xsl:apply-templates />
				</div>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="./meta/tag='gtc-crea-photograph'">
				<div xmlns="http://www.w3.org/1999/xhtml" class="post-browse">
					<xsl:variable name="next-index" select="./preceding-sibling::post[./meta/tag='gtc-crea-photograph'][position()=1]/@index" />
					<xsl:variable name="prev-index" select="./following-sibling::post[./meta/tag='gtc-crea-photograph'][position()=1]/@index" />

					<xsl:variable name="curr-index" select="@index" />

					<xsl:if test="$Post/../post[@index=$next-index]">
						<div class="post-next-text">
							<a class="post-next-text" href="{concat($URL_POST_TOKEN, $next-index, $URL_HTML_TOKEN, $ANCHOR_PICTURE_LINK)}">
							<xsl:value-of select="$Post/../post[@index=$next-index]/@title" />
							<xsl:text> &gt;</xsl:text>
							</a>
						</div>
						</xsl:if>

						<xsl:if test="$Post/../post[@index=$prev-index]">
						<div class="post-prev-text">
							<a class="post-prev-text" href="{concat($URL_POST_TOKEN, $prev-index, $URL_HTML_TOKEN, $ANCHOR_PICTURE_LINK)}"> 
								<xsl:text>&lt; </xsl:text>
								<xsl:value-of select="$Post/../post[@index=$prev-index]/@title" />
								</a>
						</div>
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="post-browse">
					<xsl:with-param name="Post" select="." />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="post-browse">
		<xsl:param name="Post" />

		<div xmlns="http://www.w3.org/1999/xhtml" class="post-browse">
			<xsl:variable name="next-index" select="$Post/preceding-sibling::post[starts-with(./meta/tag, 'gtc-tech')][position()=1]/@index" />
			<xsl:variable name="prev-index" select="$Post/following-sibling::post[starts-with(./meta/tag, 'gtc-tech')][position()=1]/@index" />

			<xsl:variable name="curr-index" select="@index" />

			<xsl:if test="$Post/../post[@index=$next-index]">
				<div class="post-next-text">
					<a class="post-next-text" href="{concat($URL_POST_TOKEN, $next-index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)}">
						<xsl:value-of select="$Post/../post[@index=$next-index]/@title" />
						<xsl:text> &gt;</xsl:text>
					</a>
				</div>
			</xsl:if>

			<xsl:if test="$Post/../post[@index=$prev-index]">
				<div class="post-prev-text">
					<a class="post-prev-text" href="{concat($URL_POST_TOKEN, $prev-index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)}">
						<xsl:text>&lt; </xsl:text>
						<xsl:value-of select="$Post/../post[@index=$prev-index]/@title" />
					</a>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

</xsl:stylesheet>
