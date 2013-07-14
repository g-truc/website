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

	<xsl:template match="g-truc">
		<xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project" />

    	<html xmlns="http://www.w3.org/1999/xhtml">
			<!-- Head -->
      		<xsl:call-template name="g-truc-head">
        		<xsl:with-param name="Title" select="$Project[@index=$index]/@name" />
      		</xsl:call-template>

			<!-- Body -->
			<body>
				<div class="page">
					<!-- Title -->
          			<xsl:call-template name="g-truc-title">
            			<xsl:with-param name="filter" select="$Project[@index=$index]/@type"/>
          			</xsl:call-template>

					<!-- Frame -->
					<xsl:apply-templates select="$Project[@index=$index]" mode="filtered-items" />
				</div>

        		<xsl:call-template name="g-truc-foot" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="project" mode="filtered-items">
    <xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />
    <xsl:param name="Download" select="document($FILE_DOWN)/g-truc/download" />
    <xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />
    <xsl:param name="Type" select="./@type" />
    <xsl:param name="ProjectListURL" select="$Template/item[./@name=$Type]/address[./@type='main']/@url" />

    <div xmlns="http://www.w3.org/1999/xhtml" class="post-frame">
		  <h2>
        <xsl:value-of select="./@date-creation"/>
        <xsl:text> - </xsl:text>
        <xsl:choose>
          <xsl:when test="$Download[@type=$Type]">
            <xsl:value-of select="$Download[@type=$Type][1]/@date"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="./@date-update"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="$ProjectListURL">
            <a href="{concat($ProjectListURL, $ANCHOR_MENU_LINK)}">
              <xsl:value-of select="./@name"/>
            </a>            
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="./@name"/>  
          </xsl:otherwise>
        </xsl:choose>
		  </h2>
      <xsl:call-template name="share">
        <xsl:with-param name="title" select="./@name"/>
        <xsl:with-param name="href" select="concat($WEBSITE_URL, $URL_PROJ_TOKEN, ./@index, $URL_HTML_TOKEN)"/>
        <xsl:with-param name="Type" select="$Type" />
      </xsl:call-template>

		  <xsl:apply-templates />

		  <xsl:if test="$Download[@type=$Type]">
        <div class="list-block">
			    <xsl:text>Releases: </xsl:text>
			    <ul class="sourse-list">
				    <xsl:apply-templates select="$Download[@type=$Type]" mode="project" />
			    </ul>
        </div>
		  </xsl:if>

		  <xsl:if test="$Post[./meta/tag[contains(., $Type)]]">
        <div class="list-block">
			    <xsl:text>Posts: </xsl:text>
			    <ul class="sourse-list">
				    <xsl:apply-templates select="$Post[./meta/tag[contains(., $Type)]]" mode="project" />
			    </ul>
        </div>
		  </xsl:if>
    </div>
	</xsl:template>

	<xsl:template match="post" mode="project">
		<li xmlns="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="./@date"/>
			<xsl:text> </xsl:text>
			<a href="{concat($URL_POST_TOKEN, @index, $URL_HTML_TOKEN)}">
				<xsl:value-of select="./@title"/>
			</a>
		</li>
	</xsl:template>

	<xsl:template match="download" mode="project">
		<li xmlns="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="./@date"/>
			<xsl:text> </xsl:text>
			<a href="{./item[1]/@href}">
				<xsl:value-of select="./@title"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="./@version"/>
			</a>
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
