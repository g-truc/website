<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="item" mode="post-directory">

    <xsl:param name="TypeName" select="./@name" />
    <xsl:param name="Project" select="document($FILE_PROJ)/g-truc/project[$TypeName=./@type]" />
    
    <xsl:choose>
      <xsl:when test="$Project">
        <a xmlns="http://www.w3.org/1999/xhtml" href="{concat($URL_PROJ_TOKEN, $Project/@index, $URL_HTML_TOKEN, $ANCHOR_MENU_LINK)}">
          <xsl:value-of select="./@title" />
        </a>
      </xsl:when>
      <xsl:otherwise>
        <a xmlns="http://www.w3.org/1999/xhtml" href="{concat(./address[@type='main']/@url, $ANCHOR_MENU_LINK)}">
          <xsl:value-of select="./@title" />
        </a>
      </xsl:otherwise>
    </xsl:choose>
	</xsl:template>

	<xsl:template name="display-parent">
		<xsl:param name="Item" />
    <xsl:param name="Template" select="document($FILE_TMPL)/g-truc" />

		<xsl:if test="$Item/@parent">
			<xsl:call-template name="display-parent">
				<xsl:with-param name="Item" select="$Template/item[@name=$Item/@parent]" />
			</xsl:call-template>
			<xsl:text> / </xsl:text>
		</xsl:if>

		<xsl:apply-templates select="$Item" mode="post-directory" />
	</xsl:template>

	<xsl:template name="post-directory">
		<xsl:param name="filter" />

    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />

		<xsl:call-template name="display-parent">
			<xsl:with-param name="Item" select="$Item[./@name=$filter]" />
		</xsl:call-template>
	</xsl:template>

  <xsl:template match="item" mode="post-list-menu">
    <xsl:param name="item-name" select="@name" />

    <xsl:param name="Post" select="document($FILE_POST)/g-truc/post" />
    <xsl:param name="Item" select="document($FILE_TMPL)/g-truc/item" />

    <xsl:if test="not(./options/menu-dev-hidden)">
      <xsl:call-template name="post-list-menu-entry">
        <xsl:with-param name="class" select="concat('post-frame-menu-level', ./@level)" />
        <xsl:with-param name="post-item" select="." />
        <xsl:with-param name="post-count" select="count($Post[./meta/tag[contains(., $item-name)]])" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="post-list-menu-entry">
    <xsl:param name="class" />
    <xsl:param name="post-item" />
    <xsl:param name="post-count" />

    <xsl:value-of select="./@class" />

    <li xmlns="http://www.w3.org/1999/xhtml" class="{$class}">
      <a href="{concat($post-item/address[@type='main']/@url, $ANCHOR_MENU_LINK)}">
        <xsl:value-of select="$post-item/@title" />
      </a>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="$post-count" />
      <xsl:text>)</xsl:text>
    </li>
  </xsl:template>

</xsl:stylesheet>
